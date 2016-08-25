package com.lotut.pms.web.util;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.poi.POIXMLDocument;
import org.apache.poi.POIXMLTextExtractor;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.hwpf.usermodel.Bookmark;
import org.apache.poi.hwpf.usermodel.Bookmarks;
import org.apache.poi.hwpf.usermodel.Paragraph;
import org.apache.poi.hwpf.usermodel.Range;
import org.apache.poi.hwpf.usermodel.Table;
import org.apache.poi.hwpf.usermodel.TableCell;
import org.apache.poi.hwpf.usermodel.TableIterator;
import org.apache.poi.hwpf.usermodel.TableRow;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.poifs.filesystem.DirectoryEntry;
import org.apache.poi.poifs.filesystem.DocumentEntry;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;

import com.lotut.pms.constants.Settings;
import com.lotut.pms.domain.Attachment;
import com.lotut.pms.domain.PatentDoc;

public class HTMLToWord {
	public static String getAttachments(List<Attachment> AttachmentIntrodurces){
		String attachmentIntroduces =null;
		for (Attachment Introdurce:AttachmentIntrodurces) {
			attachmentIntroduces+=Introdurce.getCaption()+"<br/>"+Introdurce.getCaption();
		}
		return attachmentIntroduces;
	}
	 public static  String writeWordManualFile(String saveWordPathDir,PatentDoc patentDoc,String fileName,List<Attachment> attachmentIntrodurces) {
		    String saveWordPath=saveWordPathDir+"/"+ fileName;
	        try {  
			        
	                    String name=patentDoc.getName();
	                    String techDomain=patentDoc.getName();
	                    String backTech=patentDoc.getName();
	                    String content=patentDoc.getName();
	                    String implementWay=patentDoc.getName();
	                    String attachmentIntroduces = getAttachments(attachmentIntrodurces);
	                    String content2="<html>";
	                    content2+="<div style=\"text-align: center\"><span style=\"font-size: 16px\"><span style=\"font-family: 黑体\">" +      
	                    		name+"<br /> <br /> </span></span></div>";
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
	                    String techDomain=patentDoc.getName();
	                    String backTech=patentDoc.getName();
	                    String content=patentDoc.getName();
	                    String implementWay=patentDoc.getName();
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
	                    String techDomain=patentDoc.getName();
	                    String backTech=patentDoc.getName();
	                    String content=patentDoc.getName();
	                    String implementWay=patentDoc.getName();
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
	                    String techDomain=patentDoc.getName();
	                    String backTech=patentDoc.getName();
	                    String content=patentDoc.getName();
	                    String implementWay=patentDoc.getName();
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
	                    String techDomain=patentDoc.getName();
	                    String backTech=patentDoc.getName();
	                    String content=patentDoc.getName();
	                    String implementWay=patentDoc.getName();
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
	 
	 
	 public static void main(String[] args)  {
		 try{
		 InputStream  is = new FileInputStream(new File("D:/说明书.doc"));  
	      HWPFDocument doc = new HWPFDocument(is);
	      //WordExtractor ex = new WordExtractor(is);
	      //System.out.println(ex.getText());
	      //输出书签信息  
	      printInfo(doc.getBookmarks());  
	      //输出文本  
	      System.out.println(doc.getDocumentText());  
	      Range range = doc.getRange();    
	      /*printInfo(range); */ 
	      //读表格  
	      //readTable(range);  
	      //读列表  
	      //readList(range);
	     
		 }catch(Exception e){
			 e.printStackTrace();
		 }
	      
	}
	 
	 public static void printInfo(Bookmarks bookmarks) {  
	      int count = bookmarks.getBookmarksCount();  
	      System.out.println("书签数量：" + count);  
	      Bookmark bookmark;  
	      for (int i=0; i<count; i++) {  
	         bookmark = bookmarks.getBookmark(i);  
	         System.out.println("书签" + (i+1) + "的名称是：" + bookmark.getName());  
	         System.out.println("开始位置：" + bookmark.getStart());  
	         System.out.println("结束位置：" + bookmark.getEnd());  
	      }  
	   }
	 
	 /** 
	    * 读表格 
	    * 每一个回车符代表一个段落，所以对于表格而言，每一个单元格至少包含一个段落，每行结束都是一个段落。 
	    * @param range 
	    */  
	   public static void readTable(Range range) {  
	      //遍历range范围内的table。  
	      TableIterator tableIter = new TableIterator(range);  
	      Table table;  
	      TableRow row;  
	      TableCell cell;  
	      while (tableIter.hasNext()) {  
	         table = tableIter.next();  
	         int rowNum = table.numRows();  
	         for (int j=0; j<rowNum; j++) {  
	            row = table.getRow(j);  
	            int cellNum = row.numCells();  
	            for (int k=0; k<cellNum; k++) {  
	                cell = row.getCell(k);  
	                //输出单元格的文本  
	                System.out.println(cell.text().trim());  
	            }  
	         }  
	      }  
	   }  
	    
	   /** 
	    * 读列表 
	    * @param range 
	    */  
	   public static void readList(Range range) {  
	      int num = range.numParagraphs();  
	      Paragraph para;  
	      for (int i=0; i<num; i++) {  
	         para = range.getParagraph(i);  
	         if (para.isInList()) {  
	            System.out.println("list: " + para.text());  
	         }  
	      }  
	   }  
}
