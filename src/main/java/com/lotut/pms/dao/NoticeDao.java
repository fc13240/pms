package com.lotut.pms.dao;

import java.util.List;

import com.lotut.pms.domain.Notice;
import com.lotut.pms.domain.NoticePaperApplyType;
import com.lotut.pms.domain.NoticeProcessStatus;
import com.lotut.pms.domain.NoticeSearchCondition;
import com.lotut.pms.domain.NoticeType;

public interface NoticeDao {
	List<Notice> getUserNotices(int userId);
	
	Notice getNoticeById(int noticeId);
	
	List<Notice> getUserNoticesByRemainDays(int userId, int timeLimitType);
	
	List<Notice> searchUserNotices(NoticeSearchCondition searchCondition);
	
	void insertOrUpdateNotice(Notice notice);
	
	List<NoticeProcessStatus> getAllNoticeProcessStatus();
	
	List<NoticePaperApplyType> getAllNoticePaperApplyType();
	
	List<NoticeType> getAllNoticeType();
	
	void updateNoticesProcessStatus(List<Integer> noticeIdList, int noticeProcessStatus);
	
	void updateNoticePaperApplyType(int noticeId, int paperApplyType);
}
