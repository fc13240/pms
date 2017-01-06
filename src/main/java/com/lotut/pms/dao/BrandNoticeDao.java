package com.lotut.pms.dao;

import java.util.List;

import com.lotut.pms.domain.BrandNotice;
import com.lotut.pms.domain.Page;

public interface BrandNoticeDao {

	int getUserBrandNoticeCount(int userId);

	List<BrandNotice> getUserBrandNoticeList(Page page);

}
