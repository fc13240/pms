package com.lotut.pms.dao.mybatis;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.BrandNoticeDao;
import com.lotut.pms.dao.mapper.BrandNoticeMapper;

public class BrandNoticeMybatisDao extends SqlSessionDaoSupport implements BrandNoticeDao{
	private BrandNoticeMapper brandNoticeMapper;
	public void setBrandNoticeMapper(BrandNoticeMapper brandNoticeMapper) {
		this.brandNoticeMapper = brandNoticeMapper;
	}
}
