package com.lotut.pms.web.controller;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lotut.pms.domain.BrandCategory;
import com.lotut.pms.domain.BrandCategoryCount;
import com.lotut.pms.domain.BrandLegalStatus;
import com.lotut.pms.domain.BrandLegalStatusCount;
import com.lotut.pms.domain.BrandNotice;
import com.lotut.pms.domain.BrandNoticeRemark;
import com.lotut.pms.domain.BrandNoticeSearchCondition;
import com.lotut.pms.domain.BrandNoticeType;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.User;
import com.lotut.pms.service.BrandManagementService;
import com.lotut.pms.service.BrandNoticeService;
import com.lotut.pms.util.PrincipalUtils;
import com.lotut.pms.web.util.WebUtils;

@Controller
@RequestMapping(path="/brandNotice")
public class BrandNoticeController {
	private BrandNoticeService brandNoticeService;
	private BrandManagementService brandManagementService;
	@Autowired
	public BrandNoticeController(BrandNoticeService brandNoticeService,BrandManagementService brandManagementService) {
		this.brandNoticeService = brandNoticeService;
		this.brandManagementService=brandManagementService;
	}
	
	@RequestMapping(path="getBrandNoticeList")
	public String getBrandNoticeList(HttpSession session,Page page,Model model){
		int userId = PrincipalUtils.getCurrentUserId();
		page.setUserId(userId);
		page.setPageSize(WebUtils.getPageSize(session));
		if(page.getCurrentPage()<1){
			page.setCurrentPage(1);
		}
		int totalCount = brandNoticeService.getUserBrandNoticeCount(userId);
		List<BrandNotice> notices = brandNoticeService.getUserBrandNoticeList(page);
		page.setTotalRecords(totalCount);
		model.addAttribute("notices",notices);
		model.addAttribute("page",page);
		return "brand_notice_list";
	}
	
	
	@RequestMapping(path="/downloadUserNotice")
	public void downloadUserNotice(@RequestParam("noticeIds") List<Integer> noticeIds,HttpServletResponse response) throws Exception{
		response.setHeader("X-FRAME-OPTION", "SAMEORIGIN");
		response.setContentType("application/vnd-ms-excel");
		String excelName = PrincipalUtils.getCurrentPrincipal().getUsername() + System.currentTimeMillis() +".xls";
		String excelNoticePath = brandNoticeService.exportNoticeExcel(noticeIds,excelName);
		response.setHeader("Content-Disposition", "attachment;filename=" + excelName);
		
		final int BUFFER_SIZE = 8192;
		byte[] buffer = new byte [BUFFER_SIZE];
		
		try(OutputStream out =response.getOutputStream();
			BufferedInputStream  in = new BufferedInputStream(new FileInputStream(excelNoticePath))	
			){
			int byteRead = -1;
			while((byteRead = in.read(buffer))!=-1){
				out.write(buffer,0,byteRead);
			}
			out.flush();
			out.close();
			in.close();
		}
	}
	
	@RequestMapping(path="/getBrandNoticeRemark")
	public String getBrandNoticeReamrk(long brandNoticeId,Model model){
		List<BrandNoticeRemark> remarks = brandNoticeService.getBrandNoticeListByNoticeId(brandNoticeId);
		model.addAttribute("remarks",remarks);
		model.addAttribute("brandNoticeId",brandNoticeId);
		return "brand_notice_remarks";
	}
	
	@RequestMapping(path="/saveBrandNoticeReamrk")
	public void saveBrandNoticeReamrk(@ModelAttribute BrandNoticeRemark brandNoticeRemark,Model model,PrintWriter pw){
		User user = PrincipalUtils.getCurrentPrincipal();
		brandNoticeRemark.setUser(user);
		brandNoticeService.saveBrandNoticeRemark(brandNoticeRemark);
		pw.write("success");
	}
	@RequestMapping(path="/batchChangeBrandNoticeViewStatus", method=RequestMethod.GET)
	public void batchChangeBrandNoticeViewStatus(@RequestParam("notices")List<Long> noticeIdList) {
		int userId = PrincipalUtils.getCurrentUserId();
		brandNoticeService.batchChangeBrandNoticeViewStatus(noticeIdList, userId);
	}
	
	@RequestMapping(path = "/searchBrandNotice", method = RequestMethod.GET)
	public String searchBrandNotice(@ModelAttribute("searchCondition") BrandNoticeSearchCondition searchCondition, HttpSession session,
			Model model) {
		Page page = searchCondition.getPage();
		int userId = PrincipalUtils.getCurrentUserId();
		page.setUserId(userId);
		page.setPageSize(WebUtils.getPageSize(session));
		if (page.getCurrentPage() <= 0) {
			page.setCurrentPage(1);
		}
		int totalCount = brandNoticeService.searchBrandNoticeCountByPage(searchCondition);
		page.setTotalRecords(totalCount);
		List<BrandNotice> notices = brandNoticeService.searchUserBrandNoticeByPage(searchCondition);
		page.setTotalRecords(totalCount);
		List<BrandLegalStatusCount> brandLegalStatus=brandManagementService.getLegalStatusCount(page.getUserId());
		List<BrandCategoryCount> brandCategory=brandManagementService.getBrandCategoryCount(page.getUserId());
		model.addAttribute("notices",notices);
		model.addAttribute("page", page);
		model.addAttribute("brandLegalStatus", brandLegalStatus);
		model.addAttribute("brandCategory", brandCategory);
		addBrandCategoryAndBrandLegalStatusToModel(model);
		return "brand_notice_list";
	}
	
	private void addBrandCategoryAndBrandLegalStatusToModel(Model model) {
		List<BrandCategory> categorys = brandManagementService.getAllBrandCategory();
		List<BrandLegalStatus> allBrandLegalStatus = brandManagementService.getAllBrandLegalStatus();
		List<BrandNoticeType> noticeTypes= brandNoticeService.getBrandNoticeTypes();
		model.addAttribute("categorys", categorys);
		model.addAttribute("allBrandLegalStatus", allBrandLegalStatus);
		model.addAttribute("noticeTypes", noticeTypes);
	}
}
