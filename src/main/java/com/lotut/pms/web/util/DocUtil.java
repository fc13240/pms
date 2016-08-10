package com.lotut.pms.web.util;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;


import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateExceptionHandler;

public class DocUtil {
       private Configuration configure = null;
       public DocUtil(){
              configure= new Configuration();
              configure.setDefaultEncoding("utf-8");
       }
       /**
        * 根据Doc模板生成word文件
        * @param dataMap Map 需要填入模板的数据
        * @param fileName 文件名称
        * @param savePath 保存路径
        */
       public void createDoc(Map<String, Object> dataMap, String downloadType, String savePath){
              try{
                     //加载需要装填的模板
                     Template template  = null;
                     //加载模板文件
                     configure.setClassForTemplateLoading(this.getClass(),"/com/lotut/pms/web/util");
                     //设置对象包装器
                     configure.setObjectWrapper(new DefaultObjectWrapper());
                     //设置异常处理器
                     configure.setTemplateExceptionHandler(TemplateExceptionHandler.IGNORE_HANDLER);
                     template= configure.getTemplate(downloadType + ".ftl");
                     //输出文档
                     File outFile = new File(savePath);
                     Writer out = null;
                     out= new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outFile),"utf-8"));                                   
                     template.process(dataMap,out);
                     //outFile.delete();
              }catch (Exception e) {
                     e.printStackTrace();
              }
       }
       
      
       public static void main(String[] args) {
    	   DocUtil doc=new DocUtil();
    	   Map<String, Object> dataMap=new HashMap<>();
    	   dataMap.put("name", "<span style=\"color:red;\">标题</span>");
    	   doc.createDoc(dataMap,"resume","d:/Tmpl.doc");
	}
       
       public  String txtContent(String content) {  
           
  		 String txtcontent = content.replaceAll("</?[^>]+>", ""); //剔出<html>的标签  
           txtcontent = txtcontent.replace("&nbsp;", " ");
           txtcontent.replaceAll("<a>\\s*|\t|\r|</a>", "");//去除字符串中的空格,回车,换行符,制表符  
           txtcontent=txtcontent.replaceAll("(<(\\/)?p>)|\\s", "\n");
           return txtcontent;
  	 }
}