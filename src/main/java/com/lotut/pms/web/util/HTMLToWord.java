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
	                    String contentProblem=patentDoc.getContentProblem();
	                    String contentRight=patentDoc.getContentRight();
	                    String contentEffect=patentDoc.getContentEffect();
	                    String implementWay=patentDoc.getImplementWay();
	                    String rightClaim=patentDoc.getRightClaim();
	                    String abstractDescription=patentDoc.getAbstractDescription();
	                    String content = "<html><head>"+name+"</head><div style=\"text-align: center\"><span style=\"font-size: 28px\"><span style=\"font-family: 黑体\">" +
	                    					"摘要"+"<br /> <br />"+abstractDescription+
	                    					"专利名称"+"<br /> <br />"+name+
	                    					"技术领域"+"<br /> <br />"+techDomain+
	                    					"背景技术"+"<br /> <br />"+backTech+
	                    					"发明问题"+"<br /> <br />"+contentProblem+
	                    					"发明权利"+"<br /> <br />"+contentRight+
	                    					"发明效果"+"<br /> <br />"+contentEffect+
	                    					"实施方式"+"<br /> <br />"+implementWay+
	                    					"权利要求"+"<br /> <br />"+rightClaim+
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
