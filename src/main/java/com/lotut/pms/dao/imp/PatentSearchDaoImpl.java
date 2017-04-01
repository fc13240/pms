package com.lotut.pms.dao.imp;

import static com.mongodb.client.model.Filters.in;
import static org.elasticsearch.index.query.FilterBuilders.termFilter;
import static org.elasticsearch.index.query.QueryBuilders.boolQuery;
import static org.elasticsearch.index.query.QueryBuilders.matchPhraseQuery;
import static org.elasticsearch.index.query.QueryBuilders.queryStringQuery;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.bson.Document;
import org.bson.types.ObjectId;
import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.sort.SortOrder;

import com.lotut.pms.dao.PatentSearchDao;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.Patent;
import com.lotut.pms.domain.PatentType;
import com.lotut.pms.util.SearchFieldUtils;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

public class PatentSearchDaoImpl implements PatentSearchDao {
	private static final int DEFAULT_SLOP = 5;
	private static final int DEFAULT_EXACT_MATCH_MIN_LENGTH = 3;
	private MongoClient mongoClient;
	private Client esClient;
	
	public PatentSearchDaoImpl(MongoClient mongoClient, Client esClient) {
		this.mongoClient = mongoClient;
		this.esClient = esClient;
	}
	
	@Override
	public List<Patent> search(String keyword,Page page) {
		List<String> docIds = searchPatents(keyword,page);
		List<Document> docs = getPatentsByIds(docIds);
		List<Patent> patents = convertDocsToPatents(docs);
		return patents;
	}
	

	private List<String> searchPatents(String keyword,Page page) {
		List<String> docIds = new ArrayList<>();
		SearchRequestBuilder requestBuilder = esClient.prepareSearch("pss")
				.setTypes("patent");
		
		if (keyword.length() <= DEFAULT_EXACT_MATCH_MIN_LENGTH) {
			keyword = "\"" + keyword + "\"";
			requestBuilder.setQuery(queryStringQuery(keyword)
									.field("appPerson", 2)
									.field("patentName", 1)
									.field("proxyOrg", 4));
		} else if (SearchFieldUtils.isAppNo(keyword)) {
			requestBuilder.setPostFilter(termFilter("appNo", SearchFieldUtils.getAppNo(keyword)));
		} else {
			requestBuilder.setQuery(boolQuery()
					.should(matchPhraseQuery("appPerson", keyword).boost(2).slop(DEFAULT_SLOP))
					.should(matchPhraseQuery("patentName", keyword).slop(DEFAULT_SLOP))
					.should(matchPhraseQuery("proxyOrg", keyword).boost(4).slop(DEFAULT_SLOP))
					);
			
		}
		
		requestBuilder.setFetchSource(false);
		if ((page.getCurrentPage() > 0) && (page.getPageSize() > 0)) {
			requestBuilder.setFrom(page.getStartIndex());
			requestBuilder.setSize(page.getPageSize());
		}
		requestBuilder.addSort("_score", SortOrder.DESC);
		requestBuilder.addSort("appDate", SortOrder.DESC);

		
		
		
		SearchResponse searchResponse = requestBuilder.execute().actionGet();
		System.out.println("搜索用时 " + searchResponse.getTookInMillis() / 1000.0 + " 秒");
		System.out.println(searchResponse.getHits().getTotalHits() + "个匹配文档");
		
		int totalCount=(int)searchResponse.getHits().getTotalHits();
		page.setTotalRecords(totalCount);

		
		
		SearchHit[] hits = searchResponse.getHits().getHits();
		for (SearchHit hit: hits) {
			docIds.add(hit.getId());
		}
		
		return docIds;
	}
	
	private List<Document> getPatentsByIds(List<String> docIds) {
		List<ObjectId> objectIds = new ArrayList<>(docIds.size());
		for (String docId: docIds) {
			objectIds.add(new ObjectId(docId));
		}
		MongoDatabase db = mongoClient.getDatabase("sopatent");
		MongoCollection<Document> collection = db.getCollection("patent");
		List<Document> docs = collection.find(in("_id", objectIds)).into(new ArrayList<Document>());
		List<Document> sortedDocs = new ArrayList<>(docs.size());
		Map<String, Document> docMap = new HashMap<>(docs.size());
		for (Document doc: docs) {
			docMap.put(doc.getObjectId("_id").toHexString(), doc);
		}
		for (String docId: docIds) {
			sortedDocs.add(docMap.get(docId));
		}
		
		return sortedDocs;
	}
	
	private List<Patent> convertDocsToPatents(List<Document> docs) {
		List<Patent> patents = new ArrayList<>(docs.size());
		for (Document doc: docs) {
			Patent patent = convertDocToPatent(doc);
			patents.add(patent);
		}
		return patents;
	}
	
	private Patent convertDocToPatent(Document doc) {
		Patent patent = new Patent();
		patent.setObjectId(doc.getObjectId("_id"));
		patent.setAppNo(doc.getString("appNo"));
		patent.setPublishNo(doc.getString("publishNo"));
		patent.setName(doc.getString("patentName"));
		patent.setPatentType(getPatentType(doc.getString("patentType")));
		patent.setPublishDate(doc.getDate("publishDate"));
		patent.setAppDate(doc.getDate("appDate"));
		patent.setAppPerson(array2Str(doc, "appPerson"));
		patent.setInventPerson(array2Str(doc, "inventPerson"));
		patent.setProxyOrg(doc.getString("proxyOrg"));
		
		return patent;
	}
	
	@SuppressWarnings("unchecked")
	private String array2Str(Document doc, String fieldName) {
		ArrayList<String> values = doc.get(fieldName, ArrayList.class);
		if (values != null && !values.isEmpty()) {
			return String.join(";", values);
		}
		
		return null;
	}
	
	private String getSubField(Document doc, String parentField, String subField) {
		Document subDoc = doc.get(parentField, Document.class);
		if (subDoc == null) {
			return null;
		}
		
		return subDoc.getString(subField);
	}
	
	private static PatentType getPatentType(String patentTypeDescription) {
		final String INVENT_TYPE = "发明";
		final String PRACTICAL_TYPE = "实用";
		final String INTERFACE_TYPE = "外观";
		
		if (patentTypeDescription == null) {
			return null;
		}
		
		if (patentTypeDescription.contains(INVENT_TYPE)) {
			return new PatentType(1, INVENT_TYPE);
		} else if (patentTypeDescription.contains(PRACTICAL_TYPE)) {
			return new PatentType(2, PRACTICAL_TYPE);
		} else if (patentTypeDescription.contains(INTERFACE_TYPE)) {
			return new PatentType(3, INTERFACE_TYPE);
		} else {
			return null;
		}
	}
}