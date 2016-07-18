package com.lotut.pms.web.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(path="/kindEditor")
public class kindController
{
	
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String test(Model model){
		model.addAttribute("msg", "Hello FindEditor");
		return "kindEditor";
	}
	
	/**
	 * 提交表单操作
	 */
	@RequestMapping(value="/ajaxForm",method=RequestMethod.POST)
	public void ajaxForm(HttpServletResponse response, String content)
	{
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        PrintWriter writer = null;
        try {
            writer = response.getWriter();
            
			writer.println(content);
            
            writer.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
	}
}
