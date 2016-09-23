package com.lotut.pms.web.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

public class FileOption {
	public static void fileUpload(int userId,MultipartFile multipartFile,String savePath,String fileName,HttpServletResponse response){
		try{
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String ymd = sdf.format(new Date());
			savePath += ymd + "/";
			File dirFile = new File(savePath);
			if (!dirFile.exists()) {
				dirFile.mkdirs();
			}
			String newFileName = userId + "_" + new Random().nextInt(10000) + "_" + fileName;
			InputStream is = multipartFile.getInputStream();
			int BUFFER_SIZE = 8 * 1024;
			byte[] buffer = new byte[BUFFER_SIZE];
			try (OutputStream out = new FileOutputStream(savePath + newFileName);) {
				int bytesRead = -1;
				while ((bytesRead = is.read(buffer)) != -1) {
					out.write(buffer, 0, bytesRead);
				}
				out.flush();
				out.close();
			}
			WebUtils.writeJsonStrToResponse(response,ymd + "/"+newFileName);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public static void patentDocFileOption(int userId,MultipartFile multipartFile,String saveDir,HttpServletResponse response){
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String ymd = sdf.format(new Date());
		saveDir+=userId+"_"+ymd+"/";
		String filename=multipartFile.getOriginalFilename();
		String savePath=saveDir + filename;
		File fileDir = new File(saveDir);
		try {
			if(!fileDir.exists()){
				fileDir.mkdir();
			}else{
				deleteDir(fileDir);
				fileDir.mkdir();
			}
			InputStream is = multipartFile.getInputStream();
			int BUFFER_SIZE = 8*1024;
			byte [] buffer = new byte[BUFFER_SIZE];
			//try(OutputStream outputStream = new FileOutputStream(saveDir + filename);){
			try(OutputStream outputStream = new FileOutputStream(savePath);){
				int bytesRead = -1;
				while ((bytesRead = is.read(buffer)) != -1) {
					outputStream.write(buffer, 0, bytesRead);
				}
				outputStream.flush();
				outputStream.close();
			}
			WebUtils.writeJsonStrToResponse(response,savePath);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private static boolean deleteDir(File dir) {
		if (dir.isDirectory()) {
			String[] children = dir.list();
			for (int i=0; i<children.length; i++) {
				boolean success = deleteDir(new File(dir, children[i]));
				if (!success) {
					return false;
				}
			}
		}
		return dir.delete();
	}
	public static void main(String[] args) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String ymd = sdf.format(new Date());
		System.out.println(ymd);
	}
}
