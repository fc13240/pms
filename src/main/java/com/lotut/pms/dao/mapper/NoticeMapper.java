package com.lotut.pms.dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.Notice;
import com.lotut.pms.domain.NoticePaperApplyType;
import com.lotut.pms.domain.NoticeProcessStatus;
import com.lotut.pms.domain.NoticeRemark;
import com.lotut.pms.domain.NoticeSearchCondition;
import com.lotut.pms.domain.NoticeType;
import com.lotut.pms.domain.Page;

public interface NoticeMapper {
	//分页
	int getUserNoticesCount(@Param("userId")int userId);
	List<Notice> getUserNoticesByPage(Page page);
	
	List<Notice> getUserNotices(int userId);
	
	Notice getNoticeById(@Param("noticeId")int noticeId);
	
	List<Notice> searchUserNotices(NoticeSearchCondition searchCondition);
	
	void insertOrUpdateNotice(Notice notice);
	
	List<NoticeProcessStatus> getAllNoticeProcessStatus();
	
	List<NoticePaperApplyType> getAllNoticePaperApplyType();
	
	List<NoticeType> getAllNoticeType();
	//通知书处理状态
	void updateNoticesProcessStatus(@Param("noticeIdList")List<Integer> noticeIdList, @Param("noticeProcessStatus")int noticeProcessStatus);
	
	void updateNoticePaperApplyType(@Param("noticeId")int noticeId, @Param("paperApplyType")int paperApplyType);
	//搜索分页
	int searchUserNoticesCount(NoticeSearchCondition searchCondition);
	
	List<Notice> searchUserNoticesByPage(NoticeSearchCondition searchCondition);
	
	void batchUpdateNoticesNoticePaperType(@Param("noticeIdList")List<Integer> noticeIdList, @Param("noticePaperApplyType")int noticePaperApplyType);
	
	@MapKey("patentType")
	Map<Integer , Map<String,Long>> getUserNoticeCountByType(int userId);
	
	@MapKey("noticeType")
	Map<String , Map<String,String>> getUserNoticeCountByNoticeType(int userId);
	
	@MapKey("processStatus")
	Map<String , Map<String,String>> getUserNoticeCountByProcessStatus(int userId);
	
	@MapKey("paperApplyType")
	Map<String , Map<String,String>> getUserNoticeCountByPaperApplyType(int userId);
	
	int getUserNoticesByRemainDaysCount(@Param("userId")int userId, @Param("timeLimitType")int timeLimitType);
	
	@MapKey("remain_day_type")
	Map<String , Map<String,String>> getUserNoticeCountByRemainDay(int userId);
	
	List<NoticeRemark> getNoticeRemarks(String noticeId);
	
	void addNoticeRemark(@Param("noticeId")String noticeId, @Param("content")String content,@Param("userId") int userId);
	
	void updatePatentDocByInternalCode(Notice notice);
	
	List<Notice> getUserNoticesByIds(@Param("noticeIds")List<Long> noticeIds);
	
	void batchChangeNoticeViewStatus(List<Map<String, Long>> noticeIdList);
	
	int unreadNoticeCount(int userId);
	
	List<Notice> unreadNoticeList(Page page);
	
	List<Notice> getNoticeOverview(@Param("appNo") String appNo,@Param("userId") int userId);
	
	
	
	
	List<Notice> getUserStarTargetNoticesByPage(Page page);
	
	int getUserStarTargetNoticesCount(@Param("userId")int userId);

	List<Notice> searchUserStarTargetNoticesByPage(NoticeSearchCondition searchCondition);
	
	@MapKey("remain_day_type")
	Map<String , Map<String,String>> getUserStarTargetNoticeCountByRemainDay(int userId);
	
	int searchUserStarTargetNoticesCount(NoticeSearchCondition searchCondition);
	
	void batchUpdateStarTargetStatus(@Param("noticeIds")List<Long> noticeIds);
	
	void batchCancelStarTargetStatus(@Param("noticeIds")List<Long> noticeIds);
	
	@MapKey("date_type")
	Map<String, Integer> getNoticesDateType(int userId);
	
	List<Notice> getTodayNotices(Page pge);
	
	List<Notice> getWillOverdeadLine(Page pge);
	
	int getTodayNoticesCount(int userId);
	
	int getWillOverdeadLineCount(int userId);
	
	
}
