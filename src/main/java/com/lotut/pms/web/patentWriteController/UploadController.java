package com.lotut.pms.web.patentWriteController;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.lotut.pms.constants.Settings;
import com.lotut.pms.web.util.WebUtils;


@Controller
@RequestMapping(path="/kindeditor")
public class UploadController {

	@RequestMapping(path = "/attachment_upload")
	@ResponseBody
	public void fileUpload(HttpServletRequest request,  @RequestParam("patentFile")Part imgFile,
			HttpServletResponse response) throws ServletException, IOException, FileUploadException {
		String savePath = Settings.PATENTDOC_ATTACHMENT_PATH;
		
		String uploadSign = request.getParameter("upload");  
		 String rootPath = request.getParameter("rootPath");  
		 String path1 = request.getParameter("path"); 
		 System.out.println(uploadSign+rootPath+path1);
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ path;
		String saveUrl = basePath + "/patentDocAttachment/";
		// 定义允许上传的文件扩展名
		HashMap<String, String> extMap = new HashMap<String, String>();
		extMap.put("image", "gif,jpg,jpeg,png,bmp");

		response.setContentType("text/html; charset=UTF-8");
		response.setHeader("X-Frame-OPTIONS", "SAMEORIGIN");
		
		if (!ServletFileUpload.isMultipartContent(request)) {
			 getError(response,"请选择文件！");
			 return;
		}

		String dirName = request.getParameter("dir");
		if (dirName == null) {
			dirName = "image";
		}
		if (!extMap.containsKey(dirName)) {
			getError(response,"目录名不正确。");
			return;
		}
		// 创建文件夹
		savePath += dirName + "/";
		saveUrl += dirName + "/";
		File saveDirFile = new File(savePath);
		if (!saveDirFile.exists()) {
			saveDirFile.mkdirs();
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String ymd = sdf.format(new Date());
		savePath += ymd + "/";
		saveUrl += ymd + "/";
		File dirFile = new File(savePath);
		if (!dirFile.exists()) {
			dirFile.mkdirs();
		}
		String fileName = imgFile.getSubmittedFileName();
		String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
		InputStream is = imgFile.getInputStream();
		int BUFFER_SIZE = 8 * 1024;
		byte[] buffer = new byte[BUFFER_SIZE];
		try (OutputStream out = new FileOutputStream(savePath + newFileName);) {
			int bytesRead = -1;
			while ((bytesRead = is.read(buffer)) != -1) {
				out.write(buffer, 0, bytesRead);
			}
			out.flush();
		}
		 Map<String, Object> succMap = new HashMap<String, Object>();  
         succMap.put("error", 0);  
         succMap.put("url", saveUrl + newFileName);  
         WebUtils.writeJsonStrToResponse(response, succMap);
	}
	
	
	   private void getError(HttpServletResponse response,String errorMsg) {  
	       try {
	    	   Map<String, Object> errorMap = new HashMap<String, Object>();  
		       errorMap.put("error", 1);  
		       errorMap.put("message", errorMsg);  
		       WebUtils.writeJsonStrToResponse(response, errorMap);
		} catch (IOException e) {
			e.printStackTrace();
		}  
	   } 
	   
	   
	   @RequestMapping(path = "/uploadPic",method=RequestMethod.POST)
	   @ResponseBody
		public void uploadPic(HttpServletRequest request1 ,
				HttpServletResponse response) {
			String uploadSign1 = request1.getParameter("upload");  
			 String rootPath1 = request1.getParameter("rootPath");  
			 String path11= request1.getParameter("path"); 
			 System.out.println(uploadSign1+rootPath1+path11);
		
		}
}
