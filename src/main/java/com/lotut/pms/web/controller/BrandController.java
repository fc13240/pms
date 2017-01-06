package com.lotut.pms.web.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itextpdf.text.DocumentException;
import com.lotut.pms.constants.Settings;
import com.lotut.pms.domain.Brand;
import com.lotut.pms.domain.BrandCategory;
import com.lotut.pms.domain.BrandManagement;
import com.lotut.pms.domain.BrandLegalStatus;
import com.lotut.pms.domain.BrandManagement;
import com.lotut.pms.domain.BrandManagementSearchCondition;
import com.lotut.pms.domain.BrandRemark;
import com.lotut.pms.domain.BrandSearchCondition;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.User;
import com.lotut.pms.domain.WeChatOrder;
import com.lotut.pms.service.BrandManagementService;
import com.lotut.pms.service.BrandService;
import com.lotut.pms.service.FriendService;
import com.lotut.pms.util.PrincipalUtils;
import com.lotut.pms.web.util.FileOption;
import com.lotut.pms.web.util.WebUtils;

@Controller
@RequestMapping(path="/brand")
public class BrandController {
	
	private BrandService brandService;
	private BrandManagementService brandManagementService;
	private FriendService friendService;

	@Autowired
	public BrandController(BrandService brandService,BrandManagementService brandManagementService,FriendService friendService) {
		this.brandService = brandService;
		this.brandManagementService = brandManagementService;
		this.friendService = friendService;
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
		int brandId=brandService.addOrEditBrand(brand);
		brandService.insertUserBrand(userId, brand.getId());
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
		int totalCount=0;
		List<Brand> brands =null;
		List<BrandCategory> categorys=brandService.getAllCategorys();
		
		if(PrincipalUtils.isOrderProcessor()||PrincipalUtils.isAdmin()||PrincipalUtils.isPlatform()){
			totalCount = brandService.getsearchBrandsCount(searchCondition);
			page.setTotalRecords(totalCount);
			page.setPageSize(WebUtils.getPageSize(session));
			brands = brandService.searchBrandsByPage(searchCondition);
		}else{
			totalCount = brandService.getsearchUserBrandsCount(searchCondition);
			page.setTotalRecords(totalCount);
			page.setPageSize(WebUtils.getPageSize(session));
			brands = brandService.searchUserBrandsByPage(searchCondition);
		}
		
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
	
	 @RequestMapping(path="/uploadbrandEntrustFile")
	    public void uploadUserPhoto(MultipartFile file,HttpServletResponse response) throws IOException{
	    	String fatherPath=Settings.BRAND_IMAGE_PATH;
	    	String saveUrl=Settings.BRAND_IMAGE_URL;
	    	int userId=PrincipalUtils.getCurrentUserId();
	    	long avatarSize =file.getSize();
	    	final long uploadAvatarSize=300*1024;
	    	if(avatarSize>uploadAvatarSize){
					WebUtils.writeJsonStrToResponse(response, "overLimit");
	    	}else{
	    		
	    		FileOption.brandShowImgFileOption(userId, file, fatherPath, response,saveUrl);
	    	}

	    }
	 
	 @RequestMapping(path="getBrandManagementlist")
	 public String getBrandManagementlist(HttpSession session,Page page,Model model){
		int userId = PrincipalUtils.getCurrentUserId();
		page.setUserId(userId);
		page.setPageSize(WebUtils.getPageSize(session));
		if(page.getCurrentPage()<1){
			page.setCurrentPage(1);
		}
		int totalCount = brandManagementService.getUserBrandManagementCount(userId);
		List<BrandManagement> brands = brandManagementService.getUserBrandManagementByPage(page);
		page.setTotalRecords(totalCount);
		model.addAttribute("brands",brands);
		model.addAttribute("page",page);
		addBrandCategoryAndBrandLegalStatusToModel(model);
		return "brand_management_list";
	}
	 
	@RequestMapping(path="showFriends", method=RequestMethod.GET)
	public String showFriends(Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> friends = friendService.getUserFriends(userId);
		model.addAttribute("friends", friends);
		return "brand_select_friends";
	}
	
	@RequestMapping(path="searchFriends", method=RequestMethod.GET)
	public String searchFriends(@RequestParam("keyword")String keyword, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> friends = friendService.searchUserFriends(userId, keyword);
		model.addAttribute("friends", friends);
		return "brand_select_friends";
	}
	
	@RequestMapping(path="/addBrandManagementShares", method=RequestMethod.GET)
	public String shareBrandManagements(@RequestParam("brands")List<Integer> brandManagementIds, @RequestParam("friends")List<Integer> friendIds) {
		List<Map<String, Integer>> userBrandManagementRecords = new ArrayList<>();
		for (int brandManagementId: brandManagementIds) {
			for (int friendId: friendIds) {
				Map<String, Integer> userBrandManagementRecord =  new HashMap<String, Integer>();
				userBrandManagementRecord.put("user", friendId);
				userBrandManagementRecord.put("brand", brandManagementId);
				userBrandManagementRecords.add(userBrandManagementRecord);
			}
		}
		brandManagementService.insertUserBrandManagements(userBrandManagementRecords);
		return "brand_management_list";
	}
	
	@RequestMapping(path="/saveBrandRemark")
	public String saveBrandRemark(BrandRemark brandRemark) {
		User user = PrincipalUtils.getCurrentPrincipal();
		brandRemark.setUser(user);
		brandManagementService.saveBrandRemark(brandRemark);
		return "brand_management_list";
	}
	
	@RequestMapping(path="/getBrandRemark")
	public String getBrandRemark(int  brandId,Model model) {
		List<BrandRemark> brandRemarks = brandManagementService.getBrandRemark(brandId);
		model.addAttribute("brandRemarks",brandRemarks);
		model.addAttribute("brandId",brandId);
		return "brand_remarks";
	}
	
	@RequestMapping(path="/searchBrandManagement" ,method=RequestMethod.GET)
	 public String searchBrandManagement(@ModelAttribute("searchCondition")BrandManagementSearchCondition searchCondition,HttpSession session,Model model){
		Page page =searchCondition.getPage();
		int userId = PrincipalUtils.getCurrentUserId();
		page.setUserId(userId);
		page.setPageSize(WebUtils.getPageSize(session));
		if (page.getCurrentPage() <= 0) {
			page.setCurrentPage(1);
		}
		int totalCount=brandManagementService.searchUserBrandManagementByCount(searchCondition);
		page.setTotalRecords(totalCount);
		List<BrandManagement> brands =brandManagementService.searchUserBrandManagementByPage(searchCondition);
		model.addAttribute("brands",brands);
		model.addAttribute("page", page);
		addBrandCategoryAndBrandLegalStatusToModel(model);
		return "brand_management_list";
	}
	
	@RequestMapping(path="/brandManagementAddForm")
	public String brandManagementAddForm(Model model) {
		List<BrandCategory> categorys = brandService.getAllCategorys();
		model.addAttribute("categorys",categorys);
		return "brand_management_add_form";
		
	}
	
	@RequestMapping(path="/uploadBrandManagementImageFile")
    public void uploadBrandManagementImageFile(MultipartFile file,HttpServletResponse response) throws IOException{
    	String fatherPath=Settings.BRAND_IMAGE_PATH;
    	String saveUrl=Settings.BRAND_IMAGE_URL;
    	int userId=PrincipalUtils.getCurrentUserId();
    	long avatarSize =file.getSize();
    	final long uploadAvatarSize=300*1024;
    	if(avatarSize>uploadAvatarSize){
				WebUtils.writeJsonStrToResponse(response, "overLimit");
    	}else{
    		
    		FileOption.brandShowImgFileOption(userId, file, fatherPath, response,saveUrl);
    	}

    }
	
	 @RequestMapping(path="/uploadBrandProxyFile")
	    public void uploadBrandProxyFile(MultipartFile file,HttpServletResponse response) throws IOException, DocumentException{
	    	String fatherPath=Settings.BRAND_MANAGEMENT_PROXYFILE_PATH;
	    	String saveUrl=fatherPath.substring(Settings.BRAND_MANAGEMENT_PATH.length()-1);
	    	int userId=PrincipalUtils.getCurrentUserId();
	    	FileOption.brandManagementFileOption(userId, file, fatherPath, response,saveUrl);
	    }
	 
	 @RequestMapping(path="/uploadBrandBusinessLicenseFile")
	    public void uploadBrandBusinessLicenseFile(MultipartFile file,HttpServletResponse response) throws IOException, DocumentException{
	    	String fatherPath=Settings.BRAND_MANAGEMENT_BUSINESSLICENSE_PATH;
	    	String saveUrl=fatherPath.substring(Settings.BRAND_MANAGEMENT_PATH.length()-1);
	    	int userId=PrincipalUtils.getCurrentUserId();
	    	FileOption.brandManagementFileOption(userId, file, fatherPath, response,saveUrl);
	    }
	 
	 @RequestMapping(path="/uploadBrandEntityLicenseFile")
	    public void uploadBrandEntityLicenseFile(MultipartFile file,HttpServletResponse response) throws IOException, DocumentException{
	    	String fatherPath=Settings.BRAND_MANAGEMENT_ENTITYLICENSE_PATH;
	    	String saveUrl=fatherPath.substring(Settings.BRAND_MANAGEMENT_PATH.length()-1);
	    	int userId=PrincipalUtils.getCurrentUserId();
	    	FileOption.brandManagementFileOption(userId, file, fatherPath, response,saveUrl);
	    }
		
	 @RequestMapping(path="/uploadBrandIndividualLicenseFile")
	    public void uploadBrandIndividualLicenseFile(MultipartFile file,HttpServletResponse response) throws IOException, DocumentException{
	    	String fatherPath=Settings.BRAND_MANAGEMENT_INDIVIDUALLICENSE_PATH;
	    	String saveUrl=fatherPath.substring(Settings.BRAND_MANAGEMENT_PATH.length()-1);
	    	int userId=PrincipalUtils.getCurrentUserId();
	    	FileOption.brandManagementFileOption(userId, file, fatherPath, response,saveUrl);
	    }
	 
	 @RequestMapping(path="/uploadBrandIdentityCardFile")
	    public void uploadBrandIdentityCardFile(MultipartFile file,HttpServletResponse response) throws IOException, DocumentException{
	    	String fatherPath=Settings.BRAND_MANAGEMENT_IDENTTITYCARD_PATH;
	    	String saveUrl=fatherPath.substring(Settings.BRAND_MANAGEMENT_PATH.length()-1);
	    	int userId=PrincipalUtils.getCurrentUserId();
	    	FileOption.brandManagementFileOption(userId, file, fatherPath, response,saveUrl);
	    }
	 
	 @RequestMapping(path="/uploadBrandApplicationFile")
	    public void uploadBrandApplicationFile(MultipartFile file,HttpServletResponse response) throws IOException, DocumentException{
	    	String fatherPath=Settings.BRAND_MANAGEMENT_APPLICATION_PATH;
	    	String saveUrl=fatherPath.substring(Settings.BRAND_MANAGEMENT_PATH.length()-1);
	    	int userId=PrincipalUtils.getCurrentUserId();
	    	FileOption.brandManagementFileOption(userId, file, fatherPath, response,saveUrl);
	    }
	private void addBrandCategoryAndBrandLegalStatusToModel(Model model) {
		List<BrandCategory> categorys = brandManagementService.getAllBrandCategory();
		List<BrandLegalStatus> allBrandLegalStatus = brandManagementService.getAllBrandLegalStatus();
		model.addAttribute("categorys", categorys);
		model.addAttribute("allBrandLegalStatus", allBrandLegalStatus);
	}
	
}
