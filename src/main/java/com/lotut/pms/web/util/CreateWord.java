package com.lotut.pms.web.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.usermodel.Range;

import com.lotut.pms.constants.Settings;
import com.lotut.pms.domain.Attachment;
import com.lotut.pms.domain.PatentDoc;

public class CreateWord {
	
	public static String getAttachments(List<Attachment> AttachmentIntrodurces){
		String attachmentIntroduces =null;
		for (Attachment Introdurce:AttachmentIntrodurces) {
			attachmentIntroduces+=Introdurce.getCaption()+"<br/>"+Introdurce.getCaption();
		}
		return attachmentIntroduces;
	}
	
	public  static String writeWordManualFile(String saveWordPathDir,PatentDoc patentDoc,String fileName,List<Attachment> attachmentIntrodurces) {
		String saveWordPath=saveWordPathDir+"/"+ fileName;
		try{
				String templatePath = Settings.WORD_MANUAL_TEMPLATE;
				
				String name=DocUtil.stripHtml(patentDoc.getName());
		        String techDomain=DocUtil.stripHtml(patentDoc.getName());
		        String backTech=DocUtil.stripHtml(patentDoc.getName());
		        String content=DocUtil.stripHtml(patentDoc.getName());
		        String implementWay=DocUtil.stripHtml(patentDoc.getName());
		        String attachmentIntroduces = DocUtil.stripHtml(getAttachments(attachmentIntrodurces));
				
			    InputStream is = new FileInputStream(templatePath);  
			    HWPFDocument doc = new HWPFDocument(is);  
			    Range range = doc.getRange();  
			    range.replaceText("${name}", name);  
			    range.replaceText("${techDomain}", techDomain);  
			    range.replaceText("${backgoundTech}", backTech);  
			    range.replaceText("${content}", content); 
			    range.replaceText("${implementWay}", implementWay);
			    range.replaceText("${attachedExplain}", attachmentIntroduces);
			    OutputStream os = new FileOutputStream(saveWordPath);   
			    doc.write(os);
			    os.close();
			    is.close();
		}catch(Exception e){
			e.printStackTrace();
		}
			return saveWordPath;
	}
 
	public static String writeWordRightFile(String saveWordPathDir,PatentDoc patentDoc,String fileName) {
	    String saveWordPath=saveWordPathDir+"/"+ fileName;
        try {   
        	String templatePath = Settings.WORD_RIGHT_TEMPLATE;
        	String rightClaim=DocUtil.txtContent(patentDoc.getRightClaim());
        	InputStream is = new FileInputStream(templatePath);  
		    HWPFDocument doc = new HWPFDocument(is);  
		    Range range = doc.getRange();  
		    range.replaceText("${right}", rightClaim);  
		    OutputStream os = new FileOutputStream(saveWordPath);   
		    doc.write(os);
		    os.close();
		    is.close();
        } catch (IOException e) {  
            e.printStackTrace();  
      }  
      return saveWordPath;  
    }
	
	
	public static String writeWordManualAbstractFile(String saveWordPathDir,PatentDoc patentDoc,String fileName) {
	    String saveWordPath=saveWordPathDir+"/"+ fileName;
        try {   
        	String templatePath = Settings.WORD_MANUAL_ABSTRACT_TEMPLATE;	
            String abstractDescription=DocUtil.txtContent(patentDoc.getAbstractDescription());
            InputStream is = new FileInputStream(templatePath);  
		    HWPFDocument doc = new HWPFDocument(is);  
		    Range range = doc.getRange();
		    range.replaceText("${manualAbstract}", abstractDescription);  
		    OutputStream os = new FileOutputStream(saveWordPath);   
		    doc.write(os);
		    os.close();
		    is.close();       
        } catch (IOException e) {  
            e.printStackTrace();  
      }  
      return saveWordPath;  
    } 
    
	 public static String writeWordManualAttachmentFile(String saveWordPathDir,PatentDoc patentDoc,String fileName) {
		    String saveWordPath=saveWordPathDir+"/"+ fileName;
	        try {  
	        	String templatePath = Settings.WORD_MANUAL_ATTACHMENT_TEMPLATE;
	        	String Img="null";
	            InputStream is = new FileInputStream(templatePath);  
			    HWPFDocument doc = new HWPFDocument(is);  
			    Range range = doc.getRange();  
			    range.replaceText("${manualImg}", Img); 
			    doc.getPicturesTable().getAllPictures();
			    OutputStream os = new FileOutputStream(saveWordPath);   
			    doc.write(os);
			    os.close();
			    is.close();       
	        } catch (IOException e) {  
	            e.printStackTrace();  
	      }  
	      return saveWordPath;  
	    }
	 
	 
	 public static String writeWordAbstractImgFile(String saveWordPathDir,PatentDoc patentDoc,String fileName) {
		    String saveWordPath=saveWordPathDir+"/"+fileName;
	        try {  
	        	String templatePath = Settings.WORD_ABSTRACTIMG_TEMPLATE;
	            String abstractImg="null";
	            InputStream is = new FileInputStream(templatePath);  
			    HWPFDocument doc = new HWPFDocument(is);  
			    Range range = doc.getRange();  
			    range.replaceText("${abstractImg}", abstractImg);  
			    OutputStream os = new FileOutputStream(saveWordPath);   
			    doc.write(os);
			    os.close();
			    is.close();       
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
