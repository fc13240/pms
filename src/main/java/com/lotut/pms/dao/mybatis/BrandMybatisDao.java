package com.lotut.pms.dao.mybatis;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.BrandDao;
import com.lotut.pms.dao.mapper.BrandMapper;
import com.lotut.pms.domain.Brand;
import com.lotut.pms.domain.BrandCategory;
import com.lotut.pms.domain.BrandSearchCondition;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.WeChatOrder;

public class BrandMybatisDao extends SqlSessionDaoSupport implements BrandDao{
	private BrandMapper brandMapper;
	public void setBrandMapper(BrandMapper brandMapper) {
		this.brandMapper = brandMapper;
	}
	
	@Override
	public List<Brand> getUserBrandsByPage(Page page) {
		return brandMapper.getUserBrandsByPage(page);
	}

	@Override
	public void updateCheckStatus(int status, int id) {
		brandMapper.updateCheckStatus(status, id);
	}

	@Override
	public void updateRecommend(int status, int id) {
		brandMapper.updateRecommend(status, id);
	}
	
	@Override
	public List<Brand> searchUserBrandsByPage(BrandSearchCondition brandSearchCondition) {
		return brandMapper.searchUserBrandsByPage(brandSearchCondition);
	}
	
	@Override
	public List<BrandCategory> getAllCategorys() {
		return brandMapper.getAllCategorys();
	}
	
	@Override
	public int getsearchUserBrandsCount(BrandSearchCondition brandSearchCondition) {
		return brandMapper.getsearchUserBrandsCount(brandSearchCondition);
	}
	
	@Override
	public int getUserBrandsCount(int userId) {
		return brandMapper.getUserBrandsCount(userId);
	}
	
	@Override
	public void deleteBrand(int brandId) {
		brandMapper.deleteBrand(brandId);
	}
	
	@Override
	public int insertOrUpdateBrand(Brand brand) {
		return brandMapper.insertOrUpdateBrand(brand);
	}
	
	@Override
	public List<WeChatOrder> getWeChatUserOrderRecords(Page page) {
		return brandMapper.getWeChatUserOrderRecords(page);
	}
	
	@Override
	public int getWeChatOrderCount() {
		return brandMapper.getWeChatOrderCount();
	}

	@Override
	public int addOrEditBrand(Brand brand) {
		return brandMapper.addOrEditBrand(brand);
	}

	@Override
	public Brand getUserBrandsById(int brandId) {
		return brandMapper.getUserBrandsById(brandId);
	}

	@Override
	public void insertUserBrands(List<Map<String, Integer>> userBrandRecords) {
		brandMapper.insertUserBrands(userBrandRecords);
	}

	@Override
	public List<Brand> getBrandsByPage(Page page) {
		return brandMapper.getBrandsByPage(page);
	}

	@Override
	public int getBrandsCounts() {
		return brandMapper.getBrandsCounts();
	}

	@Override
	public void insertUserBrand(int userId, int brandId) {
		 brandMapper.insertUserBrand(userId,brandId);
	}

	@Override
	public void addBrandCategory(List<BrandCategory> userBrandCategoryRecords) {
		brandMapper.addBrandCategory(userBrandCategoryRecords);
	}

	@Override
	public List<Brand> searchBrandsByPage(BrandSearchCondition brandSearchCondition) {
		return brandMapper.searchBrandsByPage(brandSearchCondition);
	}

	@Override
	public int getsearchBrandsCount(BrandSearchCondition brandSearchCondition) {
		return brandMapper.getsearchBrandsCount(brandSearchCondition);
	}
}
