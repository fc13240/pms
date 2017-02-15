package com.lotut.pms.web.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;

public class WebUtils {
	public static void writeJsonStrToResponse(HttpServletResponse response, Object value) throws IOException {
		ObjectMapper mapper = new ObjectMapper();
		response.reset();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
		try (PrintWriter out = response.getWriter();) {
			out.write(mapper.writeValueAsString(value));
			out.flush();
		}
	}
	
	public static void writeStreamToResponse(HttpServletResponse response, InputStream in) throws IOException {
		int BUFFER_SIZE = 8 * 1024;
		byte[] buffer = new byte[BUFFER_SIZE];
		try (OutputStream out = response.getOutputStream();
				BufferedInputStream bis = new BufferedInputStream(in))
			{
				int bytesRead = -1;
				while ((bytesRead = bis.read(buffer)) != -1) {
					out.write(buffer, 0, bytesRead);
				}
				out.flush();
			}
	}
	
	public static int getPageSize(HttpSession session) {
		final int DEFAULT_PAGE_SIZE = 10;
		if (session.getAttribute("pageSize") == null) {
			return DEFAULT_PAGE_SIZE;
		}
		
		return (int) session.getAttribute("pageSize");
	}
	
	public static boolean isFireFox(HttpServletRequest request) {
		  String UserAgent = request.getHeader("USER-AGENT").toLowerCase();
		    if(UserAgent!=null && UserAgent.indexOf("firefox") >= 0){
		    	return true;
		    }
		    return false;
	}
	
	public static String getPicName(HttpSession session) throws UnsupportedEncodingException {
		String picName = (String) session.getAttribute("picName");
		return picName;
	}
	
	public static String getBrowser(HttpServletRequest request){
	    String UserAgent = request.getHeader("USER-AGENT").toLowerCase();
	    if(UserAgent!=null){
	        if (UserAgent.indexOf("msie") >=0 ) return "IE";
	        if (UserAgent.indexOf("firefox") >= 0) return "FF";
	    }
	    return null;
	}
	
	public static void packZip(List<File> file1,String strZipName) throws IOException{
		byte[] buffer = new byte[1024];   
		  
	       //生成的ZIP文件名为Demo.zip   
	  
	      //  strZipName = "d:/Demo.zip";   
	  
	       ZipOutputStream out = new ZipOutputStream(new FileOutputStream(strZipName));   
	  
	       //需要同时下载的两个文件result.txt ，source.txt   
	  
	       //File[] file1 = {new File("d:/a.txt"),new File("d:/b.txt"),new File("d:/aa.txt"),new File("d:/bb.txt")};   
	  
	       for(int i=0;i<file1.size();i++) {
	  
	           FileInputStream fis = new FileInputStream(file1.get(i));   
	  
	           out.putNextEntry(new ZipEntry(file1.get(i).getName()));   
	  
	           int len;   
	  
	           //读入需要下载的文件的内容，打包到zip文件   
	  
	          while((len = fis.read(buffer))>0) {   
	  
	           out.write(buffer,0,len);    
	  
	          }   
	  
	           out.closeEntry();   
	  
	           fis.close();   
	  
	       }   
	       out.close();   
	}
	
	public static void main(String[] args) throws Exception {   
		  
	       byte[] buffer = new byte[1024];   
	  
	       //生成的ZIP文件名为Demo.zip   
	  
	       String strZipName = "d:/Demo.zip";   
	  
	       ZipOutputStream out = new ZipOutputStream(new FileOutputStream(strZipName));   
	  
	       //需要同时下载的两个文件result.txt ，source.txt   
	  
	       File[] file1 = {new File("d:/a.txt"),new File("d:/b.txt"),new File("d:/aa.txt"),new File("d:/bb.txt")};   
	  
	       for(int i=0;i<file1.length;i++) {
	  
	           FileInputStream fis = new FileInputStream(file1[i]);   
	  
	           out.putNextEntry(new ZipEntry(file1[i].getName()));   
	  
	           int len;   
	  
	           //读入需要下载的文件的内容，打包到zip文件   
	  
	          while((len = fis.read(buffer))>0) {   
	  
	           out.write(buffer,0,len);    
	  
	          }   
	  
	           out.closeEntry();   
	  
	           fis.close();   
	  
	       }   
	  
	        out.close();   
	  
	        System.out.println("生成Demo.zip成功");   
	  
	    }  
}
