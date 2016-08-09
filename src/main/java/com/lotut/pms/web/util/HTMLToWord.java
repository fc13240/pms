package com.lotut.pms.web.util;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.poi.poifs.filesystem.DirectoryEntry;
import org.apache.poi.poifs.filesystem.DocumentEntry;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

import com.lotut.pms.constants.Settings;
import com.lotut.pms.domain.PatentDoc;

public class HTMLToWord {
	 public static String writeWordFile(PatentDoc patentDoc,String fileName) {  
	        //boolean w = false;
	        String exportExcelPath = Settings.TEMP_DIR + fileName;
	        //String path = "d:/";  
	        try {  
	            if (!"".equals(exportExcelPath)) {  
	                // 检查目录是否存在  
	                File fileDir = new File(exportExcelPath);  
	                if (fileDir.exists()) {  
	                    // 生成临时文件名称  
	                    //String fileName = "a.doc";
	                    String name=patentDoc.getName();
	                    String techDomain=patentDoc.getTechDomain();
	                    String backTech=patentDoc.getBackgoundTech();
	                    String contentProblem=patentDoc.getContentProblem();
	                    String contentRight=patentDoc.getContentRight();
	                    String contentEffect=patentDoc.getContentEffect();
	                    String implementWay=patentDoc.getImplementWay();
	                    String rightClaim=patentDoc.getRightClaim();
	                    String abstractDescription=patentDoc.getAbstractDescription();
	                    String content = "<html><head>"+name+"</head><div style=\"text-align: center\"><span style=\"font-size: 12px\"><span style=\"font-family: 宋体\">" +
	                    					"技术领域"+"<br /> <br />"+techDomain+
	                    					"背景技术"+"<br /> <br />"+backTech+
	                    					"发明内容"+"<br /> <br />"+contentProblem+
	                    					"<br /> <br />"+contentRight+
	                    					"<br /> <br />"+contentEffect+
	                    					"附图说明"+"<br /> <br />"+"null"+
	                    					"实施方式"+"<br /> <br />"+implementWay+
	                    		            "<br /> <br /> </span></span></div></html>";
	                    byte b[] = content.getBytes("GBK");
	                    
	                    ByteArrayInputStream bais = new ByteArrayInputStream(b);  
	                    POIFSFileSystem poifs = new POIFSFileSystem();  
	                    DirectoryEntry directory = poifs.getRoot();  
	                    DocumentEntry documentEntry = directory.createDocument("WordDocument", bais);  
	                    FileOutputStream ostream = new FileOutputStream(exportExcelPath+ fileName);  
	                    poifs.writeFilesystem(ostream);  
	                    bais.close();  
	                    ostream.close();  
	                }  
	            }  
	        } catch (IOException e) {  
	            e.printStackTrace();  
	      }  
	      return exportExcelPath;  
	    }  
	
	/*public static void main(String[] args) {
		PatentDoc patentDoc=new PatentDoc();
		 writeWordFile(patentDoc);
	}*/
}
