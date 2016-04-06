package com.lotut.pms.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.Notice;
import com.lotut.pms.domain.NoticePaperApplyType;
import com.lotut.pms.domain.NoticeProcessStatus;
import com.lotut.pms.domain.NoticeSearchCondition;
import com.lotut.pms.domain.NoticeType;

public interface NoticeMapper {
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
}
