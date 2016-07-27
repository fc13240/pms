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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
		int userId=PrincipalUtils.getCurrentUserId();
		List<PatentDoc> patentDocs=patentDocService.getUserPatentDoc(userId);
		model.addAttribute("patentDocs", patentDocs);
		return "patentDoc_editor";
	}
	
	@RequestMapping(path="/addPatentDoc",method=RequestMethod.POST)
	public void  addEditorText(PatentDoc patentDoc,HttpServletRequest request,PrintWriter writer){
		int userId=PrincipalUtils.getCurrentUserId();
		patentDoc.setUserId(userId);
		patentDocService.savePatentDoc(patentDoc);
		writer.write(1);
	}
	
	@RequestMapping(path="/findPatentDoc",method=RequestMethod.GET)
	public String  findPatentDoc(@RequestParam("patentDocsId")long patentDocsId,Model model){
		int userId=PrincipalUtils.getCurrentUserId();
		PatentDoc patentDoc=patentDocService.getUserPatentDocById(patentDocsId);
		List<PatentDoc> patentDocs=patentDocService.getUserPatentDoc(userId);
		model.addAttribute("patent", patentDoc);
		model.addAttribute("patentDocs", patentDocs);
		return "patentDoc_search";
		
	}
	
	@RequestMapping(path="/PatentDocList",method=RequestMethod.GET)
	public String  PatentDocList(Model model){
		int userId=PrincipalUtils.getCurrentUserId();
		List<PatentDoc> patentDocs=patentDocService.getUserPatentDoc(userId);
		model.addAttribute("patentDocs", patentDocs);
		return "patentDoc_list";
		
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
