package com.lotut.pms.web.patentWriteController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.lotut.pms.domain.PatentDoc;
import com.lotut.pms.service.PatentDocService;
import com.lotut.pms.util.PrincipalUtils;

@Controller
@RequestMapping(path="/editor")
public class PatentWriteDocController {
	private PatentDocService patentDocService;
	
	@Autowired
	public PatentWriteDocController(PatentDocService patentDocService) {
		this.patentDocService = patentDocService;
	}
	

	@RequestMapping(path="/writeForm")
	public String editorForm(Model model){
		return "edit_index";
	}
	
	@RequestMapping(path="/addPatentDoc",method=RequestMethod.POST)
	public String  addEditorText(@ModelAttribute("patentDoc") PatentDoc patentDoc,HttpServletRequest request){
		int userId=PrincipalUtils.getCurrentUserId();
		patentDoc.setUserId(userId);
		String name =request.getParameter("name");
		patentDoc.setName(name);
		String techDomain =request.getParameter("techDomain");
		patentDoc.setTechDomain(techDomain);
		String backgoundTech =request.getParameter("backgoundTech");
		patentDoc.setBackgoundTech(backgoundTech);
		String contentProblem =request.getParameter("contentProblem");
		patentDoc.setContentProblem(contentProblem);
		String contentRight =request.getParameter("contentRight");
		patentDoc.setContentRight(contentRight);
		String contentEffect =request.getParameter("contentEffect");
		patentDoc.setContentEffect(contentEffect);
		String implementWay =request.getParameter("implementWay");
		patentDoc.setImplementWay(implementWay);
		String abstractDescription =request.getParameter("abstractDescription");
		patentDoc.setAbstractDescription(abstractDescription);
		String rightClaim =request.getParameter("rightClaim");
		patentDoc.setRightClaim(rightClaim);
		patentDocService.savePatentDoc(patentDoc);
		return "edit_index";
	}
	
	
	
	
	
	
	/**
	 * 提交表单操作
	 */
	@RequestMapping(path="/ajaxForm",method=RequestMethod.POST)
	public void ajaxForm(HttpServletResponse response, String content){
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
