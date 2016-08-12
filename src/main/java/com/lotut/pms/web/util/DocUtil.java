package com.lotut.pms.web.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;  
import java.util.regex.Pattern;

import org.apache.commons.io.FileUtils;
import org.apache.poi.POIXMLDocument;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.usermodel.Picture;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.util.IOUtils;
import org.apache.poi.util.Units;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFPictureData;
import java.io.ByteArrayInputStream;  
import java.io.IOException;  
import java.io.InputStream;  
import java.util.Iterator;  
import java.util.List;  
import java.util.Map;  
import java.util.Map.Entry;  
import org.apache.poi.POIXMLDocument;  
import org.apache.poi.openxml4j.opc.OPCPackage;  
import org.apache.poi.xwpf.usermodel.XWPFParagraph;  
import org.apache.poi.xwpf.usermodel.XWPFRun;  
import org.apache.poi.xwpf.usermodel.XWPFTable;  
import org.apache.poi.xwpf.usermodel.XWPFTableCell;  
import org.apache.poi.xwpf.usermodel.XWPFTableRow;

import com.lotut.pms.domain.Attachment;
public class DocUtil {

     /**
      * html内容过滤
      * @param content
      * @return
      */
       public  static String txtContent(String content) {  
  		 String txtcontent = content.replaceAll("</?[^>]+>", ""); //剔出<html>的标签  
           //txtcontent = txtcontent.replace("&nbsp;", " ");
           //txtcontent.replaceAll("<a>\\s*|\t|\r|</a>", "");//去除字符串中的空格,回车,换行符,制表符  
           //txtcontent=txtcontent.replaceAll("(<(\\/)?p>)|\\s", "\n");
           return txtcontent;
  	 }
       
      public static String ImagUrltoImagAddress(String imagUrl){
    	  String imagAddress = null;
    	  String[]  imagUrlArray=imagUrl.split("\\.");
    	  imagAddress=imagUrlArray[0]+"."+imagUrlArray[1];
    	  return "/opt/media"+imagAddress;
      }

       

       
      
       
      
      public static String delHTMLTag(String htmlStr){  
          String regEx_script="<script[^>]*?>[\\s\\S]*?<\\/script>"; //定义script的正则表达式  
          String regEx_style="<style[^>]*?>[\\s\\S]*?<\\/style>"; //定义style的正则表达式  
          String regEx_html="<[^>]+>"; //定义HTML标签的正则表达式  
           
          Pattern p_script=Pattern.compile(regEx_script,Pattern.CASE_INSENSITIVE);  
          Matcher m_script=p_script.matcher(htmlStr);  
          htmlStr=m_script.replaceAll(""); //过滤script标签  
           
          Pattern p_style=Pattern.compile(regEx_style,Pattern.CASE_INSENSITIVE);  
          Matcher m_style=p_style.matcher(htmlStr);  
          htmlStr=m_style.replaceAll(""); //过滤style标签  
           
          Pattern p_html=Pattern.compile(regEx_html,Pattern.CASE_INSENSITIVE);  
          Matcher m_html=p_html.matcher(htmlStr);  
          htmlStr=m_html.replaceAll(""); //过滤html标签  
    
         return htmlStr.trim(); //返回文本字符串  
      }   
        
      /** 
      *去掉字符串里面的html代码。<br> 
      *要求数据要规范，比如大于小于号要配套,否则会被集体误杀。 
      *　 
      *@paramcontent 
      *　　　　　内容 
      *@return去掉后的内容 
      */  
  public static String stripHtml(String content){  
      //<p>段落替换为换行  
      content=content.replaceAll("<p.*?>","");  
      //<br><br/>替换为换行 　  
      content=content.replaceAll("<brs*/?>","");  
      //去掉其它的<>之间的东西   
      content=content.replaceAll("<.*?>","");  
      //还原HTML//content=HTMLDecoder.decode(content);   
      return content;  
      }  
    
  public static String replaceHtml(String html){   
      String regEx="<.+?>"; //表示标签   
      Pattern p=Pattern.compile(regEx);   
      Matcher m=p.matcher(html);   
      String s=m.replaceAll("");   
      return s;   
  }
  
	
  
   }