package com.lotut.pms.web.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
import com.lotut.pms.domain.BrandCategoryCount;
import com.lotut.pms.domain.BrandLegalStatus;
import com.lotut.pms.domain.BrandLegalStatusCount;
import com.lotut.pms.domain.BrandManagement;
import com.lotut.pms.domain.BrandManagementSearchCondition;
import com.lotut.pms.domain.BrandNoticeType;
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
@RequestMapping(path = "/brand")
public class BrandController {

	private BrandService brandService;
	private BrandManagementService brandManagementService;
	private FriendService friendService;

	@Autowired
	public BrandController(BrandService brandService, BrandManagementService brandManagementService,
			FriendService friendService) {
		this.brandService = brandService;
		this.brandManagementService = brandManagementService;
		this.friendService = friendService;
	}

	@RequestMapping(path = "/showUploadForm", method = RequestMethod.GET)
	public String showUploadForm() {
		return "brand_upload_form";
	}

	@RequestMapping(path = "/brandAddForm")
	public String brandAddForm(Model model) {
		List<BrandCategory> categorys = brandService.getAllCategorys();
		model.addAttribute("categorys", categorys);
		return "brand_add_form";

	}

	@RequestMapping(path = "/brandAdd")
	public String brandAdd(Brand brand) {
		int userId = PrincipalUtils.getCurrentUserId();
		User user = new User();
		user.setUserId(userId);
		brand.setUser(user);
		brandService.addOrEditBrand(brand);
		brandService.insertUserBrand(userId, brand.getId());
		return "redirect:/brand/list.html";
	}

	@RequestMapping(path = "/brandUpdateForm")
	public String brandUpdateForm(int brandId, Model model) {
		List<BrandCategory> categorys = brandService.getAllCategorys();

		Brand brand = brandService.getUserBrandsById(brandId);

		model.addAttribute("categorys", categorys);
		model.addAttribute("brand", brand);
		return "brand_update_form";

	}

	@RequestMapping(path = "/brandUpdate")
	public String brandUpdate(Brand brand) {
		int userId = PrincipalUtils.getCurrentUserId();
		User user = new User();
		user.setUserId(userId);
		brand.setUser(user);
		brandService.addOrEditBrand(brand);
		return "redirect:/brand/list.html";
	}

	@RequestMapping(path = "/upload", method = RequestMethod.POST)
	public String uploadBrands(@RequestParam("brandFile") Part brandFile, Model model) {
		// String fileName=brandFile.getSubmittedFileName();
		try {
			if (!brandFile.getSubmittedFileName().endsWith(".xls")
					&& !brandFile.getSubmittedFileName().endsWith(".xlsx")) {
				throw new RuntimeException("上传的文件不是excel表格");
			}
			InputStream is = brandFile.getInputStream();
			int userId = PrincipalUtils.getCurrentUserId();
			List<Brand> brands = brandService.uploadBrands(is, userId);
			model.addAttribute("message", brands.size());
			return "brand_upload_success";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "上传失败，请检查文件格式稍后再试！");
			return "brand_common_message";
		}
	}

	@RequestMapping(path = "list")
	public String BrandList(HttpSession session, Page page, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		page.setUserId(userId);
		page.setPageSize(WebUtils.getPageSize(session));
		if (page.getCurrentPage() < 1) {
			page.setCurrentPage(1);
		}
		int totalCount;
		List<Brand> brands = new ArrayList<Brand>();
		if (PrincipalUtils.isOrderProcessor()) {
			brands = brandService.getBrandsByPage(page);
			totalCount = brandService.getBrandsCounts();
			page.setTotalRecords(totalCount);
		} else {
			brands = brandService.getUserBrandsByPage(page);
			totalCount = brandService.getUserBrandsCount(userId);
			page.setTotalRecords(totalCount);
		}
		List<BrandCategory> categorys = brandService.getAllCategorys();
		model.addAttribute("brands", brands);
		model.addAttribute("page", page);
		model.addAttribute("categorys", categorys);
		return "brand_list";
	}

	@RequestMapping(path = "/updateCheckStatus", method = RequestMethod.GET)
	public void updateCheckStatus(@RequestParam("status") int status, @RequestParam("id") int id, PrintWriter pw) {
		brandService.updateCheckStatus(status, id);
		pw.write(1);
	}

	@RequestMapping(path = "/updateRecommend", method = RequestMethod.GET)
	public void updateRecommend(@RequestParam("status") int status, @RequestParam("id") int id, PrintWriter pw) {
		brandService.updateRecommend(status, id);
		pw.write(1);
	}

	@RequestMapping(path = "/searchUserBrands")
	public String searchUserBrands(HttpSession session, Model model, BrandSearchCondition searchCondition) {

		Page page = searchCondition.getPage();
		int userId = PrincipalUtils.getCurrentUserId();
		if (page.getCurrentPage() < 1) {
			page.setCurrentPage(1);
		}
		searchCondition.setUserId(userId);
		int totalCount = 0;
		List<Brand> brands = null;
		List<BrandCategory> categorys = brandService.getAllCategorys();

		if (PrincipalUtils.isOrderProcessor() || PrincipalUtils.isAdmin() || PrincipalUtils.isPlatform()) {
			totalCount = brandService.getsearchBrandsCount(searchCondition);
			page.setTotalRecords(totalCount);
			page.setPageSize(WebUtils.getPageSize(session));
			brands = brandService.searchBrandsByPage(searchCondition);
		} else {
			totalCount = brandService.getsearchUserBrandsCount(searchCondition);
			page.setTotalRecords(totalCount);
			page.setPageSize(WebUtils.getPageSize(session));
			brands = brandService.searchUserBrandsByPage(searchCondition);
		}

		model.addAttribute("brands", brands);
		model.addAttribute("searchCondition", searchCondition);
		model.addAttribute("page", page);
		model.addAttribute("categorys", categorys);
		return "brand_list";
	}

	@Transactional
	@RequestMapping(path = "/deleteBrand")
	public void deleteBrand(int brandId, PrintWriter pw) {
		int userId=PrincipalUtils.getCurrentUserId();
		Brand brand=brandService.getUserBrandsById(brandId);
		brandManagementService.changeBrandTransactionStatusTo0(brand.getName());
		brandService.deleteUserBrand(userId, brandId);
		brandService.deleteBrand(brandId);
		brandService.deleteBrandById(brandId);
		pw.write(1);
	}
	
	@RequestMapping(path = "/getWechatOrderList")
	public String getWechatOrderList(HttpSession session, Page page, Model model) {
		if (page.getCurrentPage() < 1) {
			page.setCurrentPage(1);
		}
		page.setPageSize(WebUtils.getPageSize(session));
		List<WeChatOrder> weChatOrders = brandService.getWeChatUserOrderRecords(page);
		int totalRecords = brandService.getWeChatOrderCount();
		page.setTotalRecords(totalRecords);
		model.addAttribute("weChatOrders", weChatOrders);
		model.addAttribute("page", page);
		return "wechat_order_list";
	}

	@RequestMapping(path = "/uploadbrandEntrustFile")
	public void uploadUserPhoto(MultipartFile file, HttpServletResponse response) throws IOException {
		String fatherPath = Settings.BRAND_IMAGE_PATH;
		String saveUrl = Settings.BRAND_IMAGE_URL;
		int userId = PrincipalUtils.getCurrentUserId();
		long avatarSize = file.getSize();
		final long uploadAvatarSize = 300 * 1024;
		if (avatarSize > uploadAvatarSize) {
			WebUtils.writeJsonStrToResponse(response, "overLimit");
		} else {

			FileOption.brandShowImgFileOption(userId, file, fatherPath, response, saveUrl);
		}

	}

	@RequestMapping(path = "getBrandManagementlist")
	public String getBrandManagementlist(HttpSession session, Page page, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		page.setUserId(userId);
		page.setPageSize(WebUtils.getPageSize(session));
		if (page.getCurrentPage() < 1) {
			page.setCurrentPage(1);
		}
		int totalCount = brandManagementService.getUserBrandManagementCount(userId);
		List<BrandManagement> brands = brandManagementService.getUserBrandManagementByPage(page);
		List<BrandLegalStatusCount> brandLegalStatus = brandManagementService.getLegalStatusCount(userId);
		List<BrandCategoryCount> brandCategory = brandManagementService.getBrandCategoryCount(userId);
		List<BrandNoticeType> noticeTypes = brandManagementService.getAllBrandNoticeTypes();
		page.setTotalRecords(totalCount);
		model.addAttribute("brands", brands);
		model.addAttribute("page", page);
		model.addAttribute("brands", brands);
		model.addAttribute("page", page);
		model.addAttribute("noticeTypes", noticeTypes);
		addBrandCategoryAndBrandLegalStatusToModel(model);
		model.addAttribute("brandLegalStatus", brandLegalStatus);
		model.addAttribute("brandCategory", brandCategory);
		return "brand_management_list";
	}

	@RequestMapping(path = "showFriends", method = RequestMethod.GET)
	public String showFriends(Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> friends = friendService.getUserFriends(userId);
		model.addAttribute("friends", friends);
		return "brand_select_friends";
	}

	@RequestMapping(path = "searchFriends", method = RequestMethod.GET)
	public String searchFriends(@RequestParam("keyword") String keyword, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> friends = friendService.searchUserFriends(userId, keyword);
		model.addAttribute("friends", friends);
		return "brand_select_friends";
	}

	@RequestMapping(path = "/addBrandManagementShares", method = RequestMethod.GET)
	public String shareBrandManagements(@RequestParam("brands") List<Integer> brandManagementIds,
			@RequestParam("friends") List<Integer> friendIds) {
		List<Map<String, Integer>> userBrandManagementRecords = new ArrayList<>();
		for (int brandManagementId : brandManagementIds) {
			for (int friendId : friendIds) {
				Map<String, Integer> userBrandManagementRecord = new HashMap<String, Integer>();
				userBrandManagementRecord.put("user", friendId);
				userBrandManagementRecord.put("brand", brandManagementId);
				userBrandManagementRecords.add(userBrandManagementRecord);
			}
		}
		brandManagementService.insertUserBrandManagements(userBrandManagementRecords);
		return "brand_management_list";
	}

	@RequestMapping(path = "/saveBrandRemark")
	public void saveBrandRemark(@ModelAttribute("brandRemark") BrandRemark brandRemark, PrintWriter pw) {
		User user = PrincipalUtils.getCurrentPrincipal();
		brandRemark.setUser(user);
		brandManagementService.saveBrandRemark(brandRemark);
		pw.write("success");
	}

	@RequestMapping(path = "/getBrandRemark")
	public String getBrandRemark(int brandId, Model model) {
		List<BrandRemark> brandRemarks = brandManagementService.getBrandRemark(brandId);
		model.addAttribute("brandRemarks", brandRemarks);
		model.addAttribute("brandId", brandId);
		return "brand_remarks";
	}

	@RequestMapping(path = "/searchBrandManagement", method = RequestMethod.GET)
	public String searchBrandManagement(
			@ModelAttribute("searchCondition") BrandManagementSearchCondition searchCondition, HttpSession session,
			Model model) {
		Page page = searchCondition.getPage();
		int userId = PrincipalUtils.getCurrentUserId();
		page.setUserId(userId);
		page.setPageSize(WebUtils.getPageSize(session));
		if (page.getCurrentPage() <= 0) {
			page.setCurrentPage(1);
		}
		int totalCount = brandManagementService.searchUserBrandManagementByCount(searchCondition);
		page.setTotalRecords(totalCount);
		List<BrandManagement> brands = brandManagementService.searchUserBrandManagementByPage(searchCondition);
		page.setTotalRecords(totalCount);
		List<BrandLegalStatusCount> brandLegalStatus = brandManagementService.getLegalStatusCount(page.getUserId());
		List<BrandCategoryCount> brandCategory = brandManagementService.getBrandCategoryCount(page.getUserId());
		model.addAttribute("brands", brands);
		model.addAttribute("page", page);
		model.addAttribute("brandLegalStatus", brandLegalStatus);
		model.addAttribute("brandCategory", brandCategory);
		addBrandCategoryAndBrandLegalStatusToModel(model);
		return "brand_management_list";
	}

	@RequestMapping(path = "/downloadBrandExcel")
	public void downloadBrandExcel(@RequestParam List<Integer> brandIds, HttpServletResponse response)
			throws IOException {
		response.setHeader("X-FRAME-OPTIONS", "SAMEORIGIN");
		response.setContentType("application/vnd.ms-excel");
		String excelName = PrincipalUtils.getCurrentPrincipal().getUsername() + System.currentTimeMillis() + ".xls";
		String brandExcelPath = brandManagementService.exportExcelUserBrand(brandIds, excelName);
		response.setHeader("Content-Disposition", "attachment;filename=" + excelName);

		final int BUFFER_SIZE = 8192;
		byte[] buffer = new byte[BUFFER_SIZE];
		try (OutputStream out = response.getOutputStream();
				BufferedInputStream in = new BufferedInputStream(new FileInputStream(brandExcelPath))) {
			int bytesRead = -1;
			while ((bytesRead = in.read(buffer)) != -1) {
				out.write(buffer, 0, bytesRead);
			}
			out.flush();
			out.close();
			in.close();
		}
	}

	@RequestMapping(path = "/brandManagementAddForm")
	public String brandManagementAddForm(Model model) {
		List<BrandCategory> categorys = brandService.getAllCategorys();
		List<BrandLegalStatus> legalStatuss = brandManagementService.getAllBrandLegalStatus();
		model.addAttribute("categorys", categorys);
		model.addAttribute("legalStatuss", legalStatuss);
		return "brand_management_add_form";

	}

	@RequestMapping(path = "/brandManageAdd", method = RequestMethod.POST)
	public String brandManagementAdd(BrandManagement brandManagement) {
		int userId = PrincipalUtils.getCurrentUserId();
		User user = new User();
		user.setUserId(userId);
		brandManagement.setUser(user);
		brandManagementService.insertOrUpdateBrand(brandManagement);
		brandManagementService.insertUserBrand(userId, brandManagement.getId());
		return "redirect:/brand/getBrandManagementlist.html";
	}

	@RequestMapping(path = "/brandManagementUpdateForm")
	public String brandManagementUpdateForm(int brandId, Model model) {
		List<BrandCategory> categorys = brandService.getAllCategorys();
		List<BrandLegalStatus> legalStatuss = brandManagementService.getAllBrandLegalStatus();
		BrandManagement brand = brandManagementService.showBrandManagementDetail(brandId);
		model.addAttribute("legalStatuss", legalStatuss);
		model.addAttribute("categorys", categorys);
		model.addAttribute("brand", brand);
		return "brand_management_update_form";
	}

	@RequestMapping(path = "/brandManagementUpdate")
	public String brandManagementUpdate(BrandManagement brandManagement) {
		int userId = PrincipalUtils.getCurrentUserId();
		User user = new User();
		user.setUserId(userId);
		brandManagement.setUser(user);
		brandManagementService.insertOrUpdateBrand(brandManagement);
		return "redirect:/brand/getBrandManagementlist.html";
	}

	@RequestMapping(path = "/uploadBrandManagementImageFile")
	public void uploadBrandManagementImageFile(MultipartFile file, HttpServletResponse response) throws IOException {
		String fatherPath = Settings.BRAND_MANAGEMENT_IMAGE_PATH;
		String saveUrl = fatherPath.substring(Settings.BRAND_MANAGEMENT_IMAGE_PATH.length() - 1);
		int userId = PrincipalUtils.getCurrentUserId();
		long avatarSize = file.getSize();
		final long uploadAvatarSize = 300 * 1024;
		if (avatarSize > uploadAvatarSize) {
			WebUtils.writeJsonStrToResponse(response, "overLimit");
		} else {

			FileOption.brandShowImgFileOption(userId, file, fatherPath, response, saveUrl);
		}

	}

	@RequestMapping(path = "/uploadBrandProxyFile")
	public void uploadBrandProxyFile(MultipartFile file, HttpServletResponse response)
			throws IOException, DocumentException {
		String fatherPath = Settings.BRAND_MANAGEMENT_PROXYFILE_PATH;
		String saveUrl = fatherPath.substring(Settings.BRAND_MANAGEMENT_PATH.length() - 1);
		int userId = PrincipalUtils.getCurrentUserId();
		FileOption.brandManagementFileOption(userId, file, fatherPath, response, saveUrl);
	}

	@RequestMapping(path = "/uploadBrandBusinessLicenseFile")
	public void uploadBrandBusinessLicenseFile(MultipartFile file, HttpServletResponse response)
			throws IOException, DocumentException {
		String fatherPath = Settings.BRAND_MANAGEMENT_BUSINESSLICENSE_PATH;
		String saveUrl = fatherPath.substring(Settings.BRAND_MANAGEMENT_PATH.length() - 1);
		int userId = PrincipalUtils.getCurrentUserId();
		FileOption.brandManagementFileOption(userId, file, fatherPath, response, saveUrl);
	}

	@RequestMapping(path = "/uploadBrandEntityLicenseFile")
	public void uploadBrandEntityLicenseFile(MultipartFile file, HttpServletResponse response)
			throws IOException, DocumentException {
		String fatherPath = Settings.BRAND_MANAGEMENT_ENTITYLICENSE_PATH;
		String saveUrl = fatherPath.substring(Settings.BRAND_MANAGEMENT_PATH.length() - 1);
		int userId = PrincipalUtils.getCurrentUserId();
		FileOption.brandManagementFileOption(userId, file, fatherPath, response, saveUrl);
	}

	@RequestMapping(path = "/uploadBrandIndividualLicenseFile")
	public void uploadBrandIndividualLicenseFile(MultipartFile file, HttpServletResponse response)
			throws IOException, DocumentException {
		String fatherPath = Settings.BRAND_MANAGEMENT_INDIVIDUALLICENSE_PATH;
		String saveUrl = fatherPath.substring(Settings.BRAND_MANAGEMENT_PATH.length() - 1);
		int userId = PrincipalUtils.getCurrentUserId();
		FileOption.brandManagementFileOption(userId, file, fatherPath, response, saveUrl);
	}

	@RequestMapping(path = "/uploadBrandIdentityCardFile")
	public void uploadBrandIdentityCardFile(MultipartFile file, HttpServletResponse response)
			throws IOException, DocumentException {
		String fatherPath = Settings.BRAND_MANAGEMENT_IDENTTITYCARD_PATH;
		String saveUrl = fatherPath.substring(Settings.BRAND_MANAGEMENT_PATH.length() - 1);
		int userId = PrincipalUtils.getCurrentUserId();
		FileOption.brandManagementFileOption(userId, file, fatherPath, response, saveUrl);
	}

	@RequestMapping(path = "/uploadBrandApplicationFile")
	public void uploadBrandApplicationFile(MultipartFile file, HttpServletResponse response)
			throws IOException, DocumentException {
		String fatherPath = Settings.BRAND_MANAGEMENT_APPLICATION_PATH;
		String saveUrl = fatherPath.substring(Settings.BRAND_MANAGEMENT_PATH.length() - 1);
		int userId = PrincipalUtils.getCurrentUserId();
		FileOption.brandManagementFileOption(userId, file, fatherPath, response, saveUrl);
	}

	private void addBrandCategoryAndBrandLegalStatusToModel(Model model) {

		List<BrandCategory> categorys = brandManagementService.getAllBrandCategory();
		List<BrandLegalStatus> allBrandLegalStatus = brandManagementService.getAllBrandLegalStatus();
		model.addAttribute("categorys", categorys);
		model.addAttribute("allBrandLegalStatus", allBrandLegalStatus);
	}

	@RequestMapping(path = "/deleteBrandManagement", method = RequestMethod.GET)
	public void deleteBrandManagement(@RequestParam("brands") List<Integer> brandManagementIds, PrintWriter writer) {
		int userId = PrincipalUtils.getCurrentUserId();
		brandManagementService.brandsTrash(brandManagementIds, userId);
		writer.write(1);
	}

	@RequestMapping(path = "/deleteShareUser", method = RequestMethod.GET)
	public void deleteShareUser(int brandId, int shareUserId, Model model, HttpServletResponse response)
			throws IOException {
		brandManagementService.deleteShareUser(brandId, shareUserId);
		WebUtils.writeJsonStrToResponse(response, "success");
	}

	@RequestMapping(path = "/brandRecycled", method = RequestMethod.GET)
	public String patentRecycled(Model model, Page page, HttpSession session) {
		int userId = PrincipalUtils.getCurrentUserId();
		page.setUserId(userId);
		page.setPageSize(WebUtils.getPageSize(session));
		if (page.getCurrentPage() <= 0) {
			page.setCurrentPage(1);
		}
		int totalCount = brandManagementService.getBrandsRecycledCount(userId);
		page.setTotalRecords(totalCount);
		List<Brand> brands = brandManagementService.getBrandsRecycled(page);
		model.addAttribute("brands", brands);
		model.addAttribute("page", page);
		return "brand_recycled";
	}

	@RequestMapping(path = "/searchBrandRecycled", method = RequestMethod.GET)
	public String searchBrandRecycled(@ModelAttribute("searchCondition") BrandManagementSearchCondition searchCondition,
			Model model, HttpSession session) {
		Page page = searchCondition.getPage();
		page.setPageSize(WebUtils.getPageSize(session));
		searchCondition.setUserId(PrincipalUtils.getCurrentUserId());
		if (page.getCurrentPage() <= 0) {
			page.setCurrentPage(1);
		}
		int totalCount = brandManagementService.SearchBrandsRecycledCount(searchCondition);
		page.setTotalRecords(totalCount);
		List<Brand> brands = brandManagementService.SearchBrandsRecycled(searchCondition);
		model.addAttribute("brands", brands);
		model.addAttribute("page", page);
		return "brand_recycled";
	}

	@RequestMapping(path = "/recoverBrands", method = RequestMethod.GET)
	public void recoverBrand(@RequestParam("brands") List<Integer> brandManagementIds, PrintWriter writer) {
		int userId = PrincipalUtils.getCurrentUserId();
		brandManagementService.recoverBrands(brandManagementIds, userId);
		writer.write(1);

	}

	@RequestMapping(path = "/deleteForeverBrands", method = RequestMethod.GET)
	public void deleteForeverBrands(@RequestParam("brands") List<Integer> brandManagementIds, PrintWriter writer) {
		int userId = PrincipalUtils.getCurrentUserId();
		brandManagementService.deleteForeverBrands(brandManagementIds, userId);
		writer.write(1);
	}

	@RequestMapping(path = "/downloadImgFile", method = RequestMethod.GET)
	public void downloadImgFile(String imgUrl, HttpServletResponse response, HttpServletRequest request)
			throws IOException {
		response.setContentType("application/octet-stream ");
		String targetUrl = imgUrl.substring(1, imgUrl.lastIndexOf("."));
		String downloadFileName = URLEncoder
				.encode(imgUrl.substring(imgUrl.lastIndexOf("/") + 1, imgUrl.lastIndexOf(".")), "UTF8");
		String filePath = Settings.BRAND_MANAGEMENT_IMAGE_PATH + targetUrl;
		File targetFile = new File(filePath);
		if ("FF".equals(WebUtils.getBrowser(request))) {
			// 针对火狐浏览器处理
			downloadFileName = new String(imgUrl.substring(imgUrl.lastIndexOf("/") + 1).getBytes("UTF-8"),
					"iso-8859-1");
		}
		response.setHeader("Content-Disposition", "attachment;filename=" + downloadFileName);
		response.setContentLength((int) targetFile.length());
		WebUtils.writeStreamToResponse(response, new FileInputStream(targetFile));
	}

	@RequestMapping(path = "/downloadProxyFile", method = RequestMethod.GET)
	public void downloadproxyFile(String proxyFile, HttpServletResponse response, HttpServletRequest request)
			throws IOException {
		response.setContentType("application/octet-stream ");
		String targetUrl = proxyFile.substring(1, proxyFile.lastIndexOf("."));
		String downloadFileName = URLEncoder
				.encode(proxyFile.substring(proxyFile.lastIndexOf("/") + 1, proxyFile.lastIndexOf(".")), "UTF8");
		String filePath = Settings.BRAND_MANAGEMENT_PROXYFILE_PATH + targetUrl;
		File targetFile = new File(filePath);
		if ("FF".equals(WebUtils.getBrowser(request))) {
			// 针对火狐浏览器处理
			downloadFileName = new String(proxyFile.substring(proxyFile.lastIndexOf("/") + 1).getBytes("UTF-8"),
					"iso-8859-1");
		}
		response.setHeader("Content-Disposition", "attachment;filename=" + downloadFileName);
		response.setContentLength((int) targetFile.length());
		WebUtils.writeStreamToResponse(response, new FileInputStream(targetFile));
	}

	@RequestMapping(path = "/getUsermonitorBrands")
	public String getUsermonitorBrands(HttpSession session, Page page, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		if (page.getCurrentPage() <= 0) {
			page.setCurrentPage(1);
		}
		page.setPageSize(WebUtils.getPageSize(session));
		page.setUserId(userId);
		int totalCount = brandManagementService.getUserMonitorBrandCount(userId);
		page.setTotalRecords(totalCount);
		List<BrandManagement> brands = brandManagementService.getUserMonitorBrand(page);
		model.addAttribute("page", page);
		model.addAttribute("brands", brands);
		return "brand_management_monitor_list";
	}

	@RequestMapping(path = "/changeBrandMonitorStatus")
	public void changeBrandMonitorStatus(@RequestParam List<Long> brandIds, PrintWriter pw) {
		int userId = PrincipalUtils.getCurrentUserId();
		brandManagementService.changeBrandMonitorStatus(userId, brandIds);
		pw.write("success");
	}

	@RequestMapping(path = "/cancelBrandMonitor")
	public void getUsermonitorBrands(@RequestParam List<Long> brandIds, PrintWriter pw) {
		int userId = PrincipalUtils.getCurrentUserId();
		brandManagementService.cancelBrandMonitorStatus(userId, brandIds);
		pw.write("success");
	}

	@RequestMapping(path = "/searchMonitorBrand")
	public String searchMonitorBrand(@ModelAttribute("searchCondition") BrandManagementSearchCondition searchCondition,
			HttpSession session, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		searchCondition.setUserId(userId);
		Page page = searchCondition.getPage();
		if (page.getCurrentPage() <= 0) {
			page.setCurrentPage(1);
		}
		page.setPageSize(WebUtils.getPageSize(session));
		int totoalCOunt = brandManagementService.searchUserMonitorBrandCount(searchCondition);
		page.setTotalRecords(totoalCOunt);
		searchCondition.setPage(page);
		List<BrandManagement> brands = brandManagementService.searchUserMonitorBrand(searchCondition);
		model.addAttribute("brands", brands);
		model.addAttribute("page", page);
		return "brand_management_monitor_list";
	}

	@RequestMapping(path = "/downloadImage")
	public void downloadImage(String name, String downloadPath, HttpServletResponse response) throws Exception {
		downloadPath = downloadPath.substring(1, downloadPath.lastIndexOf("."));
		String suffix = downloadPath.substring(downloadPath.lastIndexOf(".") + 1).toLowerCase();
		String filePath = Settings.BRAND_MANAGEMENT_IMAGE_PATH + downloadPath;
		String filename = name + "." + suffix;
		response.setContentType("image/" + suffix);
		response.setHeader("Content-Disposition",
				"attachment;filename=" + new String(filename.getBytes("utf-8"), "iso-8859-1"));
		final int BUFFER_SIZE = 8192;
		byte[] buffer = new byte[BUFFER_SIZE];
		int byteRead = -1;
		try (OutputStream out = response.getOutputStream();
				BufferedInputStream in = new BufferedInputStream(new FileInputStream(filePath))) {
			while ((byteRead = in.read(buffer)) != -1) {
				out.write(buffer, 0, byteRead);
			}
			out.flush();
			out.close();
			in.close();
		}

	}

	@RequestMapping(path = "/publishGoods")
	@Transactional
	public String publishGoods(@RequestParam("brandId") int brandId) {
		BrandManagement brandManagement = brandManagementService.showBrandManagementDetail(brandId);

		Brand brand = new Brand();
		User user = new User();
		int userId = PrincipalUtils.getCurrentUserId();
		user.setUserId(userId);
		brand.setUser(user);
		brand.setBrandCategory(brandManagement.getBrandCategory());
		brand.setName(brandManagement.getName());
		brand.setBrandNo(brandManagement.getBrandNo());
		brand.setSimilarNo(brandManagement.getSimilarNo());
		brand.setPrice(brandManagement.getPrice());
		brand.setTransactionMode(brandManagement.getTransactionMode());
		brand.setAppPerson(brandManagement.getAppPerson());
		brand.setScope(brandManagement.getScope());
		brand.setAppDate(brandManagement.getAppDate());
		brand.setOriginality(brandManagement.getOriginality());
		brand.setPublishDate(brandManagement.getPublishDate());
		brand.setImageUrl(brandManagement.getImageUrl());
		brandService.addOrEditBrand(brand);//将商标管理值取出来存到商标交易表中
		brandService.insertUserBrand(userId, brand.getId());//关联商标用户
		brandManagementService.changeBrandTransactionStatus(brandId);//设置商标管理表数据未待交易
		return "redirect:/brand/getBrandManagementlist.html";
	}


	
	@RequestMapping(path = "/batchTransation")
	@Transactional
	public void batchTransation(@RequestParam("brands") List<Integer> brands, PrintWriter pw) {
		for (int i = 0; i < brands.size(); i++) {
			int brandId = brands.get(i);
			BrandManagement brandManagement = brandManagementService.showBrandManagementDetail(brandId);
			Brand brand = new Brand();
			User user = new User();
			int userId = PrincipalUtils.getCurrentUserId();
			user.setUserId(userId);
			brand.setUser(user);
			brand.setBrandCategory(brandManagement.getBrandCategory());
			brand.setName(brandManagement.getName());
			brand.setBrandNo(brandManagement.getBrandNo());
			brand.setSimilarNo(brandManagement.getSimilarNo());
			brand.setPrice(brandManagement.getPrice());
			brand.setTransactionMode(brandManagement.getTransactionMode());
			brand.setAppPerson(brandManagement.getAppPerson());
			brand.setScope(brandManagement.getScope());
			brand.setAppDate(brandManagement.getAppDate());
			brand.setOriginality(brandManagement.getOriginality());
			brand.setPublishDate(brandManagement.getPublishDate());
			brand.setImageUrl(brandManagement.getImageUrl());
			brandService.addOrEditBrand(brand);
			brandService.insertUserBrand(userId, brand.getId());
			brandManagementService.changeBrandTransactionStatus(brandId);
		}
		pw.write("success");
	}
	
	@RequestMapping(path="/changeBrandTransactionStatus")
	public void changeBrandTransactionStatus(@ModelAttribute Brand brand,PrintWriter pw){ 
		brandService.changeBrandTransactionStatus(brand);
		Brand modifyBrand =  brandService.getBrandsByBrandId(brand.getId());
		if(brand.getTransactionStatus()==1){
			brandService.changeSellStatus(1, brand.getId());
		}else if(brand.getTransactionStatus()>1){
			brandService.changeSellStatus(2, brand.getId());
		}
		BrandManagement bm = new BrandManagement();
		bm.setBrandNo(modifyBrand.getBrandNo());
		bm.setName(modifyBrand.getName());
		bm.setTransactionStatus(brand.getTransactionStatus());
		brandManagementService.changeBrandTransactionStatusByBrandNo(bm);
		pw.write("success");
	}
}
