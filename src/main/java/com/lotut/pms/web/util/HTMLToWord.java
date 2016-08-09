package com.lotut.pms.web.util;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;

import org.apache.poi.poifs.filesystem.DirectoryEntry;
import org.apache.poi.poifs.filesystem.DocumentEntry;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

import com.lotut.pms.domain.PatentDoc;

public class HTMLToWord {
	 public static boolean writeWordFile(PatentDoc patentDoc) {  
	        boolean w = false;  
	        String path = "d:/";  
	        try {  
	            if (!"".equals(path)) {  
	                // 检查目录是否存在  
	                File fileDir = new File(path);  
	                if (fileDir.exists()) {  
	                    // 生成临时文件名称  
	                    String fileName = "a.doc";
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
	                    byte b[] = content.getBytes("GBK");
	                    
	                    ByteArrayInputStream bais = new ByteArrayInputStream(b);  
	                    POIFSFileSystem poifs = new POIFSFileSystem();  
	                    DirectoryEntry directory = poifs.getRoot();  
	                    DocumentEntry documentEntry = directory.createDocument("WordDocument", bais);
	                    
	                    FileOutputStream ostream = new FileOutputStream(path+ fileName);  
	                    poifs.writeFilesystem(ostream);  
	                    bais.close();  
	                    ostream.close();  
	                }  
	            }  
	        } catch (IOException e) {  
	            e.printStackTrace();  
	      }  
	      return w;  
	    }  
	
	public static void main(String[] args) {
		PatentDoc patentDoc=new PatentDoc();
		 writeWordFile(patentDoc);
	}
}
