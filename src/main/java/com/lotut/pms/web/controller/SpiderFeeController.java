package com.lotut.pms.web.controller;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lotut.pms.service.utils.FeeCrawler;
import com.lotut.pms.service.utils.PatentDownload;
import com.lotut.pms.service.utils.PatentExcelStream;
import com.lotut.pms.web.util.WebUtils;

@Controller
@RequestMapping(path="/spiderFee")
public class SpiderFeeController {
	/*
	 * 抓取费用信息
	 */	
	@RequestMapping(path="/getFeeByAppNo", method=RequestMethod.GET)
	public void getFeeByAppNo(HttpServletResponse response,String appNo,PrintWriter pw) {
		FeeCrawler feeCrawler=new FeeCrawler();
			pw.write(feeCrawler.getFeeHtml(appNo));
		}
	
	
	/*
	 * 获取自动更新流
	 */	
	@RequestMapping(path="/getInputStreamByAutoUpdate", method=RequestMethod.GET)
	public void getInputStreamByAutoUpdate(HttpServletResponse response,String userName,String  passWord) {
			try {
				response.setContentType("application/vnd.ms-excel");
				response.setHeader("X-FRAME-OPTIONS", "SAMEORIGIN");
				PatentExcelStream pes=PatentDownload.downloadPatentExcelFile2(userName,passWord);
				response.setContentLength((int)pes.getLength());
				/*System.out.println("内容是："+pes.getInputStream().read());*/
				response.setHeader("Content-Disposition", "attachment;filename=test.xls");
				int BUFFER_SIZE = 8192;
				byte[] buffer = new byte[BUFFER_SIZE];
				try (OutputStream out = response.getOutputStream(); 
						BufferedInputStream bis = new BufferedInputStream(pes.getInputStream())) {
					int bytesRead = -1;
					while ((bytesRead = bis.read(buffer)) != -1) {
						out.write(buffer, 0, bytesRead);
					}
					out.flush();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}	
