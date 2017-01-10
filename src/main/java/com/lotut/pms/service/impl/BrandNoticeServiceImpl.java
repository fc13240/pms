package com.lotut.pms.service.impl;

import java.util.List;

import com.lotut.pms.constants.Settings;
import com.lotut.pms.dao.BrandNoticeDao;
import com.lotut.pms.domain.BrandNotice;
import com.lotut.pms.domain.BrandNoticeRemark;
import com.lotut.pms.domain.Page;
import com.lotut.pms.service.BrandNoticeService;
import com.lotut.pms.service.utils.BrandNoticeExcelGenerator;

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

	@Override
	public String exportNoticeExcel(List<Integer> noticeIds, String excelNoticesName) throws Exception {
		List<BrandNotice> notices = brandNoticeDao.getUserBrandNoticeExcelData(noticeIds);
		String excelNoticePath = Settings.TEMP_DIR + excelNoticesName;
		BrandNoticeExcelGenerator.writeBrandNoticeToExcel(notices, excelNoticePath);
		return excelNoticePath;
	}

	@Override
	public void saveBrandNoticeRemark(BrandNoticeRemark brandNoticeRemark) {
		brandNoticeDao.saveBrandNoticeRemark(brandNoticeRemark);
	}

	@Override
	public List<BrandNoticeRemark> getBrandNoticeListByNoticeId(long brandNoticeId) {
		return brandNoticeDao.getBrandNoticeListByNoticeId(brandNoticeId);
	}
}
