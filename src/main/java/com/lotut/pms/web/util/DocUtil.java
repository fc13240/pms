package com.lotut.pms.web.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    	  return "opt/media"+imagAddress;
      }

       

       
      
       
       public static void main(String[] args) throws Exception {
    	   
           
  
       }

   }