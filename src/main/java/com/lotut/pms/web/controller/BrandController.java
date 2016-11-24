package com.lotut.pms.web.controller;

import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lotut.pms.constants.Settings;
import com.lotut.pms.domain.Brand;
import com.lotut.pms.domain.BrandCategory;
import com.lotut.pms.domain.BrandSearchCondition;
import com.lotut.pms.domain.Page;
import com.lotut.pms.service.BrandService;
import com.lotut.pms.util.PrincipalUtils;
import com.lotut.pms.web.util.WebUtils;

import net.lingala.zip4j.exception.ZipException;

@Controller
@RequestMapping(path="/brand")
public class BrandController {
	
	private BrandService brandService;

	@Autowired
	public BrandController(BrandService brandService) {
		this.brandService = brandService;
	}
	
	@RequestMapping(path="/showUploadForm", method=RequestMethod.GET)
	public String showUploadForm() {
		return "brand_upload_form";
	}	
	
	@RequestMapping(path="/upload", method=RequestMethod.POST)
	public String uploadBrands(@RequestParam("brandFile")Part brandFile, Model model){
//			String fileName=brandFile.getSubmittedFileName();
		try {
			if (!brandFile.getSubmittedFileName().endsWith(".xls") && !brandFile.getSubmittedFileName().endsWith(".xlsx")) {
				throw new RuntimeException("上传的文件不是excel表格");
			}
			InputStream is = brandFile.getInputStream();
			int userId = PrincipalUtils.getCurrentUserId();
			brandService.uploadBrands(is, userId);
			return "brand_upload_success";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "上传失败，请检查文件格式稍后再试！");
			return "brand_common_message";
		}
	}
	
	@RequestMapping(path="list")
	public String BrandList(HttpSession session,Page page,Model model){
		int userId = PrincipalUtils.getCurrentUserId();
		page.setUserId(userId);
		page.setPageSize(WebUtils.getPageSize(session));
		if(page.getCurrentPage()<1){
			page.setCurrentPage(1);
		}
		
		List<Brand> brands = brandService.getUserBrandsByPage(page);
		List<BrandCategory> categorys = brandService.getAllCategorys();
		model.addAttribute("brands",brands);
		model.addAttribute("page",page);
		model.addAttribute("categorys",categorys);
		return "brand_list";
	}
	
	@RequestMapping(path="/updateCheckStatus", method=RequestMethod.POST)
	public void updateCheckStatus(@RequestParam("status")int status,@RequestParam("id")int id){
		brandService.updateCheckStatus(status, id);
		
	}
	
	@RequestMapping(path="/updateRecommend", method=RequestMethod.POST)
	public void updateRecommend(@RequestParam("status")int status,@RequestParam("id")int id){
		brandService.updateRecommend(status, id);
	}
	
	@RequestMapping(path="/searchUserBrands")
	public String searchUserBrands(HttpSession session,Page page,Model model,BrandSearchCondition brandSearchCondition){
		int userId = PrincipalUtils.getCurrentUserId();
		page.setUserId(userId);
		page.setPageSize(WebUtils.getPageSize(session));
		if(page.getCurrentPage()<1){
			page.setCurrentPage(1);
		}
		
		List<Brand> brands = brandService.searchUserBrandsByPage(brandSearchCondition);
		List<BrandCategory> categorys = brandService.getAllCategorys();
		model.addAttribute("brands",brands);
		model.addAttribute("page",page);
		model.addAttribute("categorys",categorys);
		return "brand_list";
	}
}
