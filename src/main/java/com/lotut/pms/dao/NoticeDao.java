package com.lotut.pms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.Notice;
import com.lotut.pms.domain.NoticePaperApplyType;
import com.lotut.pms.domain.NoticeProcessStatus;
import com.lotut.pms.domain.NoticeSearchCondition;
import com.lotut.pms.domain.NoticeType;
import com.lotut.pms.domain.Page;

public interface NoticeDao {
	//分页
	int getUserNoticesCount(int userId);
	List<Notice> getUserNoticesByPage(Page page);
	
	List<Notice> getUserNotices(int userId);
	
	Notice getNoticeById(int noticeId);
	
	List<Notice> getUserNoticesByRemainDays(int userId, int timeLimitType);
	
	List<Notice> searchUserNotices(NoticeSearchCondition searchCondition);
	
	void insertOrUpdateNotice(Notice notice);
	
	List<NoticeProcessStatus> getAllNoticeProcessStatus();
	
	List<NoticePaperApplyType> getAllNoticePaperApplyType();
	
	List<NoticeType> getAllNoticeType();
	//通知书处理状态
	void updateNoticesProcessStatus(List<Integer> noticeIdList, int noticeProcessStatus);
	
	void updateNoticePaperApplyType(int noticeId, int paperApplyType);
}
