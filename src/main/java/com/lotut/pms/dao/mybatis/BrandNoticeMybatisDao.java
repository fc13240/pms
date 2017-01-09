package com.lotut.pms.dao.mybatis;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.BrandNoticeDao;
import com.lotut.pms.dao.mapper.BrandNoticeMapper;
import com.lotut.pms.domain.BrandNotice;
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
	public void batchChangeBrandNoticeViewStatus(List<Map<String, Long>> noticeIdList) {
		brandNoticeMapper.batchChangeBrandNoticeViewStatus(noticeIdList);
	}
	
}
