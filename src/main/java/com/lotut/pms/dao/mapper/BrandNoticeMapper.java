package com.lotut.pms.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.BrandNotice;
import com.lotut.pms.domain.BrandNoticeRemark;
import com.lotut.pms.domain.Page;

public interface BrandNoticeMapper {

	int getUserBrandNoticeCount(int userId);

	List<BrandNotice> getUserBrandNoticeList(Page page);
	
	List<BrandNotice> getUserBrandNoticeExcelData(@Param("noticeIds") List<Integer>noticeIds);
	
	void saveBrandNoticeRemark(BrandNoticeRemark brandNoticeRemark);
	
	List<BrandNoticeRemark> getBrandNoticeListByNoticeId(long brandNoticeId);

}
