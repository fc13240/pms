package com.lotut.pms.web.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

public class WebUtils {
	public static void writeJsonStrToResponse(HttpServletResponse response, Object value) throws IOException {
		ObjectMapper mapper = new ObjectMapper();
		
		try (PrintWriter out = response.getWriter();) {
			out.write(mapper.writeValueAsString(value));
			out.flush();
		}
	}
}
