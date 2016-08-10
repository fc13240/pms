package com.lotut.pms.web.util;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import org.apache.poi.poifs.filesystem.DirectoryEntry;
import org.apache.poi.poifs.filesystem.DocumentEntry;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

import com.lotut.pms.constants.Settings;
import com.lotut.pms.domain.PatentDoc;

public class HTMLToWord {

	 public static String writeWordManualFile(String saveWordPathDir,PatentDoc patentDoc,String fileName) {
		    String saveWordPath=saveWordPathDir+"/"+ fileName;
	        try {  

	                    String name=patentDoc.getName();
	                    String techDomain=patentDoc.getTechDomain();
	                    String backTech=patentDoc.getBackgoundTech();
	                    String content=patentDoc.getContent();
	                    String implementWay=patentDoc.getImplementWay();
	                    String rightClaim=patentDoc.getRightClaim();
	                    String abstractDescription=patentDoc.getAbstractDescription();
	                    String content1 = "<html><head style=\"text-align: center\">"+name+"</head><div style=\"text-align: center\"><span style=\"font-size: 12px\"><span style=\"font-family: 宋体\">" +
	                    		"<br /> <br />"+"技术领域"+"<br /> <br />"+techDomain+
	                    					"<br /> <br />"+"背景技术"+"<br /> <br />"+backTech+
	                    					"<br /> <br />"+"发明内容"+"<br /> <br />"+content+
	                    					"<br /> <br />"+"附图说明"+"<br /> <br />"+"null"+
	                    					"实施方式"+"<br /> <br />"+implementWay+
	                    		            "<br /> <br /> </span></span></div></html>";
	                    byte b[] = content.getBytes("UTF-8");
	                    
	                    ByteArrayInputStream bais = new ByteArrayInputStream(b);  
	                    POIFSFileSystem poifs = new POIFSFileSystem();  
	                    DirectoryEntry directory = poifs.getRoot();  
	                    DocumentEntry documentEntry = directory.createDocument("WordDocument", bais);  
	                    FileOutputStream ostream = new FileOutputStream(saveWordPath);  
	                    poifs.writeFilesystem(ostream);  
	                    bais.close();  
	                    ostream.close();    
	        } catch (IOException e) {  
	            e.printStackTrace();  
	      }  
	      return saveWordPath;  
	    }  
	
	 
	 public static String writeWordRightFile(String saveWordPathDir,PatentDoc patentDoc,String fileName) {
		    String saveWordPath=saveWordPathDir+"/"+ fileName;
	        try {   
	                    String name=patentDoc.getName();
	                    String techDomain=patentDoc.getTechDomain();
	                    String backTech=patentDoc.getBackgoundTech();
	                    String content=patentDoc.getContent();
	                    String implementWay=patentDoc.getImplementWay();
	                    String rightClaim=patentDoc.getRightClaim();
	                    String abstractDescription=patentDoc.getAbstractDescription();
	                    String content1 = "<html><head style=\"text-align: center\">"+name+"</head><div style=\"text-align: center\"><span style=\"font-size: 12px\"><span style=\"font-family: 宋体\">" +
	                    		"<br /> <br />"+"技术领域"+"<br /> <br />"+techDomain+
	                    					"<br /> <br />"+"背景技术"+"<br /> <br />"+backTech+
	                    					"<br /> <br />"+"发明内容"+"<br /> <br />"+content+
	                    					"<br /> <br />"+"附图说明"+"<br /> <br />"+"null"+
	                    					"实施方式"+"<br /> <br />"+implementWay+
	                    		            "<br /> <br /> </span></span></div></html>";
	                    byte b[] = content.getBytes("UTF-8");
	                    
	                    ByteArrayInputStream bais = new ByteArrayInputStream(b);  
	                    POIFSFileSystem poifs = new POIFSFileSystem();  
	                    DirectoryEntry directory = poifs.getRoot();  
	                    DocumentEntry documentEntry = directory.createDocument("WordDocument", bais);  
	                    FileOutputStream ostream = new FileOutputStream(saveWordPath);  
	                    poifs.writeFilesystem(ostream);  
	                    bais.close();  
	                    ostream.close();    
 
	        } catch (IOException e) {  
	            e.printStackTrace();  
	      }  
	      return saveWordPath;  
	    }
	 
	 
	 
	 public static String writeWordManualAbstractFile(String saveWordPathDir,PatentDoc patentDoc,String fileName) {
		    String saveWordPath=saveWordPathDir+"/"+ fileName;
	        try {   
	                    String name=patentDoc.getName();
	                    String techDomain=patentDoc.getTechDomain();
	                    String backTech=patentDoc.getBackgoundTech();
	                    String content=patentDoc.getContent();
	                    String implementWay=patentDoc.getImplementWay();
	                    String rightClaim=patentDoc.getRightClaim();
	                    String abstractDescription=patentDoc.getAbstractDescription();
	                    String content1 = "<html><head style=\"text-align: center\">"+name+"</head><div style=\"text-align: center\"><span style=\"font-size: 12px\"><span style=\"font-family: 宋体\">" +
	                    		"<br /> <br />"+"技术领域"+"<br /> <br />"+techDomain+
	                    					"<br /> <br />"+"背景技术"+"<br /> <br />"+backTech+
	                    					"<br /> <br />"+"发明内容"+"<br /> <br />"+content+
	                    					"<br /> <br />"+"附图说明"+"<br /> <br />"+"null"+
	                    					"实施方式"+"<br /> <br />"+implementWay+
	                    		            "<br /> <br /> </span></span></div></html>";
	                    byte b[] = content.getBytes("UTF-8");
	                    
	                    ByteArrayInputStream bais = new ByteArrayInputStream(b);  
	                    POIFSFileSystem poifs = new POIFSFileSystem();  
	                    DirectoryEntry directory = poifs.getRoot();  
	                    DocumentEntry documentEntry = directory.createDocument("WordDocument", bais);  
	                    FileOutputStream ostream = new FileOutputStream(saveWordPath);  
	                    poifs.writeFilesystem(ostream);  
	                    bais.close();  
	                    ostream.close();    
	        } catch (IOException e) {  
	            e.printStackTrace();  
	      }  
	      return saveWordPath;  
	    } 
	 
	 
	 
	 public static String writeWordManualAttachmentFile(String saveWordPathDir,PatentDoc patentDoc,String fileName) {
		    String saveWordPath=saveWordPathDir+"/"+ fileName;
	        try {  
	                    String name=patentDoc.getName();
	                    String techDomain=patentDoc.getTechDomain();
	                    String backTech=patentDoc.getBackgoundTech();
	                    String content=patentDoc.getContent();
	                    String implementWay=patentDoc.getImplementWay();
	                    String rightClaim=patentDoc.getRightClaim();
	                    String abstractDescription=patentDoc.getAbstractDescription();
	                    String content1 = "<html><head style=\"text-align: center\">"+name+"</head><div style=\"text-align: center\"><span style=\"font-size: 12px\"><span style=\"font-family: 宋体\">" +
	                    		"<br /> <br />"+"技术领域"+"<br /> <br />"+techDomain+
	                    					"<br /> <br />"+"背景技术"+"<br /> <br />"+backTech+
	                    					"<br /> <br />"+"发明内容"+"<br /> <br />"+content+
	                    					"<br /> <br />"+"附图说明"+"<br /> <br />"+"null"+
	                    					"实施方式"+"<br /> <br />"+implementWay+
	                    		            "<br /> <br /> </span></span></div></html>";
	                    byte b[] = content.getBytes("UTF-8");
	                    
	                    ByteArrayInputStream bais = new ByteArrayInputStream(b);  
	                    POIFSFileSystem poifs = new POIFSFileSystem();  
	                    DirectoryEntry directory = poifs.getRoot();  
	                    DocumentEntry documentEntry = directory.createDocument("WordDocument", bais);  
	                    FileOutputStream ostream = new FileOutputStream(saveWordPath);  
	                    poifs.writeFilesystem(ostream);  
	                    bais.close();  
	                    ostream.close();    
	        } catch (IOException e) {  
	            e.printStackTrace();  
	      }  
	      return saveWordPath;  
	    }
	 
	 
	 public static String writeWordAbstractImgFile(String saveWordPathDir,PatentDoc patentDoc,String fileName) {
		    String saveWordPath=saveWordPathDir+"/"+fileName;
	        try {  
	                    String name=patentDoc.getName();
	                    String techDomain=patentDoc.getTechDomain();
	                    String backTech=patentDoc.getBackgoundTech();
	                    String content=patentDoc.getContent();
	                    String implementWay=patentDoc.getImplementWay();
	                    String rightClaim=patentDoc.getRightClaim();
	                    String abstractDescription=patentDoc.getAbstractDescription();
	                    String content1 = "<html><head style=\"text-align: center\">"+name+"</head><div style=\"text-align: center\"><span style=\"font-size: 12px\"><span style=\"font-family: 宋体\">" +
	                    		"<br /> <br />"+"技术领域"+"<br /> <br />"+techDomain+
	                    					"<br /> <br />"+"背景技术"+"<br /> <br />"+backTech+
	                    					"<br /> <br />"+"发明内容"+"<br /> <br />"+content+
	                    					"<br /> <br />"+"附图说明"+"<br /> <br />"+"null"+
	                    					"实施方式"+"<br /> <br />"+implementWay+
	                    		            "<br /> <br /> </span></span></div></html>";
	                    byte b[] = content.getBytes("UTF-8");
	                    
	                    ByteArrayInputStream bais = new ByteArrayInputStream(b);  
	                    POIFSFileSystem poifs = new POIFSFileSystem();  
	                    DirectoryEntry directory = poifs.getRoot();  
	                    DocumentEntry documentEntry = directory.createDocument("WordDocument", bais);  
	                    FileOutputStream ostream = new FileOutputStream(saveWordPath);  
	                    poifs.writeFilesystem(ostream);  
	                    bais.close();  
	                    ostream.close();    
	        } catch (IOException e) {  
	            e.printStackTrace();  
	      }  
	      return saveWordPath;  
	    }  
}
