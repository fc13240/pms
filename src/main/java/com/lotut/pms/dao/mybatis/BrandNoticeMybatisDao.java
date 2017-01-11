package com.lotut.pms.dao.mybatis;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.BrandNoticeDao;
import com.lotut.pms.dao.mapper.BrandNoticeMapper;
import com.lotut.pms.domain.BrandNotice;
import com.lotut.pms.domain.BrandNoticeRemark;
import com.lotut.pms.domain.Page;

public class BrandNoticeMybatisDao extends SqlSessionDaoSupport implements BrandNoticeDao{
	private BrandNoticeMapper brandNoticeMapper;
	
	public void setBrandNoticeMapper(BrandNoticeMapper brandNoticeMapper) {
		this.brandNoticeMapper = brandNoticeMapper;
	}

	@Override
	public int getUserBrandNoticeCount(int userId) {
		return brandNoticeMapper.getUserBrandNoticeCount(userId);
	}

	@Override
	public List<BrandNotice> getUserBrandNoticeList(Page page) {
		return brandNoticeMapper.getUserBrandNoticeList(page);
	}

	@Override
	public List<BrandNotice> getUserBrandNoticeExcelData(List<Integer> noticeIds) {
		return brandNoticeMapper.getUserBrandNoticeExcelData(noticeIds);
	}

	@Override
	public void saveBrandNoticeRemark(BrandNoticeRemark brandNoticeRemark) {
		brandNoticeMapper.saveBrandNoticeRemark(brandNoticeRemark);
	}

	@Override
	public List<BrandNoticeRemark> getBrandNoticeListByNoticeId(long brandNoticeId) {
		return brandNoticeMapper.getBrandNoticeListByNoticeId(brandNoticeId);
	}
	
	@Override
	public void batchChangeBrandNoticeViewStatus(List<Map<String, Long>> noticeIdList) {
		brandNoticeMapper.batchChangeBrandNoticeViewStatus(noticeIdList);
	}

	@Override
	public void batchUpdateStarTargetStatus(List<Long> noticeIds) {
		brandNoticeMapper.batchUpdateStarTargetStatus(noticeIds);
		
	}
	
}
