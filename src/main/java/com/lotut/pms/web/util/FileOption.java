package com.lotut.pms.web.util;

import java.io.File;
import java.io.FileOutputStream;
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
}
