package com.lotut.pms.web.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lotut.pms.domain.GoodsDetail;
import com.lotut.pms.domain.GoodsFirstColumn;
import com.lotut.pms.domain.GoodsSecondColumn;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.Patent;
import com.lotut.pms.domain.PatentSearchCondition;
import com.lotut.pms.domain.PatentStatus;
import com.lotut.pms.domain.PatentType;
import com.lotut.pms.domain.User;
import com.lotut.pms.service.FriendService;
import com.lotut.pms.service.PatentService;
import com.lotut.pms.util.PrincipalUtils;
import com.lotut.pms.web.util.WebUtils;



@Controller
@RequestMapping(path="/patent")
public class PatentController {
	private PatentService patentService;
	private FriendService friendService;
	
	@Autowired
	public PatentController(PatentService patentService, FriendService friendService) {
		this.patentService = patentService;
		this.friendService = friendService;
	}

	@RequestMapping(path="/list", method=RequestMethod.GET)
	public String getUserPatents(Model model, Page page, HttpSession session) {
		int userId = PrincipalUtils.getCurrentUserId();
		page.setUserId(userId);
		page.setPageSize(WebUtils.getPageSize(session));
		if (page.getCurrentPage() <= 0) {
			page.setCurrentPage(1);
		}
		//分页相关
		int totalCount=(int)patentService.getPatentsCount(userId);
		page.setTotalRecords(totalCount);
		Map<String, Map<String, String>> patentTypeCount=patentService.getUserPatentCountByType(userId);
		Map<String, Map<String, String>> patentStatusCount=patentService.searchUserPatentsByPatentStatus(userId);
		List<Patent> patents = patentService.getUserPatents(page);
		model.addAttribute("patents", patents);
		model.addAttribute("page", page);
		model.addAttribute("patentTypeCount", patentTypeCount);
		model.addAttribute("patentStatusCount", patentStatusCount);
		addPatentTypeAndStatusDataToModel(model);
		return "patent_list";
	}
	
	@RequestMapping(path="list", method=RequestMethod.GET, params="patentType")
	public String getPatentsByType(@RequestParam("patentType") int patentType, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<Patent> patents = patentService.getUserPatentsByType(userId, patentType);
		model.addAttribute("patents", patents);
		addPatentTypeAndStatusDataToModel(model);
		return "patent_list";
	}
	
	@RequestMapping(path="list", method=RequestMethod.GET, params="patentStatus")
	public String getPatentsByStatus(@RequestParam("patentStatus") int patentStatus, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<Patent> patents = patentService.getUserPatentsByStatus(userId, patentStatus);
		model.addAttribute("patents", patents);
		addPatentTypeAndStatusDataToModel(model);
		return "patent_list";
	}	
	
	@RequestMapping(path="list", method=RequestMethod.GET, params="user")
	public String getShareUserPatents(@RequestParam("user") int userId, Model model) {
		return null;
	}	
	
	
	@RequestMapping(path="showFriends", method=RequestMethod.GET)
	public String showFriends(Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> friends = friendService.getUserFriends(userId);
		model.addAttribute("friends", friends);
		return "patent_select_friends";
	}	
	
	@RequestMapping(path="searchFriends", method=RequestMethod.GET)
	public String searchFriends(@RequestParam("keyword")String keyword, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> friends = friendService.searchUserFriends(userId, keyword);
		model.addAttribute("friends", friends);
		return "patent_select_friends";
	}	
	
	@RequestMapping(path="/detail/{patentId:\\d+}", method=RequestMethod.GET)
	public String showDetail(@PathVariable long patentId, Model model) {
		Patent patent = patentService.getPatentDetail(patentId);
		model.addAttribute("patent", patent);
		return "patent_detail";
	}	
	
	
	@RequestMapping(path="/changeInternalCode", method=RequestMethod.GET)
	public String changeInternalCode(@RequestParam("patentId")int patentId, @RequestParam("internalCode")String internalCode) {
		patentService.changeInternalCode(patentId, internalCode);
		return "patent_list";
	}
	
	@RequestMapping(path="/search", method=RequestMethod.GET)
	public String searchUserPatents(@ModelAttribute("searchCondition")PatentSearchCondition searchCondition, Model model,HttpSession session) {
		Page page=searchCondition.getPage();
		page.setPageSize(WebUtils.getPageSize(session));
		searchCondition.setUserId(PrincipalUtils.getCurrentUserId());
		List<Patent> resultPatents = patentService.searchUserPatentsWithPage(searchCondition);
		int totalCount=(int)patentService.searchUserPatentsCount(searchCondition);
		page.setTotalRecords(totalCount);
		Map<String, Map<String, String>> patentTypeCount=patentService.getUserPatentCountByType(searchCondition.getUserId());
		Map<String, Map<String, String>> patentStatusCount=patentService.searchUserPatentsByPatentStatus(searchCondition.getUserId());
		model.addAttribute("patents", resultPatents);
		model.addAttribute("page", page);
		model.addAttribute("patentTypeCount",patentTypeCount);
		model.addAttribute("patentStatusCount",patentStatusCount);
		addPatentTypeAndStatusDataToModel(model);
		return "patent_list";
	}
	
	@RequestMapping(path="/showUploadForm", method=RequestMethod.GET)
	public String showUploadForm() {
		return "patent_upload_form";
	}	
	
	@RequestMapping(path="/upload", method=RequestMethod.POST)
	public String uploadPatents(@RequestParam("patentFile")Part patentFile, Model model) {
		try {
			if (!patentFile.getSubmittedFileName().endsWith(".xls") && !patentFile.getSubmittedFileName().endsWith(".xlsx")) {
				throw new RuntimeException("上传的文件不是excel表格");
			}
			InputStream is = patentFile.getInputStream();
			int userId = PrincipalUtils.getCurrentUserId();
			patentService.uploadPatents(is,userId);
			return "upload_success";
		} catch (Exception e) {
			model.addAttribute("message", "上传失败，请检查文件格式稍后再试！");
			return "common_message";
		}
	}	
	
	@RequestMapping(path="/goods", method=RequestMethod.GET)
	public String showGoodsForm(@RequestParam("patent") int patent_id,Model model) throws IOException {
		
		List<GoodsFirstColumn>  FirstColumns=patentService.getFirstColumn();
		
		Patent patent = patentService.getPatentDetail(patent_id);
		model.addAttribute("patent", patent);		
		
		model.addAttribute("patentId", patent_id);
		model.addAttribute("FirstColumns", FirstColumns);
		return "goods_form";
	}	
	@RequestMapping(path="/addGoods", method=RequestMethod.POST)
	public String addGoods(@Valid GoodsDetail GoodsDetail, Model model) throws IOException {
		
		patentService.saveGoods(GoodsDetail);
		
		
		return "goods_add_success";
	}		
		
	@RequestMapping(path="/getGoodsSecoundColumn", method=RequestMethod.GET)
	public void getGoodsSecoundColumn(@RequestParam("first_column")int firstColumnId, 
			Model model, HttpServletResponse response) throws IOException {

		response.setContentType("application/json;charset=UTF-8");
		List<GoodsSecondColumn>  SecondColumns=patentService.getSecondColumn(firstColumnId);
		WebUtils.writeJsonStrToResponse(response, SecondColumns);
	}
	

	
	
	
	private void addPatentTypeAndStatusDataToModel(Model model) {
		List<PatentType> allPatentTypes = patentService.getAllPatentTypes();
		List<PatentStatus> allPatentStatus = patentService.getAllPatentStatus();
		model.addAttribute("allPatentTypes", allPatentTypes);
		model.addAttribute("allPatentStatus", allPatentStatus);
	}
	
	@RequestMapping(path="/addPatentFrom", method=RequestMethod.GET)
	public String addPatentFrom(Model model){
		addPatentTypeAndStatusDataToModel(model);
		return "addPatentFrom";
	}
	
	@RequestMapping(path="/addPatent", method=RequestMethod.POST)
	public String addPatent(@ModelAttribute("patent")Patent patent,Model model){
		int userId = PrincipalUtils.getCurrentUserId();
		patent.setOwnerId(userId);
		patentService.addPatent(patent);
		return "add_patent_success";
	}
	
	@RequestMapping(path="/exportPatents",method=RequestMethod.GET)
	public void exportPatents(@RequestParam("patentIds") List<Long> patentIds,HttpServletResponse response) throws IOException{
		response.setContentType("application/vnd.ms-excel");
		User user= PrincipalUtils.getCurrentPrincipal();
		String exportExcelName=user.getUsername()+System.currentTimeMillis()+".xls";
		String exportExcelPath=patentService.generatePatentExportExcel(patentIds, exportExcelName);
		File excelFile = new File(exportExcelPath);
		response.setContentLength((int)excelFile.length());
		response.setHeader("Content-Disposition", "attachment;filename="+exportExcelName);
		int BUFFER_SIZE=8192;
		byte[] buffer = new byte[BUFFER_SIZE];
		try(OutputStream out =response.getOutputStream();
				BufferedInputStream bis= new BufferedInputStream(new FileInputStream(excelFile))){
			int byteRead = -1;
			while((byteRead=bis.read(buffer))!=-1){
				out.write(buffer, 0, byteRead);
			}
			out.flush();
			out.close();
		}
	}
	
	
}
