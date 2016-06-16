package com.lotut.pms.dao.imp;

import static com.mongodb.client.model.Filters.in;

import java.util.ArrayList;
import java.util.List;

import org.bson.Document;
import org.bson.types.ObjectId;

import com.lotut.pms.dao.PatentMongoDao;
import com.lotut.pms.domain.Patent;
import com.lotut.pms.domain.PatentStatus;
import com.lotut.pms.domain.PatentType;
import com.lotut.pms.util.PrincipalUtils;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

public class PatentMongoDaoImpl implements PatentMongoDao{
	
	private MongoClient client;
	
	public PatentMongoDaoImpl(MongoClient client) {
		this.client = client;
		
	}
	@Override
	public List<Patent> getPatentsByIds(List<String> ids) {
		MongoDatabase db = client.getDatabase("sopatent");
		MongoCollection<Document> collection = db.getCollection("patent");
		List<ObjectId> objectIds = new ArrayList<>(ids.size());
		for (String docId: ids) {
			objectIds.add(new ObjectId(docId));
		}
		List<Document> docs = collection.find(in("_id", objectIds)).into(new ArrayList<Document>());
		List<Patent> patents = convertDocsToPatents(docs);
		return patents;
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
		patent.setAppNo(getAppNo(doc.getString("appNo")));
		patent.setPublishNo(doc.getString("publishNo"));
		patent.setName(doc.getString("patentName"));
		patent.setPatentType(getPatentType(doc.getString("patentType")));
		patent.setPublishDate(doc.getDate("publishDate"));
		patent.setAppDate(doc.getDate("appDate"));
		patent.setPublishDate(doc.getDate("publishDate"));
		patent.setAppPerson(array2Str(doc, "appPerson"));
		patent.setInventPerson(array2Str(doc, "inventPerson"));
		patent.setPatentStatus(getPatentStatus(doc.getString("status")));
		int userId = PrincipalUtils.getCurrentUserId();
		patent.setOwnerId(userId);
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
	private String getAppNo(String str){
		if (str != null) {
			return str.replaceAll("\\.", "").trim();
		}
		
		return null;
	}
	
	
	private static PatentType getPatentType(String patentTypeDescription) {
		final String INVENT_TYPE = "发明";
		final String PRACTICAL_TYPE = "实用";
		final String INTERFACE_TYPE = "外观";
		
		if (patentTypeDescription == null) {
			return null;
		}
		
		if (patentTypeDescription.contains(INVENT_TYPE)) {
			return new PatentType(1);
		} else if (patentTypeDescription.contains(PRACTICAL_TYPE)) {
			return new PatentType(2);
		} else if (patentTypeDescription.contains(INTERFACE_TYPE)) {
			return new PatentType(3);
		} else {
			return null;
		}
	}
	
	
	private static PatentStatus getPatentStatus(String patentStatusDescription) {

		if (patentStatusDescription == null) {
			return null;
		}
		
		if (patentStatusDescription.contains("申请费")) {
			return new PatentStatus(1);
		} else if (patentStatusDescription.contains("答复")) {
			return new PatentStatus(2);
		} else if (patentStatusDescription.contains("登记费")) {
			return new PatentStatus(3);
		} else if(patentStatusDescription.contains("恢复")){
			return new PatentStatus(4);
		}else if(patentStatusDescription.contains("失效")){
			return new PatentStatus(5);
		}else if(patentStatusDescription.contains("维持")){
			return new PatentStatus(6);
		}else{
			return new PatentStatus(7);
		}
	}
}
