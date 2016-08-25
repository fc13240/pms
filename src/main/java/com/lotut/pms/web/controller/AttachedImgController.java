package com.lotut.pms.web.controller;

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

import com.lotut.pms.constants.Settings;
import com.lotut.pms.web.util.WebUtils;

@Controller 
public class AttachedImgController {
private static final Logger LOGGER = Logger.getLogger(AttachedImgController.class);  
    
    @RequestMapping(path="/attachmentImg/{fileType}/{uploadDate}/{fileName}.{suffix}.html")  
    public void attached(HttpServletRequest request, HttpServletResponse response,   
            @PathVariable String fileType,  
            @PathVariable String uploadDate,  
            @PathVariable String suffix,  
            @PathVariable String fileName) {  
          
        InputStream is = null;  
        OutputStream os = null;  
        try {  
            File file = new File(Settings.PATENTDOC_ATTACHMENT_PATH + fileType + "/" + uploadDate + "/" + fileName + "." + suffix);  
            
            WebUtils.writeStreamToResponse(response, new FileInputStream(file));
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
    
    @RequestMapping(path="/InterFaceImg/{fileType}/{fileName}.{suffix}.html")  
    public void attachedInterFacePic(HttpServletRequest request, HttpServletResponse response,   
            @PathVariable String fileType,   
            @PathVariable String suffix,  
            @PathVariable String fileName) {  
          
        InputStream is = null;  
        OutputStream os = null;  
        try {  
            File file = new File(Settings.PATENTDOC_INTERFACEPIC_PATH + fileType + "/" + fileName + "." + suffix);  
            
            WebUtils.writeStreamToResponse(response, new FileInputStream(file));
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
