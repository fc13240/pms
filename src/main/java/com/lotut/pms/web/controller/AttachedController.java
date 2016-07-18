package com.lotut.pms.web.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
public class AttachedController {
	private static final Logger LOGGER = Logger.getLogger(AttachedController.class);  
    
    @RequestMapping("/attached/{fileType}/{uploadDate}/{fileName}.{suffix}")  
    public void attached(HttpServletRequest request, HttpServletResponse response,   
            @PathVariable String fileType,  
            @PathVariable String uploadDate,  
            @PathVariable String suffix,  
            @PathVariable String fileName) {  
        //根据suffix设置响应ContentType  
        //response.setContentType("text/html; charset=UTF-8");  
          
        InputStream is = null;  
        OutputStream os = null;  
        try {  
            File file = new File("d:/attached/" + fileType + "/" + uploadDate + "/" + fileName + "." + suffix);  
            is = new FileInputStream(file);  
            byte[] buffer = new byte[is.available()];  
            is.read(buffer);  
              
            os = new BufferedOutputStream(response.getOutputStream());  
            os.write(buffer);  
            os.flush();  
        } catch (Exception e) {  
            //判断suffix  
            //图片请求可以在此显示一个默认图片  
            //file显示文件已损坏等错误提示...  
            LOGGER.error("读取文件失败", e);  
        } finally {  
            if (is != null) {  
                try {  
                    is.close();  
                } catch (IOException e) {  
                    LOGGER.error("读取文件失败", e);  
                }  
                  
                if (os != null) {  
                    try {  
                        os.close();  
                    } catch (IOException e) {  
                        LOGGER.error("读取文件失败", e);  
                    }  
                }  
            }  
        }  
          
    }  
}
