package com.lotut.pms.web.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
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
			attachmentIntroduces+=Introdurce.getCaption()+"<br/>"+Introdurce.getLabel();
		}
		return attachmentIntroduces;
	}
	
	public  static String writeWordManualFile(String saveWordPathDir,PatentDoc patentDoc,String fileName,List<Attachment> attachmentIntrodurces) {
		String saveWordPath=saveWordPathDir+"/"+ fileName;
		try{
		
				
				String templatePath = Settings.WORD_MANUAL_TEMPLATE;
				
				String name=DocUtil.txtContent(patentDoc.getName());
		        String techDomain=DocUtil.txtContent(patentDoc.getTechDomain());
		        String backTech=DocUtil.txtContent(patentDoc.getBackgoundTech());
		        String content=DocUtil.txtContent(patentDoc.getContent());
		        String implementWay=DocUtil.txtContent(patentDoc.getImplementWay());
		        String attachmentIntroduces = DocUtil.txtContent(getAttachments(attachmentIntrodurces));
				
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
 
    
    
     

}
