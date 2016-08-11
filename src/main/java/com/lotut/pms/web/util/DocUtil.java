package com.lotut.pms.web.util;

import java.io.IOException;
import java.io.InputStream;

public class DocUtil {

     /**
      * html内容过滤
      * @param content
      * @return
      */
       public  static String txtContent(String content) {  
  		 String txtcontent = content.replaceAll("</?[^>]+>", ""); //剔出<html>的标签  
           txtcontent = txtcontent.replace("&nbsp;", " ");
           txtcontent.replaceAll("<a>\\s*|\t|\r|</a>", "");//去除字符串中的空格,回车,换行符,制表符  
           txtcontent=txtcontent.replaceAll("(<(\\/)?p>)|\\s", "\n");
           return txtcontent;
  	 }
       
      public static String ImagUrltoImagAddress(String imagUrl){
    	  String imagAddress = null;
    	  String[]  imagUrlArray=imagUrl.split("\\.");
    	  imagAddress=imagUrlArray[0]+"."+imagUrlArray[1];
    	  return imagAddress;
      }

       /** 
        * 将输入流中的数据写入字节数组 
        * @param in 
        * @return 
        */  
       public static byte[] inputStream2ByteArray(InputStream in,boolean isClose){  
           byte[] byteArray = null;  
           try {  
               int total = in.available();  
               byteArray = new byte[total];  
               in.read(byteArray);  
           } catch (IOException e) {  
               e.printStackTrace();  
           }finally{  
               if(isClose){  
                   try {  
                       in.close();  
                   } catch (Exception e2) {  
                       System.out.println("关闭流失败");  
                   }  
               }  
           }  
           return byteArray;  
       }
   }