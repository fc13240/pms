package com.lotut.pms.web.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lotut.pms.domain.Brand;
import com.lotut.pms.domain.BrandCategory;
import com.lotut.pms.domain.BrandSearchCondition;
import com.lotut.pms.domain.Page;
import com.lotut.pms.service.BrandService;
import com.lotut.pms.util.PrincipalUtils;
import com.lotut.pms.web.util.WebUtils;

@Controller
@RequestMapping(path="/brand")
public class BrandController {
	
	private BrandService brandService;

	@Autowired
	public BrandController(BrandService brandService) {
		this.brandService = brandService;
	}

	@RequestMapping(path="/upload", method=RequestMethod.POST)
	public String uploadBrands(@RequestParam("brandFile")Part brandFile, Model model){
		
		return null;
		
	}
	
	@RequestMapping(path="list")
	public String BrandList(HttpSession session,Page page,Model model){
		int userId = PrincipalUtils.getCurrentUserId();
		page.setUserId(userId);
		page.setPageSize(WebUtils.getPageSize(session));
		if(page.getCurrentPage()<1){
			page.setCurrentPage(1);
		}
		int totalCount = brandService.getUserBrandsCount(userId);
		page.setTotalRecords(totalCount);
		List<Brand> brands = brandService.getUserBrandsByPage(page);
		List<BrandCategory> categorys = brandService.getAllCategorys();
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("brands",brands);
		model.addAttribute("page",page);
		model.addAttribute("categorys",categorys);
		return "brand_list";
	}
	
	@RequestMapping(path="/updateCheckStatus", method=RequestMethod.POST)
	public void updateCheckStatus(@RequestParam("status")int status,@RequestParam("id")int id,PrintWriter pw){
		brandService.updateCheckStatus(status, id);
		pw.write(1);
	}
	
	@RequestMapping(path="/updateRecommend", method=RequestMethod.POST)
	public void updateRecommend(@RequestParam("status")int status,@RequestParam("id")int id,PrintWriter pw){
		brandService.updateRecommend(status, id);
		pw.write(1);
	}
	
	@RequestMapping(path="/searchUserBrands")
	public String searchUserBrands(HttpSession session,BrandSearchCondition searchCondition,Model model){
		int userId = PrincipalUtils.getCurrentUserId();
		searchCondition.setUserId(userId);
		int totalCount = brandService.getsearchUserBrandsCount(searchCondition);
		searchCondition.getPage().setTotalRecords(totalCount);
		searchCondition.getPage().setPageSize(WebUtils.getPageSize(session));
		List<Brand> brands = brandService.searchUserBrandsByPage(searchCondition);
		List<BrandCategory> categorys = brandService.getAllCategorys();
		model.addAttribute("searchCondition",searchCondition);
		model.addAttribute("brands",brands);
		model.addAttribute("page",searchCondition.getPage());
		model.addAttribute("categorys",categorys);
		return "brand_list";
	}
}
