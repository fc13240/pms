package com.lotut.pms.web.util;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.apache.poi.poifs.filesystem.DirectoryEntry;
import org.apache.poi.poifs.filesystem.DocumentEntry;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

import com.lotut.pms.domain.Attachment;
import com.lotut.pms.domain.PatentDoc;

public class HTMLToWord {
	public static String getAttachments(List<Attachment> AttachmentIntrodurces){
		String attachmentIntroduces =null;
		for (Attachment Introdurce:AttachmentIntrodurces) {
			attachmentIntroduces+=Introdurce.getCaption()+"<br/>"+Introdurce.getLabel();
		}
		return attachmentIntroduces;
	}
	 public static  String writeWordManualFile(String saveWordPathDir,PatentDoc patentDoc,String fileName,List<Attachment> attachmentIntrodurces) {
		    String saveWordPath=saveWordPathDir+"/"+ fileName;
	        try {  

	                    String name=patentDoc.getName();
	                    String techDomain=patentDoc.getTechDomain();
	                    String backTech=patentDoc.getBackgoundTech();
	                    String content=patentDoc.getContent();
	                    String implementWay=patentDoc.getImplementWay();
	                    String attachmentIntroduces = getAttachments(attachmentIntrodurces);
	                    String content2="<html>";
	                    content2+="<div style=\"text-align: center\"><span style=\"font-size: 24px\"><span style=\"font-family: 黑体\">"       
	                            +name+"<br /> <br /> </span></span></div>";
	                    content2+="<div style=\"text-align: left\"><span style=\"font-family: 黑体\">技术领域</span><br/><span >"       
	                            +techDomain+"<br /> <br /> </span></span></div>";
	                    content2+="<div style=\"text-align: left\"><span style=\"font-family: 黑体\">背景技术</span><br/><span >"       
	                            +backTech+"<br /> <br /> </span></span></div>";
	                    content2+="<div style=\"text-align: left\"><span style=\"font-family: 黑体\">发明内容</span><br/><span >"       
	                            +content+"<br /> <br /> </span></span></div>";
	                    content2+="<div style=\"text-align: left\"><span style=\"font-family: 黑体\">附图说明</span><br/><span >"       
	                            +attachmentIntroduces+"<br /> <br /> </span></span></div>";
	                    content2+="<div style=\"text-align: left\"><span style=\"font-family: 黑体\">具体实施方式</span><br/><span >"       
	                            +implementWay+"<br /> <br /> </span></span></div>";
	                    
	                    content2 += "</html>";
	                    byte b[] = content2.getBytes("UTF-8");
	                    
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
	 
	 public static  boolean deleteDir(File dir) {
	        if (dir.isDirectory()) {
	            String[] children = dir.list();
	            for (int i=0; i<children.length; i++) {
	                boolean success = deleteDir(new File(dir, children[i]));
	                if (!success) {
	                    return false;
	                }
	            }
	        }
	        // 目录此时为空，可以删除
	        return dir.delete();
	    }
}
