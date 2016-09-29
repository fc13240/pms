package com.lotut.pms.service;

import java.io.IOException;
import java.nio.file.Path;
import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.Notice;
import com.lotut.pms.domain.NoticePaperApplyType;
import com.lotut.pms.domain.NoticeProcessStatus;
import com.lotut.pms.domain.NoticeRemark;
import com.lotut.pms.domain.NoticeSearchCondition;
import com.lotut.pms.domain.NoticeType;
import com.lotut.pms.domain.Page;

import net.lingala.zip4j.core.ZipFile;
import net.lingala.zip4j.exception.ZipException;

public interface NoticeService {
	//分页
	public long getUserNoticesCount(int userId);
	List<Notice> getUserNoticesByPage(Page page);
	
	List<Notice> getUserNotices(int userId);
	
	Notice getNoticeById(int noticeId);
	
	ZipFile createNoticeZipFile(Notice notice) throws IOException;
	
	List<Notice> searchUserNotices(NoticeSearchCondition searchCondition);
	
	List<NoticeProcessStatus> getAllNoticeProcessStatus();
	

	
	List<NoticePaperApplyType> getAllNoticePaperApplyType();
	
	List<NoticeType> getAllNoticeType();
	
	void uploadNotices(String zipFilePath) throws IOException, ZipException;
	//通知书处理状态
	void updateNoticesProcessStatus(List<Integer> noticeIdList, int noticeProcessStatus);
	
	void changeNoticePaperApplyType(int noticeId, int paperApplyType);
	
	Path createPdfIfNeeded(int noticeId);
	//搜索分页
	public long searchUserNoticesCount(NoticeSearchCondition searchCondition);
	
	List<Notice> searchUserNoticesWithPage(NoticeSearchCondition searchCondition);
	
	void batchUpdateNoticesNoticePaperType(List<Integer> noticeIdList, int noticePaperApplyType);
	
	Map<Integer, Map<String, Long>> getUserNoticeCountByType(int userId);

	Map<String, Map<String, String>> getUserNoticeCountByNoticeType(int userId);
	
	Map<String , Map<String,String>> getUserNoticeCountByProcessStatus(int userId);
	
	Map<String , Map<String,String>> getUserNoticeCountByPaperApplyType(int userId);
	
	Map<String , Map<String,String>> getUserNoticeCountByRemainDay(int userId);
	
	public List<NoticeRemark> getNoticeRemarks(String noticeId);
	
	public void addNoticeRemark(String noticeId, String content, int userId);
	
	String noticeExportExcel(List<Long> noticeIds,String exportExcelName) throws IOException;
	
}
