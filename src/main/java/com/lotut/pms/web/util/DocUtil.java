package com.lotut.pms.web.util;

public class DocUtil {

     //替换html标签
       public  static String txtContent(String content) {  
  		 String txtcontent = content.replaceAll("</?[^>]+>", ""); //剔出<html>的标签  
           txtcontent = txtcontent.replace("&nbsp;", " ");
           txtcontent.replaceAll("<a>\\s*|\t|\r|</a>", "");//去除字符串中的空格,回车,换行符,制表符  
           txtcontent=txtcontent.replaceAll("(<(\\/)?p>)|\\s", "\n");
           return txtcontent;
  	 }
}