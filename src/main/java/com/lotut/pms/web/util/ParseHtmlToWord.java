package com.lotut.pms.web.util;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.usermodel.Range;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

public class ParseHtmlToWord {
	    
		     
		   public static void main(String[] args) throws IOException {
			   String  body="<span style='color:#444444;font-family:&quot;font-size:13px;line-height:24px;background-color:#FFFFFF;'>注意套用模板时专利名称不得超过25个字，化学领域的某些申请允许最多到40个字，这个规定可要注意哦。</span><br />+<span style='color:#444444;font-family:&quot;font-size:13px;line-height:24px;background-color:#FFFFFF;'>蓝色标记文字为撰写提示，例如</span><span class='title2span1' style='color:#12CEDA;font-family:&quot;line-height:24px;font-size:13px;background-color:#FFFFFF;'>（产品类型的名称）</span><span style='color:#444444;font-family:&quot;font-size:13px;line-height:24px;background-color:#FFFFFF;'>；草绿色标记文字为参考示例，例如</span><span class='title2span2' style='color:#91A960;font-family:&quot;line-height:24px;font-size:13px;background-color:#FFFFFF;'>[碳石墨环轴密封结构]</span><span style='color:#444444;font-family:&quot;font-size:13px;line-height:24px;background-color:#FFFFFF;'>。</span>";
			   String content = "<html><head>测试</head><body>" + body + "</body></html>";
			   InputStream is = new ByteArrayInputStream(content.getBytes("GBK"));
		       OutputStream os = new FileOutputStream("D:\\test.doc");
		       inputStreamToWord(is, os);
		   }  
		    
		    
		   private String getContent(InputStream... ises) throws IOException {
		          if (ises != null) {
		             StringBuilder result = new StringBuilder();
		             BufferedReader br;
		             String line;
		             for (InputStream is : ises) {
		                br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
		                while ((line=br.readLine()) != null) {
		                    result.append(line);
		                }
		             }
		             return result.toString();
		          }
		          return null;
		       }
		   
		   
		   private static void inputStreamToWord(InputStream is, OutputStream os) throws IOException {
		          POIFSFileSystem fs = new POIFSFileSystem();
		          //对应于org.apache.poi.hdf.extractor.WordDocument
		          fs.createDocument(is, "WordDocument");
		          fs.writeFilesystem(os);
		          os.close();
		          is.close();
		       }
		   
}


