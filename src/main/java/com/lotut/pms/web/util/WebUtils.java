package com.lotut.pms.web.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;

public class WebUtils {
	public static void writeJsonStrToResponse(HttpServletResponse response, Object value) throws IOException {
		ObjectMapper mapper = new ObjectMapper();
		
		try (PrintWriter out = response.getWriter();) {
			out.write(mapper.writeValueAsString(value));
			out.flush();
		}
	}
	
	public static int getPageSize(HttpSession session) {
		final int DEFAULT_PAGE_SIZE = 10;
		System.out.println("-----1----");
		if (session.getAttribute("pageSize") == null) {
			System.out.println("-----2-----");
			System.out.println(session.getAttribute("pageSize")+"-ppp");
			return DEFAULT_PAGE_SIZE;
		}
		
		return (int) session.getAttribute("pageSize");
	}
}
