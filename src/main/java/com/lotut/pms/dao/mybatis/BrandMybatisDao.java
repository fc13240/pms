package com.lotut.pms.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.BrandDao;
import com.lotut.pms.dao.mapper.BrandMapper;
import com.lotut.pms.domain.Brand;
import com.lotut.pms.domain.BrandCategory;
import com.lotut.pms.domain.BrandSearchCondition;
import com.lotut.pms.domain.Page;

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
	public int insertOrUpdateBrand(Brand brand) {
		return brandMapper.insertOrUpdateBrand(brand);
	}
}
