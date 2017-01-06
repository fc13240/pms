package com.lotut.pms.service.impl;

import java.util.List;

import com.lotut.pms.dao.BrandNoticeDao;
import com.lotut.pms.domain.BrandNotice;
import com.lotut.pms.domain.Page;
import com.lotut.pms.service.BrandNoticeService;

public class BrandNoticeServiceImpl implements BrandNoticeService {
	private BrandNoticeDao brandNoticeDao;

	public BrandNoticeServiceImpl(BrandNoticeDao brandNoticeDao) {
		this.brandNoticeDao = brandNoticeDao;
	}

	@Override
	public int getUserBrandNoticeCount(int userId) {
		return brandNoticeDao.getUserBrandNoticeCount(userId);
	}

	@Override
	public List<BrandNotice> getUserBrandNoticeList(Page page) {
		return brandNoticeDao.getUserBrandNoticeList(page);
	}
}
