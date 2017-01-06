package com.lotut.pms.service.impl;

import com.lotut.pms.dao.BrandNoticeDao;
import com.lotut.pms.service.BrandNoticeService;

public class BrandNoticeServiceImpl implements BrandNoticeService {
	private BrandNoticeDao brandNoticeDao;

	public BrandNoticeServiceImpl(BrandNoticeDao brandNoticeDao) {
		this.brandNoticeDao = brandNoticeDao;
	}
}
