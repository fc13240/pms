package com.lotut.pms.web.controller;

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
import com.lotut.pms.domain.Page;
import com.lotut.pms.service.BrandService;
import com.lotut.pms.util.PrincipalUtils;
import com.lotut.pms.web.util.WebUtils;

@Controller
@RequestMapping(path="/brand")
public class brandController {
	
	private BrandService brandService;

	@Autowired
	public brandController(BrandService brandService) {
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
		
		List<Brand> brands = brandService.getUserBrandsByPage(page);
		model.addAttribute("brands",brands);
		model.addAttribute("page",page);
		return "brand_list";
	}
}
