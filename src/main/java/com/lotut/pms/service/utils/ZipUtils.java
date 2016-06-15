package com.lotut.pms.service.utils;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import org.dom4j.DocumentException;

import net.lingala.zip4j.core.ZipFile;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.model.FileHeader;
import net.lingala.zip4j.model.ZipParameters;
import net.lingala.zip4j.util.Zip4jConstants;

public class ZipUtils {
	public static void main(String[] args) throws IOException, ZipException, DocumentException, ParseException {
		String zipFilePath = "C:/Users/Administrator/Desktop/2015113083403.zip";
		System.out.println(zipFilePath.substring(zipFilePath.lastIndexOf("/")+1, zipFilePath.lastIndexOf(".zip")));
		// unZip("C:/Users/Administrator/Desktop/2015113083403.zip", "C:/Users/Administrator/Desktop/testzip/2015113083403");
	}
	
	public static void unzip(String zipPath, String destDir) throws IOException, ZipException {
		ZipFile zipFile = new ZipFile(zipPath);
		if (!zipFile.isValidZipFile()) {
			throw new ZipException("不是合法的zip包");
		}
		
		File destFile = new File(destDir);
		if (!destFile.exists()) {
			destFile.mkdirs();
		}
		
		@SuppressWarnings("unchecked")
		List<FileHeader> fileHeaders = zipFile.getFileHeaders();
		for (FileHeader fileHeader: fileHeaders) {
			fileHeader.setFileName(fileHeader.getFileName().replaceAll("\\\\+", "/"));
			zipFile.extractFile(fileHeader, destDir);
		}
	}
	
	public static ZipFile zip(File dirPath, String destFileName) {
		try {
			ZipFile zipFile = new ZipFile(destFileName);
			ZipParameters zipParams = new ZipParameters();
			zipParams.setCompressionMethod(Zip4jConstants.COMP_DEFLATE);
			zipParams.setCompressionLevel(Zip4jConstants.DEFLATE_LEVEL_NORMAL);
			zipFile.addFolder(dirPath, zipParams);
			
			return zipFile;
		} catch (ZipException e) {
			throw new RuntimeException("Input zip file parameter 'destFile' cannnot be null");
		}
	}
}
