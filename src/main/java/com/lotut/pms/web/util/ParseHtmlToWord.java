package com.lotut.pms.web.util;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.chainsaw.Main;
import org.apache.poi.hssf.record.Record;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.usermodel.Range;
import org.apache.poi.poifs.filesystem.DirectoryEntry;
import org.apache.poi.poifs.filesystem.DocumentEntry;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.junit.Test;

public class ParseHtmlToWord {
	    
		   @Test  
		   public void testWrite() throws Exception {  
		      String templatePath = "D:\\test.doc";  
		      InputStream is = new FileInputStream(templatePath);  
		      HWPFDocument doc = new HWPFDocument(is);  
		      Range range = doc.getRange();  
		      //把range范围内的${reportDate}替换为当前的日期  
		      range.replaceText("${reportDate}", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));  
		      range.replaceText("${appleAmt}", "100.00");  
		      range.replaceText("${bananaAmt}", "200.00");  
		      range.replaceText("${totalAmt}", "300.00");  
		      OutputStream os = new FileOutputStream("D:\\word\\write.doc");  
		      //把doc输出到输出流中  
		      doc.write(os);  
		      this.closeStream(os);  
		      this.closeStream(is);  
		   }  
		    
		   /** 
		    * 关闭输入流 
		    * @param is 
		    */  
		   private void closeStream(InputStream is) {  
		      if (is != null) {  
		         try {  
		            is.close();  
		         } catch (IOException e) {  
		            e.printStackTrace();  
		         }  
		      }  
		   }  
		   
		   /** 
		    * 关闭输出流 
		    * @param os 
		    */  
		   private void closeStream(OutputStream os) {  
		      if (os != null) {  
		         try {  
		            os.close();  
		         } catch (IOException e) {  
		            e.printStackTrace();  
		         }  
		      }  
		   }  
		    
		   
}


