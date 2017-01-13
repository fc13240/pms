package com.lotut.pms.dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.BrandNotice;
import com.lotut.pms.domain.BrandNoticeRemark;
import com.lotut.pms.domain.BrandNoticeSearchCondition;
import com.lotut.pms.domain.BrandNoticeType;
import com.lotut.pms.domain.BrandNoticeTypeCount;
import com.lotut.pms.domain.NoticeSearchCondition;
import com.lotut.pms.domain.Page;

public interface BrandNoticeMapper {

	int getUserBrandNoticeCount(int userId);

	List<BrandNotice> getUserBrandNoticeList(Page page);
	
	List<BrandNotice> getUserBrandNoticeExcelData(@Param("noticeIds") List<Integer>noticeIds);
	
	void saveBrandNoticeRemark(BrandNoticeRemark brandNoticeRemark);
	
	List<BrandNoticeRemark> getBrandNoticeListByNoticeId(long brandNoticeId);

	void batchChangeBrandNoticeViewStatus(List<Map<String, Long>> noticeIdList);

	void batchUpdateStarTargetStatus(@Param("noticeIds")List<Long> noticeIds);
	
	void batchCancelStarTargetStatus(@Param("noticeIds")List<Long> noticeIds);
	
	List<BrandNotice> searchUserBrandNoticeByPage(BrandNoticeSearchCondition searchCondition);
	
	int searchBrandNoticeCountByPage(BrandNoticeSearchCondition searchCondition);
	
	List<BrandNoticeType> getBrandNoticeTypes();
	
	List<BrandNoticeTypeCount> getBrandNoticeCountByNoticeType(int userId);

	Map<String, Map<String, String>> getUserStarTargetNoticeCountByRemainDay(int userId);

	List<BrandNotice> getUserStarTargetNoticesByPage(Page page);

	int getUserStarTargetNoticesCount(int userId);

	void saveBrandNotice(BrandNotice brandNotice);
	
	int getAllBrandNoticeCountByUserId(int userId);

	List<BrandNotice> searchUserStarTargetNoticesByPage(NoticeSearchCondition searchCondition);

	int searchUserStarTargetNoticesCount(NoticeSearchCondition searchCondition);
	
	String getzipFileNameById(long noticeId);

	

}
