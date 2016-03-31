package com.lotut.pms.service;

import java.io.IOException;
import java.nio.file.Path;
import java.util.List;

import com.lotut.pms.domain.Notice;
import com.lotut.pms.domain.NoticePaperApplyType;
import com.lotut.pms.domain.NoticeProcessStatus;
import com.lotut.pms.domain.NoticeSearchCondition;
import com.lotut.pms.domain.NoticeType;

import net.lingala.zip4j.core.ZipFile;
import net.lingala.zip4j.exception.ZipException;

public interface NoticeService {
	List<Notice> getUserNotices(int userId);
	
	Notice getNoticeById(int noticeId);
	
	ZipFile createNoticeZipFile(Notice notice) throws IOException;
	
	List<Notice> getUserNoticesByRemainDays(int userId, int timeLimitType);
	
	List<Notice> searchUserNotices(NoticeSearchCondition searchCondition);
	
	List<NoticeProcessStatus> getAllNoticeProcessStatus();
	
	List<NoticePaperApplyType> getAllNoticePaperApplyType();
	
	List<NoticeType> getAllNoticeType();
	
	void uploadNotices(String zipFilePath) throws IOException, ZipException;
	
	void updateNoticesProcessStatus(List<Integer> noticeIdList, int noticeProcessStatus);
	
	void changeNoticePaperApplyType(int noticeId, int paperApplyType);
	
	Path createPdfIfNeeded(int noticeId);
}
