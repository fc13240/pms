package com.lotut.pms.dao.mapper;

import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.BrandNotice;
import com.lotut.pms.domain.Page;

public interface BrandNoticeMapper {

	int getUserBrandNoticeCount(int userId);

	List<BrandNotice> getUserBrandNoticeList(Page page);

	void batchChangeBrandNoticeViewStatus(List<Map<String, Long>> noticeIdList);
}
