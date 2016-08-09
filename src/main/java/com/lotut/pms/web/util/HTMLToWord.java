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

public class HTMLToWord {/*
	public void htmlToWord2() throws Exception {
        InputStream bodyIs = new FileInputStream("d:\\1.html");
        InputStream cssIs = new FileInputStream("d:\\1.css");
        String body = this.getContent(bodyIs);
        String css = this.getContent(cssIs);
        //拼一个标准的HTML格式文档
        String content = "<html><head><style>" + css + "</style></head><body>" + body + "</body></html>";
        InputStream is = new ByteArrayInputStream(content.getBytes("GBK"));
        OutputStream os = new FileOutputStream("d:\\1.doc");
        this.inputStreamToWord(is, os);
     }
     
     *//**
      * 把is写入到对应的word输出流os中
      * 不考虑异常的捕获，直接抛出
      * @param is
      * @param os
      * @throws IOException
      *//*
     private void inputStreamToWord(InputStream is, OutputStream os) throws IOException {
        POIFSFileSystem fs = new POIFSFileSystem();
        //对应于org.apache.poi.hdf.extractor.WordDocument
        fs.createDocument(is, "WordDocument");
        fs.writeFilesystem(os);
        os.close();
        is.close();
     }
     
     *//**
      * 把输入流里面的内容以UTF-8编码当文本取出。
      * 不考虑异常，直接抛出
      * @param ises
      * @return
      * @throws IOException
      *//*
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
     @Test
     public  void main(String[] args) throws Exception {
    	 try {
			htmlToWord2();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/
	
	
	
	
	
   /* public static boolean writeWordFile() {  
        boolean w = false;  
        String path = "d:/";  
        try {  
            if (!"".equals(path)) {  
                // 检查目录是否存在  
                File fileDir = new File(path);  
                if (fileDir.exists()) {  
                    // 生成临时文件名称  
                    String fileName = "a.doc";  
                    String content = "<html><div style=\"text-align: center\"><span style=\"font-size: 28px\"><span style=\"font-family: 黑体\">" +  
                        "制度发布通知<br /> <br /> </span></span></div></html>";
                    
                    
                    String body ="<span style=\"color:#444444;font-family:&quot;font-size:13px;line-height:24px;background-color:#FFFFFF;\">"
                    		+ "注意套用模板时专利名称不得超过25个字，化学领域的某些申请允许最多到40个字，这个规定可要注意哦。</span><br />"
                    		+ "<span style=\"color:#444444;font-family:&quot;font-size:13px;line-height:24px;background-color:#FFFFFF;\">"
                    		+ "蓝色标记文字为撰写提示，例如</span><span class=\"title2span1\" style=\"color:#12CEDA;font-family:&quot;line-height:24px;font-size:13px;background-color:#FFFFFF;\">"
                    		+ "（产品类型的名称）</span><span style=\"color:#444444;font-family:&quot;font-size:13px;line-height:24px;background-color:#FFFFFF;\">；"
                    		+ "草绿色标记文字为参考示例，例如</span><span class=\"title2span2\" style=\"color:#91A960;font-family:&quot;line-height:24px;font-size:13px;background-color:#FFFFFF;\">"
                    		+ "[碳石墨环轴密封结构]</span><span style=\"color:#444444;font-family:&quot;font-size:13px;line-height:24px;background-color:#FFFFFF;\">。</span>";
                    
                    String content = "<html><div style=\"text-align: center\"><span style=\"font-size: 28px\"><span style=\"font-family: 黑体\">" +  
                    		body+"<br /> <br /> </span></span></div></html>";
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
    }  */
    
	
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
	                    /*String content = "<html><div style=\"text-align: center\"><span style=\"font-size: 28px\"><span style=\"font-family: 黑体\">" +  
	                        "制度发布通知<br /> <br /> </span></span></div></html>";
	                    */
	                    String name=patentDoc.getName();
	                    String techDomain=patentDoc.getTechDomain();
	                    String backTech=patentDoc.getBackgoundTech();
	                    String contentProblem=patentDoc.getContentProblem();
	                    String contentRight=patentDoc.getContentRight();
	                    String contentEffect=patentDoc.getContentEffect();
	                    String implementWay=patentDoc.getImplementWay();
	                    String rightClaim=patentDoc.getRightClaim();
	                    String abstractDescription=patentDoc.getAbstractDescription();
	                    String content = "<html><div style=\"text-align: center\"><span style=\"font-size: 28px\"><span style=\"font-family: 黑体\">" +
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
