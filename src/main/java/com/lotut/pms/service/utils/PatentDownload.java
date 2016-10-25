package com.lotut.pms.service.utils;

import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.config.CookieSpecs;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicHeader;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;


public class PatentDownload {
	private static final String LOGIN_URL = "http://cpquery.sipo.gov.cn/txn999999.ajax?usertype=2";
	private static final String PATENT_DOWNLOAD_PATH = "http://cpquery.sipo.gov.cn/txnDownFiles.do";


	
	public static void main(String[] args) throws Exception {
		
	try (BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream("d:/test.xls"));
				InputStream in = downloadPatentExcelFile("341222198912126576", "1234566");) 
		{
			byte[] bytes = new byte[4096];
			int bytesRead = 0;
			while ((bytesRead = in.read(bytes)) > 0) {
				out.write(bytes, 0, bytesRead);
			}
		}
	}
	
	public static InputStream downloadPatentExcelFile(String username,String password) throws Exception {
		RequestConfig globalConfig = RequestConfig.custom().setCookieSpec(CookieSpecs.STANDARD).build();
		try (CloseableHttpClient httpClient = HttpClients.custom().setDefaultRequestConfig(globalConfig).build();) {
			boolean loginSuccess = login(httpClient,username,password);
			System.out.println(loginSuccess);

			if (!loginSuccess) {
				throw new IOException("Cannot login, retry later");
			}

			HttpGet patentDownloadRequest = new HttpGet(PATENT_DOWNLOAD_PATH);
			
			ResponseHandler<InputStream> patentDownloadHandler = new ExcelResponseHandler();
			InputStream excelInputStream = httpClient.execute(patentDownloadRequest, patentDownloadHandler);
			return excelInputStream;
		}
	}
	
	public static Boolean login(CloseableHttpClient httpClient,String username,String password) throws ClientProtocolException, IOException {
		HttpPost loginRequest = new HttpPost(LOGIN_URL);
		loginRequest.addHeader(new BasicHeader("X-Requested-With", "XMLHttpRequest"));
		List<NameValuePair> params = new ArrayList<>();
		params.add(new BasicNameValuePair("username", username));
		params.add(new BasicNameValuePair("password", password));
		params.add(new BasicNameValuePair("accountType", "2"));
		params.add(new BasicNameValuePair("language", "zh"));
		params.add(new BasicNameValuePair("add-code", "2"));
		HttpEntity paramsEntity = new UrlEncodedFormEntity(params, "UTF-8");
		loginRequest.setEntity(paramsEntity);
		ResponseHandler<Boolean> loginHandler = new LoginResponseHandler();
		boolean success = httpClient.execute(loginRequest, loginHandler);
		return success;
	}
	
	private static class LoginResponseHandler implements ResponseHandler<Boolean> {
	    @Override
	    public Boolean handleResponse(
	            final HttpResponse response) throws IOException {
	        int status = response.getStatusLine().getStatusCode();
	        if (status >= 200 && status < 300) {
	            HttpEntity entity = response.getEntity();
	            String resultXml = EntityUtils.toString(entity, "utf-8");
	            int usernameIndex = resultXml.indexOf("username");
	            if (usernameIndex > -1) {
	            	return true;
	            }
	            
	            return false;
	        } else {
	            throw new IOException("Unexpected response status: " + status);
	        }
	    }	
	}
	
	private static class ExcelResponseHandler implements ResponseHandler<InputStream> {
	    @Override
	    public InputStream handleResponse(
	            final HttpResponse response) throws IOException {
	        int status = response.getStatusLine().getStatusCode();
	        if (status >= 200 && status < 300) {
	        	HttpEntity entity = response.getEntity();
	        	if (entity.getContentLength() == 0) {
	        		throw new IOException("Empty content");
	        	}
	        	ByteArrayOutputStream out = new ByteArrayOutputStream();
	        	entity.writeTo(out);
	        	return new ByteArrayInputStream(out.toByteArray());
	        } else {
	            throw new IOException("Unexpected response status: " + status);
	        }
	    }	
	}	
}
