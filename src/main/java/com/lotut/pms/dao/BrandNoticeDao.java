package com.lotut.pms.dao;

import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.BrandNotice;
import com.lotut.pms.domain.BrandNoticeRemark;
import com.lotut.pms.domain.Page;

public interface BrandNoticeDao {

	int getUserBrandNoticeCount(int userId);

	List<BrandNotice> getUserBrandNoticeList(Page page);
	
	List<BrandNotice> getUserBrandNoticeExcelData(List<Integer>noticeIds);
	
	void saveBrandNoticeRemark(BrandNoticeRemark brandNoticeRemark);
	
	List<BrandNoticeRemark> getBrandNoticeListByNoticeId(long brandNoticeId);

	void batchChangeBrandNoticeViewStatus(List<Map<String, Long>> noticeIdList);
}
