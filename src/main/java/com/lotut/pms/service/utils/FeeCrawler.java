package com.lotut.pms.service.utils;

import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.lotut.pms.domain.Patent;
import com.mchange.v2.cfg.PropertiesConfigSource.Parse;

public class FeeCrawler {
	private List<Patent> patents;
	private List<Patent> failedPatents = new ArrayList<>();
	private Map<Patent, List<List<String>>> shouldPayRecordsMap = new HashMap<>();
	private Map<Patent, List<List<String>>> paidRecordsMap = new HashMap<>();
	private List<Patent> emptyFeePatents = new ArrayList<>();
	
	public FeeCrawler(List<Patent> patents) {
		this.patents = patents;
	}

	public List<Patent> getFailedPatents() {
		return failedPatents;
	}

	public Map<Patent, List<List<String>>> getShouldPayRecordsMap() {
		return shouldPayRecordsMap;
	}

	public Map<Patent, List<List<String>>> getPaidRecordsMap() {
		return paidRecordsMap;
	}

	public List<Patent> getEmptyFeePatents() {
		return emptyFeePatents;
	}
	
	public void grabFees() {
		for (Patent patent: patents) {
			try {
				Map<String, List<List<String>>> feeRecordsMap = getFeeRecords(patent);
				boolean hasFeeRecords = (feeRecordsMap.get("shouldPay") != null && !feeRecordsMap.get("shouldPay").isEmpty()) ||
						(feeRecordsMap.get("paid") != null && !feeRecordsMap.get("paid").isEmpty());
				if (hasFeeRecords) {
					shouldPayRecordsMap.put(patent, feeRecordsMap.get("shouldPay"));
					paidRecordsMap.put(patent, feeRecordsMap.get("paid"));
				} else {
					emptyFeePatents.add(patent);
				}
			} catch (EmptyFeeRecordException e) {
				emptyFeePatents.add(patent);
			} catch (FeeRetrieveError e) {
				failedPatents.add(patent);
			} catch (Exception e) {
				failedPatents.add(patent);
			}
		}
	}
	
		
	
	
	private Map<String, List<List<String>>> getFeeRecords(Patent patent) {
		Map<String, List<List<String>>> feeRecordsMap = new HashMap<>();
		int retryCount = 3;
		
		while (retryCount > 0) {
			try {
				try {
					String html = grabFeeHtml2(patent.getAppNo(), false);
					if (html != null) {
						feeRecordsMap = parseHtml(html);
					}
					
					if (!feeRecordsMap.isEmpty()) {
						return feeRecordsMap;
					}
				} catch (EmptyFeeRecordException e) {
					String html = grabFeeHtml2(patent.getAppNo(), true);
					if (html != null) {
						feeRecordsMap = parseHtml(html);
					}
					
					if (!feeRecordsMap.isEmpty()) {
						return feeRecordsMap;
					}
				} 
			} catch (Exception e) {
				retryCount--;
				if (retryCount == 0) {
					throw new FeeRetrieveError(e);
				}
			}
		}
		return feeRecordsMap;
	}
	
	private Map<String, List<List<String>>> parseHtml(String html) {
		String feeTrPath = "div#djfid table tr";
		String paidFeeTrPath = "div#yjfid table tr";
		String spanPath = "span";
		Map<String, List<List<String>>> feeRecordsMap = new HashMap<>();
		
		Document doc = Jsoup.parse(html);
		Elements shouldPayTrElems = doc.select(feeTrPath);
		Elements paidFeeTrElems = doc.select(paidFeeTrPath);
		
		List<List<String>> shouldPayRecords = new ArrayList<>();
		List<List<String>> paidRecords = new ArrayList<>();
		
		Elements spanElems = doc.select(spanPath);
		Element randSpanElem = spanElems.last();
		String randSpanId = randSpanElem.attr("id");
		
		if (randSpanId == "" || randSpanId.contains("Undefined Attribute")) {
			throw new EmptyFeeRecordException();
		}
		
		String[] showSpanIds = getShowSpanIds(randSpanId);
		
		shouldPayRecords = extractFeeRecordsFromElems(shouldPayTrElems, showSpanIds);
		paidRecords = extractFeeRecordsFromElems(paidFeeTrElems, showSpanIds);
		
		feeRecordsMap.put("shouldPay", shouldPayRecords);
		feeRecordsMap.put("paid", paidRecords);
		System.out.println(feeRecordsMap);
		return feeRecordsMap;
	}
	
	private List<List<String>> extractFeeRecordsFromElems(Elements feeTrElems, String[] showSpanIds) {
		List<List<String>> feeRecords = new ArrayList<>();
		
		for (Element feeRecordTrElem: feeTrElems) {
			List<String> feeRecord = new ArrayList<>();
			Elements feeTdElemes = feeRecordTrElem.select("td");
			
			for (Element feeTd: feeTdElemes) {
				Elements spanElems = feeTd.select("span");
				StringBuilder sbuilder = new StringBuilder();
				
				for (Element spanElem: spanElems) {
					if (isShowSpan(spanElem.attr("id"), showSpanIds)) {
						sbuilder.append(spanElem.text());
					}
				}
				
				feeRecord.add(sbuilder.toString());
			}
			
			if (!feeRecord.isEmpty()) {
				feeRecords.add(feeRecord);
			}
		}
		
		return feeRecords;
	}
	
	private boolean isShowSpan(String spanId, String[] showSpanIds) {
		for (String showSpanId: showSpanIds) {
			if (showSpanId.equals(spanId)) {
				return true;
			}
		}
		
		return false;
	}
	
	private String[] getShowSpanIds(String randSpanId) {
		StringBuilder b2 = new StringBuilder();
		int b4 = 0;
		String b5 = randSpanId;
		
		for (int b3 = 0; b3 < b5.length(); b3+=2) {
			if (b4 > 255) {
				b4 = 0;
			}
			
			int b1 = Integer.parseInt(b5.substring(b3, b3+2), 16) ^ b4;
			b4 += 1;
			b2.append(Character.toChars(b1));
		}
		
		return b2.toString().split(",");
	}
	
	public static  String grabFeeHtml(String appNo, boolean isUnpublisedPatent) {
		final String host = "cpquery.sipo.gov.cn";
		final String feeQueryPath = "/txnQueryFeeData.do";
		URIBuilder uriBuilder = new URIBuilder()
				.setScheme("http")
				.setHost(host)
				.setPath(feeQueryPath)
				.setParameter("select-key:shenqingh", appNo);
		
		try {
			URI uri = null;
			
			if (isUnpublisedPatent) {
				// 查询未公开专利时需要添加'select-key:gonggaobj'参数
				uri = uriBuilder.setParameter("select-key:gonggaobj", "0").build();
			} else {
				uri = uriBuilder.build();
			}
			
			ResponseHandler<String> feeResponseHanlder = new FeeResponseHandler();
	        try (CloseableHttpClient httpClient = HttpClients.createDefault();) {
				HttpGet httpget = new HttpGet(uri);
				String html = httpClient.execute(httpget, feeResponseHanlder);
				return html;
	        }
		} catch (Exception e) {
			throw new FeeRetrieveError(e);
		}
	}
	
	
	public static  String grabFeeHtml2(String appNo, boolean isUnpublisedPatent) {
		final String host = "www.yhzlpt.com";
		final String feeQueryPath = "/spiderFee/getFeeByAppNo.html";
		URIBuilder uriBuilder = new URIBuilder()
				.setScheme("http")
				.setHost(host)
				.setPath(feeQueryPath)
				.setParameter("appNo", appNo);
		
		try {
			URI uri = null;
				uri = uriBuilder.build();
			ResponseHandler<String> feeResponseHanlder = new FeeResponseHandler();
	        try (CloseableHttpClient httpClient = HttpClients.createDefault();) {
				HttpGet httpget = new HttpGet(uri);
				String html = httpClient.execute(httpget, feeResponseHanlder);
				return html;
	        }
		} catch (Exception e) {
			throw new FeeRetrieveError(e);
		}
	}
	
	private static class FeeResponseHandler implements ResponseHandler<String> {
        @Override
        public String handleResponse(
                final HttpResponse response) throws IOException {
            int status = response.getStatusLine().getStatusCode();
            if (status >= 200 && status < 300) {
                HttpEntity entity = response.getEntity();
                
                if (entity == null) {
                	throw new FeeRetrieveError("The result html is empty.");
                }
                
                return EntityUtils.toString(entity, "utf-8");
            } else {
                throw new IOException("Unexpected response status: " + status);
            }
        }	
	}
	
	private static class EmptyFeeRecordException extends RuntimeException {
		private static final long serialVersionUID = 4944536161980068712L;
	}
	
	private static class FeeRetrieveError extends RuntimeException {
		private static final long serialVersionUID = 4944536161980068712L;
		
		public FeeRetrieveError(String message) {
			super(message);
		}
		
	    public FeeRetrieveError(Throwable cause) {
	        super(cause);
	    }
	}	
//	public static Map<String, List<List<String>>> main(String[] args) throws Exception {
//		String appNo="87216690";
//		String html=grabFeeHtml(appNo , false);
//		return parseHtml(html);
//		
//		
//	}
	
	public static void main(String[] args) {
		/*List<Patent> patents = new ArrayList<>();
		Patent p = new Patent();
		p.setAppNo("2016205340019");
		patents.add(p);
		FeeCrawler fc = new FeeCrawler(patents);
		fc.grabFees();*/
		//System.out.println(grabFeeHtml2("2016205340019",true));
		//System.out.println(grabInputStream("341222198912126576","1234566"));
	}
	
	
	
	
	
}
