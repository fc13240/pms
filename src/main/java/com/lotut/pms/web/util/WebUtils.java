package com.lotut.pms.web.util;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

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
		String getfromsession=new String(session.getAttribute("picName").toString().getBytes("gbk "), "iso-8859-1 ");
		return  getfromsession;
	}
}
