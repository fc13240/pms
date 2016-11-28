package com.lotut.pms.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.springframework.transaction.annotation.Transactional;

import com.lotut.pms.dao.BrandDao;
import com.lotut.pms.domain.Brand;
import com.lotut.pms.domain.BrandCategory;
import com.lotut.pms.domain.BrandSearchCondition;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.WeChatOrder;
import com.lotut.pms.service.BrandService;
import com.lotut.pms.service.utils.BrandExcelParser;

public class BrandServiceImpl implements BrandService{
	private BrandDao brandDao;

	public BrandServiceImpl(BrandDao brandDao) {
		this.brandDao = brandDao;
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
		List<Brand> brands=new ArrayList<>();
		try {
			brands=BrandExcelParser.parseBrandFile(is, userId);
		} catch (EncryptedDocumentException | InvalidFormatException e) {
			e.printStackTrace();
		}
		addOrUpdateBrands(brands, userId);
		return brands;
	}
	
	@Override
	@Transactional
	public boolean  addOrUpdateBrands(List<Brand> brands,int userId) {
		for (Brand brand: brands) {
			 brandDao.insertOrUpdateBrand(brand);
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
	public void addOrEditBrand(Brand brand) {
		brandDao.addOrEditBrand(brand);
	}

	@Override
	public Brand getUserBrandsById(int brandId) {
		return brandDao.getUserBrandsById(brandId);
	}
}
