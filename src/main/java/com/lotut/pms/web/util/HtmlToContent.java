package com.lotut.pms.web.util;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.usermodel.Range;

public class HtmlToContent {

 public  String txtContent(String content) {  
    String txtcontent = content.replaceAll("</?[^>]+>", "");
     txtcontent = txtcontent.replaceAll("<a>\\s*|\t|\r|\n</a>", "");
     return txtcontent;
 }
	 
}
