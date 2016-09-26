package com.lotut.pms.dao;

import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.Notice;
import com.lotut.pms.domain.NoticePaperApplyType;
import com.lotut.pms.domain.NoticeProcessStatus;
import com.lotut.pms.domain.NoticeRemark;
import com.lotut.pms.domain.NoticeSearchCondition;
import com.lotut.pms.domain.NoticeType;
import com.lotut.pms.domain.Page;

public interface NoticeDao {
	//分页
	int getUserNoticesCount(int userId);
	List<Notice> getUserNoticesByPage(Page page);
	
	List<Notice> getUserNotices(int userId);
	
	Notice getNoticeById(int noticeId);
	
	List<Notice> searchUserNotices(NoticeSearchCondition searchCondition);
	
	void insertOrUpdateNotice(Notice notice);
	
	List<NoticeProcessStatus> getAllNoticeProcessStatus();
	
	List<NoticePaperApplyType> getAllNoticePaperApplyType();
	
	List<NoticeType> getAllNoticeType();
	//通知书处理状态
	void updateNoticesProcessStatus(List<Integer> noticeIdList, int noticeProcessStatus);
	
	void updateNoticePaperApplyType(int noticeId, int paperApplyType);
	//搜索分页
	int searchUserNoticesCount(NoticeSearchCondition searchCondition);
	
	List<Notice> searchUserNoticesByPage(NoticeSearchCondition searchCondition);
	
	void batchUpdateNoticesNoticePaperType(List<Integer> noticeIdList, int noticePaperApplyType);
	
	Map<String , Map<String,String>> getUserNoticeCountByType(int userId);
	
	Map<String , Map<String,String>> getUserNoticeCountByNoticeType(int userId);
	
	Map<String , Map<String,String>> getUserNoticeCountByProcessStatus(int userId);
	
	Map<String , Map<String,String>> getUserNoticeCountByPaperApplyType(int userId);
	
	Map<String , Map<String,String>> getUserNoticeCountByRemainDay(int userId);
	
	List<NoticeRemark> getNoticeRemarks(String noticeId);
	
	void addNoticeRemark(String noticeId, String content, int userId);
	
	void updatePatentDocByInternalCode(Notice notice);
	
	List<Notice> getUserNoticesByIds(List<Long> noticeIds);
}
