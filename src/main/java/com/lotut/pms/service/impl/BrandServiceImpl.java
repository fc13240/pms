package com.lotut.pms.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.springframework.transaction.annotation.Transactional;

import com.lotut.pms.dao.BrandDao;
import com.lotut.pms.dao.BrandManagementDao;
import com.lotut.pms.domain.Brand;
import com.lotut.pms.domain.BrandAndBrandCategory;
import com.lotut.pms.domain.BrandCategory;
import com.lotut.pms.domain.BrandLegalStatus;
import com.lotut.pms.domain.BrandManagement;
import com.lotut.pms.domain.BrandSearchCondition;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.WeChatOrder;
import com.lotut.pms.service.BrandService;
import com.lotut.pms.service.utils.BrandExcelParser;

public class BrandServiceImpl implements BrandService{
	private BrandDao brandDao;
	private BrandManagementDao brandManagementDao;

	public BrandServiceImpl(BrandDao brandDao,BrandManagementDao brandManagementDao) {
		this.brandDao = brandDao;
		this.brandManagementDao=brandManagementDao;
	}

	@Override
	public List<Brand> getUserBrandsByPage(Page page) {
		return brandDao.getUserBrandsByPage(page);
	}

	@Override
	public void updateCheckStatus(int status, int id) {
		brandDao.updateCheckStatus(status, id);
	}

	@Override
	public void updateRecommend(int status, int id) {
		brandDao.updateRecommend(status, id);
	}
	
	@Override
	public List<Brand> searchUserBrandsByPage(BrandSearchCondition brandSearchCondition) {
		return brandDao.searchUserBrandsByPage(brandSearchCondition);
	}
	
	@Override
	public List<BrandCategory> getAllCategorys() {
		return brandDao.getAllCategorys();
	}
	
	@Override
	public int getsearchUserBrandsCount(BrandSearchCondition brandSearchCondition) {
		return brandDao.getsearchUserBrandsCount(brandSearchCondition);
	} 
	
	@Override
	public int getUserBrandsCount(int userId) {
		return brandDao.getUserBrandsCount(userId);
	} 
	
	@Override
	public void deleteBrand(int brandId) {
		brandDao.deleteBrand(brandId);
	} 

	@Override
	public List<Brand> uploadBrands(InputStream is, int userId) throws IOException {
		BrandAndBrandCategory bac=new BrandAndBrandCategory();
		List<Brand> brands=new ArrayList<>();
		List<BrandCategory> brandCategorys=new ArrayList<>();
		try {
			bac=BrandExcelParser.parseBrandFile(is, userId);
			brands=bac.getBrandRecords();
			brandCategorys=bac.getBrandCategoryRecords();
		} catch (EncryptedDocumentException | InvalidFormatException e) {
			e.printStackTrace();
		}
		addOrUpdateBrands(brands,brandCategorys, userId);
		return brands;
	}
	
	@Override
	@Transactional
	public boolean  addOrUpdateBrands(List<Brand> brands,List<BrandCategory> brandCategorys,int userId) {
		brandDao.addBrandCategory(brandCategorys);
		for (int i = 0; i < brands.size(); i++) {
			 Brand brand=brands.get(i);
			 brandDao.insertOrUpdateBrand(brands.get(i));
			 BrandManagement brandManagement=new BrandManagement();
			 BrandLegalStatus legalStatus=new BrandLegalStatus();
			 legalStatus.setLegalStatusId(1);
			 brandManagement.setId(brand.getId());
			 brandManagement.setUser(brand.getUser());
			 brandManagement.setBrandCategory(brand.getBrandCategory());
			 brandManagement.setName(brand.getName());
			 brandManagement.setBrandNo(brand.getBrandNo());
			 brandManagement.setSimilarNo(brand.getSimilarNo());
			 brandManagement.setPrice(brand.getPrice());
			 brandManagement.setTransactionMode(brand.getTransactionMode());
			 brandManagement.setAppPerson(brand.getAppPerson());
			 brandManagement.setScope(brand.getScope());
			 brandManagement.setAppDate(brand.getAppDate());
			 brandManagement.setOriginality(brand.getOriginality());
			 brandManagement.setPublishDate(brand.getPublishDate());
			 brandManagement.setImageUrl(brand.getImageUrl());
			 brandManagement.setBrandLegalStatus(legalStatus);
			 brandManagement.setTransactionStatus(1);
			 brandManagementDao.insertOrUpdateBrand(brandManagement);
			 brandManagementDao.insertUserBrand(userId, brandManagement.getId());
		}
		List<Map<String, Integer>> userBrandList = new ArrayList<>();
		for (Brand brand: brands) {
			boolean isNewbrand = brand.getId() != 0;
			if (isNewbrand) {
				HashMap<String, Integer> userBrandMap = new HashMap<>();
				userBrandMap.put("user", userId);
				userBrandMap.put("brand", (int)brand.getId());
				userBrandList.add(userBrandMap);
			}
		}
		if (userBrandList.size() > 0) {
			brandDao.insertUserBrands(userBrandList);
		}
		return true;
	}

	@Override
	public List<WeChatOrder> getWeChatUserOrderRecords(Page page) {
		return brandDao.getWeChatUserOrderRecords(page);
	}
	
	@Override
	public int getWeChatOrderCount() {
		return brandDao.getWeChatOrderCount();
	}

	@Override
	public int addOrEditBrand(Brand brand) {
		return brandDao.addOrEditBrand(brand);
	}

	@Override
	public Brand getUserBrandsById(int brandId) {
		return brandDao.getUserBrandsById(brandId);
	}

	@Override
	public List<Brand> getBrandsByPage(Page page) {
		return brandDao.getBrandsByPage(page);
	}

	@Override
	public int getBrandsCounts() {
		return brandDao.getBrandsCounts();
	}

	@Override
	public void insertUserBrand(int userId, int brandId) {
		brandDao.insertUserBrand(userId,brandId);
	}

	@Override
	public List<Brand> searchBrandsByPage(BrandSearchCondition brandSearchCondition) {
		return brandDao.searchBrandsByPage(brandSearchCondition);
	}

	@Override
	public int getsearchBrandsCount(BrandSearchCondition brandSearchCondition) {
		return brandDao.getsearchBrandsCount(brandSearchCondition);
	}

	@Override
	public void deleteUserBrand(int userId, int brandId) {
		brandDao.deleteUserBrand(userId, brandId);
	}

	@Override
	public void deleteBrandById(int brandId) {
		brandDao.deleteBrandById(brandId);
	}
}
