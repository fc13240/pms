package com.lotut.pms.dao.mybatis;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.BrandManagementDao;
import com.lotut.pms.dao.mapper.BrandManagementMapper;
import com.lotut.pms.domain.Brand;
import com.lotut.pms.domain.BrandCategory;
import com.lotut.pms.domain.BrandCategoryCount;
import com.lotut.pms.domain.BrandLegalStatus;
import com.lotut.pms.domain.BrandLegalStatusCount;
import com.lotut.pms.domain.BrandManagement;
import com.lotut.pms.domain.BrandManagementSearchCondition;
import com.lotut.pms.domain.BrandNoticeType;
import com.lotut.pms.domain.BrandRemark;
import com.lotut.pms.domain.Page;

public class BrandManagementMybatisDao extends SqlSessionDaoSupport implements BrandManagementDao{
	private BrandManagementMapper brandManagementMapper;
	
	public void setBrandManagementMapper(BrandManagementMapper brandManagementMapper) {
		this.brandManagementMapper = brandManagementMapper;
	}

	@Override
	public int getUserBrandManagementCount(int userId) {
		return brandManagementMapper.getUserBrandManagementCount(userId);
	}

	@Override
	public List<BrandManagement> getUserBrandManagementByPage(Page page) {
		return brandManagementMapper.getUserBrandManagementByPage(page);
	}

	@Override
	public List<BrandCategory> getAllBrandCategory() {
		return brandManagementMapper.getAllBrandCategory();
	}

	@Override
	public List<BrandLegalStatus> getAllBrandLegalStatus() {
		return brandManagementMapper.getAllBrandLegalStatus();
	}
	
	@Override
	public void insertUserBrandManagements(List<Map<String, Integer>> userBrandManagementRecords) {
		brandManagementMapper.insertUserBrandManagements(userBrandManagementRecords);
	}

	@Override
	public void saveBrandRemark(BrandRemark brandRemark) {
		brandManagementMapper.saveBrandRemark(brandRemark);
	}

	@Override
	public List<BrandRemark> getBrandRemark(int brandId) {
		return brandManagementMapper.getBrandRemark(brandId);
	}
	@Override
	public List<BrandManagement> searchUserBrandManagementByPage(BrandManagementSearchCondition searchCondition) {
		return brandManagementMapper.searchUserBrandManagementByPage(searchCondition);
	}

	@Override
	public int searchUserBrandManagementByCount(BrandManagementSearchCondition searchCondition) {
		return brandManagementMapper.searchUserBrandManagementByCount(searchCondition);
	}

	@Override
	public 	List<BrandManagement> getUserExcelDate(List<Integer> brandIds) {
		return brandManagementMapper.getUserExcelDate(brandIds);
	}
	
	@Override
	public List<BrandLegalStatusCount> getLegalStatusCount(int userId) {
		return brandManagementMapper.getLegalStatusCount(userId);
	}

	@Override
	public List<BrandCategoryCount> getBrandCategoryCount(int userId) {
		return brandManagementMapper.getBrandCategoryCount(userId);
	}

	@Override
	public void brandsTrash(List<Integer> brandManagementIds, int userId) {
		brandManagementMapper.brandsTrash( brandManagementIds,userId);
	}
	public int insertOrUpdateBrand(BrandManagement brandManagement) {
		return brandManagementMapper.insertOrUpdateBrand(brandManagement);
	}

	@Override
	public void insertUserBrand(int userId, int brandId) {
		brandManagementMapper.insertUserBrand(userId, brandId);
	}

	@Override
	public BrandManagement showBrandManagementDetail(int brandId) {
		return brandManagementMapper.showBrandManagementDetail(brandId);
	}
	
	public List<BrandNoticeType> getAllBrandNoticeTypes() {
		return brandManagementMapper.getAllBrandNoticeTypes();
	}

	@Override
	public void deleteShareUser(int brandId, int shareUserId) {
		brandManagementMapper.deleteShareUser(brandId, shareUserId);
	}

	@Override
	public int getBrandsRecycledCount(int userId) {
		return brandManagementMapper.getBrandsRecycledCount(userId);
	}

	@Override
	public List<Brand> getBrandsRecycled(Page page) {
		return brandManagementMapper.getBrandsRecycled(page);
	}

	@Override
	public int SearchBrandsRecycledCount(BrandManagementSearchCondition searchCondition) {
		return brandManagementMapper.SearchBrandsRecycledCount(searchCondition);
	}

	@Override
	public List<Brand> SearchBrandsRecycled(BrandManagementSearchCondition searchCondition) {
		return brandManagementMapper.SearchBrandsRecycled(searchCondition);
	}
	
	@Override
	public void recoverBrands(List<Integer> brandManagementIds, int userId) {
		brandManagementMapper.recoverBrands(brandManagementIds,userId);
		
	}

	@Override
	public void deleteForeverBrands(List<Integer> brandManagementIds, int userId) {
		brandManagementMapper.deleteForeverBrands(brandManagementIds,userId);
		
	}

	@Override
	public List<BrandManagement> getUserMonitorBrand(Page page) {
		return brandManagementMapper.getUserMonitorBrand(page);
	}

	@Override
	public int getUserMonitorBrandCount(int userId) {
		return brandManagementMapper.getUserMonitorBrandCount(userId);
	}

	

	
	
}
