package com.lotut.pms.web.controller;

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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.lotut.pms.constants.Settings;
import com.lotut.pms.service.AppPersonService;
import com.lotut.pms.service.FriendService;
import com.lotut.pms.service.InventorService;
import com.lotut.pms.service.PatentDocService;
import com.lotut.pms.service.PatentDocumentTemplateService;
import com.lotut.pms.service.UserService;
import com.lotut.pms.web.util.WebUtils;


@Controller
@RequestMapping(path="/kindeditor")
public class UploadController {
	private PatentDocService patentDocService;
	
	@Autowired
	public UploadController(PatentDocService patentDocService) {
		this.patentDocService = patentDocService;
	}
	   
	   @RequestMapping(path = "/uploadPic",method=RequestMethod.POST)
		public void uploadPic(@RequestParam("patentDocId") int patentDocId,HttpServletRequest request1 ,HttpServletResponse response1)  {
		   try{
			   String savePath = Settings.PATENTDOC_ATTACHMENT_PATH;
			   int count=patentDocService.getMaxAttachmentPicNum(patentDocId)+1;
				String basePath = request1.getContextPath();
/*				String basePath = request1.getScheme() + "://" + request1.getLocalAddr() + ":" + request1.getServerPort()
				+ path;*/
				String saveUrl ="/attachmentImg/";
				String dirName = request1.getParameter("dir");
				if (dirName == null) {
					dirName = patentDocId+"";
				}
				// 创建文件夹
				savePath += dirName + "/";
				saveUrl += dirName + "/";
				File saveDirFile = new File(savePath);
				if (!saveDirFile.exists()) {
					saveDirFile.mkdirs();
				}
			   CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request1.getSession().getServletContext());
			   if(multipartResolver.isMultipart(request1)){ 
				 //转换成多部分request      
		            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request1;  
		            // 取得request中的所有文件名  
		            Iterator<String> iter = multiRequest.getFileNames();  
		            while (iter.hasNext()) {  
		                // 取得上传文件  
		                MultipartFile file = multiRequest.getFile(iter.next());  
		                // 数据封装操作 MultipartFile reqeust  
		                // 取得当前上传文件的文 件名称  
		                String fileName = file.getOriginalFilename(); 
		        		File dirFile = new File(savePath);
		        		if (!dirFile.exists()) {
		        			dirFile.mkdirs();
		        		}
		        		String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
		        		String picName="图" +count;
		        		String newFileName = picName+ "." + fileExt;
		        		InputStream is = file.getInputStream();
		        		int BUFFER_SIZE = 8 * 1024;
		        		byte[] buffer = new byte[BUFFER_SIZE];
		        		try (OutputStream out = new FileOutputStream(savePath + newFileName);) {
		        			int bytesRead = -1;
		        			while ((bytesRead = is.read(buffer)) != -1) {
		        				out.write(buffer, 0, bytesRead);
		        			}
		        			out.flush();
		        		}
		        		String url=saveUrl+newFileName+".html";
		       		 	Map<String, Object> succMap = new HashMap<String, Object>(); 
		                succMap.put("url", saveUrl + newFileName+".html");  
		                succMap.put("picName",picName );
		                succMap.put("count",count );
		                WebUtils.writeJsonStrToResponse(response1, succMap);
			   }
		   }
		   }catch(IOException e){
			   e.printStackTrace();
		   }

	   }
	   
	   
	   @RequestMapping(path = "/uploadInterFacePic",method=RequestMethod.POST)
		public void uploadInterFacePic(@RequestParam("patentDocId") int patentDocId,HttpServletRequest request ,HttpServletResponse response,HttpSession session)  {
		   try{
			   String savePath = Settings.PATENTDOC_INTERFACEPIC_PATH;
			   int count=patentDocService.getMaxAttachmentPicNum(patentDocId)+1;
				String picName=WebUtils.getPicName(session);
				String basePath = request.getContextPath();
/*				String basePath = request1.getScheme() + "://" + request1.getLocalAddr() + ":" + request1.getServerPort()
				+ path;*/
				String saveUrl ="/InterFaceImg/";
				String dirName = request.getParameter("dir");
				if (dirName == null) {
					dirName = patentDocId+"";
				}
				// 创建文件夹
				savePath += dirName + "/";
				saveUrl += dirName + "/";
				File saveDirFile = new File(savePath);
				if (!saveDirFile.exists()) {
					saveDirFile.mkdirs();
				}
			   CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
			   if(multipartResolver.isMultipart(request)){ 
				 //转换成多部分request      
		            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;  
		            // 取得request中的所有文件名  
		            Iterator<String> iter = multiRequest.getFileNames();  
		            while (iter.hasNext()) {  
		                // 取得上传文件  
		                MultipartFile file = multiRequest.getFile(iter.next());  
		                // 数据封装操作 MultipartFile reqeust  
		                // 取得当前上传文件的文 件名称  
		                String fileName = file.getOriginalFilename(); 
		        		File dirFile = new File(savePath);
		        		if (!dirFile.exists()) {
		        			dirFile.mkdirs();
		        		}
		        		String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
		        		String newFileName = picName + "." + fileExt;
		        		InputStream is = file.getInputStream();
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
		                succMap.put("url", saveUrl + newFileName+".html");
		                succMap.put("count",count );
		                WebUtils.writeJsonStrToResponse(response, succMap);
		                session.removeAttribute("picName");
			   }
		   }
		   }catch(IOException e){
			   e.printStackTrace();
		   }

	   }
}
