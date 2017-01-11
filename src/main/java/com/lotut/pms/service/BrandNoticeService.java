package com.lotut.pms.service;

import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.BrandNotice;
import com.lotut.pms.domain.BrandNoticeRemark;
import com.lotut.pms.domain.BrandNoticeSearchCondition;
import com.lotut.pms.domain.BrandNoticeType;
import com.lotut.pms.domain.Notice;
import com.lotut.pms.domain.NoticeSearchCondition;
import com.lotut.pms.domain.Page;

public interface BrandNoticeService {

	int getUserBrandNoticeCount(int userId);

	List<BrandNotice> getUserBrandNoticeList(Page page);
	
	String exportNoticeExcel (List<Integer> noticeIds, String excelNoticesName) throws Exception;
	
	void saveBrandNoticeRemark(BrandNoticeRemark brandNoticeRemark);
	
	List<BrandNoticeRemark> getBrandNoticeListByNoticeId(long brandNoticeId);

	int batchChangeBrandNoticeViewStatus(List<Long> noticeIdList,int userId);

	void batchUpdateStarTargetStatus(List<Long> noticeIds);
	
	List<BrandNotice> searchUserBrandNoticeByPage(BrandNoticeSearchCondition searchCondition);
	
	int searchBrandNoticeCountByPage(BrandNoticeSearchCondition searchCondition);
	
	List<BrandNoticeType> getBrandNoticeTypes();

	Map<String, Map<String, String>> getUserStarTargetNoticeCountByRemainDay(int userId);

	List<Notice> getUserStarTargetNoticesByPage(Page page);

	int getUserStarTargetNoticesCount(int userId);

	

}
