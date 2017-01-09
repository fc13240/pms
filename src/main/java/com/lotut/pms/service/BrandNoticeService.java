package com.lotut.pms.service;

import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.BrandNotice;
import com.lotut.pms.domain.Page;

public interface BrandNoticeService {

	int getUserBrandNoticeCount(int userId);

	List<BrandNotice> getUserBrandNoticeList(Page page);
	
	int batchChangeBrandNoticeViewStatus(List<Long> noticeIdList,int userId);
}
