package com.lotut.pms.web.util;
import java.io.IOException;
import java.net.URI;
import java.util.ArrayList;  
import java.util.List;  
  
import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;  
import org.apache.commons.httpclient.Header;  
import org.apache.commons.httpclient.HttpClient;  
import org.apache.commons.httpclient.HttpException;  
import org.apache.commons.httpclient.HttpStatus;  
import org.apache.commons.httpclient.UsernamePasswordCredentials;  
import org.apache.commons.httpclient.auth.AuthScope;  
import org.apache.commons.httpclient.methods.GetMethod;  
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.config.Registry;
import org.apache.http.config.RegistryBuilder;
import org.apache.http.conn.socket.ConnectionSocketFactory;
import org.apache.http.conn.socket.PlainConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.conn.DefaultProxyRoutePlanner;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.util.EntityUtils;

public class HttpClientUse {
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
		        try {
		        	Registry<ConnectionSocketFactory> socketFactoryRegistry = RegistryBuilder.<ConnectionSocketFactory>create()  
		        	           .register("http", PlainConnectionSocketFactory.INSTANCE)  
		        	           .build();
		        	 PoolingHttpClientConnectionManager connManager = new PoolingHttpClientConnectionManager(socketFactoryRegistry);  
		             HttpClients.custom().setConnectionManager(connManager); 
		        	CloseableHttpClient client = proxy("115.231.105.109", 8081).setConnectionManager(connManager).build(); 
		        	
		        	//CloseableHttpClient httpClient = HttpClients.createDefault();
					HttpGet httpget = new HttpGet(uri);
					String html = client.execute(httpget, feeResponseHanlder);
					return html;
		        }catch (Exception e) {
		        	throw new FeeRetrieveError(e);
				}
			} catch (Exception e) {
				throw new FeeRetrieveError(e);
			}
		}
	
	/** 
	 * 设置代理 
	 * @param builder 
	 * @param hostOrIP 
	 * @param port ("14.210.82.78", 808)
	 */  
	public static HttpClientBuilder proxy(String hostOrIP, int port){  
	    // 依次是代理地址，代理端口号，协议类型    
	    HttpHost proxy = new HttpHost(hostOrIP, port, "http");    
	    DefaultProxyRoutePlanner routePlanner = new DefaultProxyRoutePlanner(proxy);  
	    return HttpClients.custom().setRoutePlanner(routePlanner);  
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
	
	
	private static class FeeRetrieveError extends RuntimeException {
		private static final long serialVersionUID = 4944536161980068712L;
		
		public FeeRetrieveError(String message) {
			super(message);
		}
		
	    public FeeRetrieveError(Throwable cause) {
	        super(cause);
	    }
	}
	
	public static void main(String[] args) {
		System.out.println(grabFeeHtml("2016205340019",true));
	}
}
