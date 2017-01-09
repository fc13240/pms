package com.lotut.pms.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lotut.pms.domain.BrandNotice;
import com.lotut.pms.domain.Page;
import com.lotut.pms.service.BrandNoticeService;
import com.lotut.pms.util.PrincipalUtils;
import com.lotut.pms.web.util.WebUtils;

@Controller
@RequestMapping(path="/brandNotice")
public class BrandNoticeController {
	private BrandNoticeService brandNoticeService;
	
	@Autowired
	public BrandNoticeController(BrandNoticeService brandNoticeService) {
		this.brandNoticeService = brandNoticeService;
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
	
	@RequestMapping(path="/batchChangeBrandNoticeViewStatus", method=RequestMethod.GET)
	public void batchChangeBrandNoticeViewStatus(@RequestParam("notices")List<Long> noticeIdList) {
		int userId = PrincipalUtils.getCurrentUserId();
		brandNoticeService.batchChangeBrandNoticeViewStatus(noticeIdList, userId);
	}
	
}
