package com.lotut.pms.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.Notice;
import com.lotut.pms.domain.NoticePaperApplyType;
import com.lotut.pms.domain.NoticeProcessStatus;
import com.lotut.pms.domain.NoticeSearchCondition;
import com.lotut.pms.domain.NoticeType;
import com.lotut.pms.domain.Page;

public interface NoticeMapper {
	//分页
	int getUserNoticesCount(@Param("userId")int userId);
	List<Notice> getUserNoticesByPage(Page page);
	
	List<Notice> getUserNotices(int userId);
	
	Notice getNoticeById(@Param("noticeId")int noticeId);
	
	List<Notice> getUserNoticesByRemainDays(@Param("userId")int userId, @Param("timeLimitType")int timeLimitType);
	
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
}
