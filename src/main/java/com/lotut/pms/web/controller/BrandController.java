package com.lotut.pms.web.controller;

import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import com.lotut.pms.domain.News;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.User;
import com.lotut.pms.domain.WeChatOrder;
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
	
	@RequestMapping(path="/showUploadForm", method=RequestMethod.GET)
	public String showUploadForm() {
		return "brand_upload_form";
	}	

	@RequestMapping(path="/brandAddForm")
	public String brandAddForm(Model model) {
		List<BrandCategory> categorys = brandService.getAllCategorys();
		model.addAttribute("categorys",categorys);
		return "brand_add_form";
		
	}		

	@RequestMapping(path="/brandAdd")
	public String brandAdd(Brand brand) {
		int userId = PrincipalUtils.getCurrentUserId();
		User user = new User();
		user.setUserId(userId);
		brand.setUser(user);
		brandService.addOrEditBrand(brand);
		return "redirect:/brand/list.html";
	}	

	@RequestMapping(path="/brandUpdateForm")
	public String brandUpdateForm(int brandId,Model model) {
		List<BrandCategory> categorys = brandService.getAllCategorys();
		
		
		Brand brand= brandService.getUserBrandsById(brandId);
		
		model.addAttribute("categorys",categorys);
		model.addAttribute("brand",brand);
		return "brand_update_form";
		
	}		

	@RequestMapping(path="/brandUpdate")
	public String brandUpdate(Brand brand) {
		int userId = PrincipalUtils.getCurrentUserId();
		User user = new User();
		user.setUserId(userId);
		brand.setUser(user);
		brandService.addOrEditBrand(brand);
		return "redirect:/brand/list.html";
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
			List<Brand> brands=brandService.uploadBrands(is, userId);
			model.addAttribute("message", brands.size());
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
		int totalCount;
		List<Brand> brands=new ArrayList<Brand>();
		if(PrincipalUtils.isOrderProcessor()){
			brands = brandService.getBrandsByPage(page);
			totalCount = brandService.getBrandsCounts();
			page.setTotalRecords(totalCount);
		}else{
			brands = brandService.getUserBrandsByPage(page);
			totalCount = brandService.getUserBrandsCount(userId);
			page.setTotalRecords(totalCount);
		}
		List<BrandCategory> categorys = brandService.getAllCategorys();
		model.addAttribute("brands",brands);
		model.addAttribute("page",page);
		model.addAttribute("categorys",categorys);
		return "brand_list";
	}
	
	@RequestMapping(path="/updateCheckStatus", method=RequestMethod.GET)
	public void updateCheckStatus(@RequestParam("status")int status,@RequestParam("id")int id,PrintWriter pw){
		brandService.updateCheckStatus(status, id);
		pw.write(1);
	}
	
	@RequestMapping(path="/updateRecommend", method=RequestMethod.GET)
	public void updateRecommend(@RequestParam("status")int status,@RequestParam("id")int id,PrintWriter pw){
		brandService.updateRecommend(status, id);
		pw.write(1);
	}
	
	@RequestMapping(path="/searchUserBrands")
	public String searchUserBrands(HttpSession session,Model model,BrandSearchCondition searchCondition){
		Page page =searchCondition.getPage();
		int userId = PrincipalUtils.getCurrentUserId();
		if(page.getCurrentPage()<1){
			page.setCurrentPage(1);
		}
		searchCondition.setUserId(userId);
		int totalCount = brandService.getsearchUserBrandsCount(searchCondition);
		page.setTotalRecords(totalCount);
		page.setPageSize(WebUtils.getPageSize(session));
		List<Brand> brands = brandService.searchUserBrandsByPage(searchCondition);
		List<BrandCategory> categorys = brandService.getAllCategorys();
		model.addAttribute("brands",brands);
		model.addAttribute("searchCondition",searchCondition);
		model.addAttribute("page",page);
		model.addAttribute("categorys",categorys);
		return "brand_list";
	}
	
	@RequestMapping(path="/deleteBrand")
	public void deleteBrand(int brandId,PrintWriter pw){
		brandService.deleteBrand(brandId);
		pw.write(1);
	}
	
	
	@RequestMapping(path="/getWechatOrderList")
	public String getWechatOrderList(HttpSession session,Page page,Model model){
		if(page.getCurrentPage()<1){
			page.setCurrentPage(1);
		}
		page.setPageSize(WebUtils.getPageSize(session));
		List<WeChatOrder> weChatOrders=brandService.getWeChatUserOrderRecords(page);
		int totalRecords = brandService.getWeChatOrderCount();
		page.setTotalRecords(totalRecords);
		model.addAttribute("weChatOrders",weChatOrders);
		model.addAttribute("page",page);
		return "wechat_order_list";
	}
}
