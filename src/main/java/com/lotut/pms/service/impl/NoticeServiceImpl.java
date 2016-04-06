package com.lotut.pms.service.impl;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lotut.pms.constants.Settings;
import com.lotut.pms.dao.NoticeDao;
import com.lotut.pms.dao.PatentDao;
import com.lotut.pms.dao.SharePatentDao;
import com.lotut.pms.domain.Notice;
import com.lotut.pms.domain.NoticePaperApplyType;
import com.lotut.pms.domain.NoticeProcessStatus;
import com.lotut.pms.domain.NoticeSearchCondition;
import com.lotut.pms.domain.NoticeType;
import com.lotut.pms.domain.Patent;
import com.lotut.pms.service.NoticeService;
import com.lotut.pms.service.utils.NoticeXmlParser;
import com.lotut.pms.service.utils.ZipUtils;

import net.lingala.zip4j.core.ZipFile;
import net.lingala.zip4j.exception.ZipException;

public class NoticeServiceImpl implements NoticeService {
	private NoticeDao noticeDao;
	private PatentDao patentDao;
	private SharePatentDao sharePatentDao;
	
	public NoticeServiceImpl(NoticeDao noticeDao, PatentDao patentDao, SharePatentDao sharePatentDao) {
		this.noticeDao = noticeDao;
		this.patentDao = patentDao;
		this.sharePatentDao = sharePatentDao;
	}

	@Override
	public List<Notice> getUserNotices(int userId) {
		return noticeDao.getUserNotices(userId);
	}

	@Override
	public Notice getNoticeById(int noticeId) {
		return noticeDao.getNoticeById(noticeId);
	}
	

	@Override
	public ZipFile createNoticeZipFile(Notice notice) throws IOException {
		String tempFileName = Settings.TEMP_DIR + notice.getNoticeId() + System.currentTimeMillis() + ".zip"; 
		Path noticePath = Paths.get(Settings.NOTICE_ROOT_PATH, notice.getZipfileName(), notice.getNoticeSequence());
		ZipFile noticeZipFile = ZipUtils.zip(noticePath.toFile(), tempFileName);
		
		return noticeZipFile;
	}
	
	@Override
	public List<Notice> getUserNoticesByRemainDays(int userId, int timeLimitType) {
		return noticeDao.getUserNoticesByRemainDays(userId, timeLimitType);
	}

	@Override
	public List<Notice> searchUserNotices(NoticeSearchCondition searchCondition) {
		return noticeDao.searchUserNotices(searchCondition);
	}

	@Override
	public List<NoticeProcessStatus> getAllNoticeProcessStatus() {
		return noticeDao.getAllNoticeProcessStatus();
	}

	@Override
	public List<NoticePaperApplyType> getAllNoticePaperApplyType() {
		return noticeDao.getAllNoticePaperApplyType();
	}

	@Override
	public List<NoticeType> getAllNoticeType() {
		return noticeDao.getAllNoticeType();
	}
	//通知书处理状态
	@Override
	public void updateNoticesProcessStatus(List<Integer> noticeIdList, int noticeProcessStatus) {
		noticeDao.updateNoticesProcessStatus(noticeIdList, noticeProcessStatus);
	}

	@Override
	public void changeNoticePaperApplyType(int noticeId, int paperApplyType) {
		noticeDao.updateNoticePaperApplyType(noticeId, paperApplyType);
	}

	@Override
	public Path createPdfIfNeeded(int noticeId) {
		Notice notice = noticeDao.getNoticeById(noticeId);
		Path previewPath = Paths.get(Settings.NOTICE_ROOT_PATH, notice.getZipfileName(), 
				notice.getNoticeSequence(), notice.getNoticeSequence(), notice.getNoticeSequence());
		Path pdfPath = Paths.get(previewPath.toString(), "output.pdf");
		String pdfGenerateCommand = "convert " + previewPath + "/*.tif " + pdfPath;
		String errorMessage = "Cannot found the preview file " + pdfPath + " for notice [id=" + noticeId + ", name=" + notice.getName() + "]";
		
		try {
			if (!pdfPath.toFile().exists()) {
				Process pdfGeneratorProcess = Runtime.getRuntime().exec(pdfGenerateCommand);
				pdfGeneratorProcess.wait(2000);
			}
			
			if (pdfPath.toFile().exists()) {
				return pdfPath;
			} else {
				throw new RuntimeException(errorMessage);
			}
			
		} catch (Exception e) {
			throw new RuntimeException(errorMessage);
		}
	}

	@Override
	public void uploadNotices(String zipFilePath) throws IOException, ZipException {
		String noticeSubPath = zipFilePath.substring(zipFilePath.lastIndexOf("/")+1, zipFilePath.lastIndexOf(".zip"));
		String noticePath = Settings.NOTICE_ROOT_PATH + noticeSubPath;
//		String noticePath = "d:/soft/tomcat8/temp/" + noticeSubPath;
		
		ZipUtils.unZip(zipFilePath, noticePath);
		
		List<Notice> notices = NoticeXmlParser.parseNoticeXmlFiles(noticePath);
		
		saveOrUpdateNotices(notices);
	}
	
	public void saveOrUpdateNotices(List<Notice> notices) {
		for (Notice notice: notices) {
			Patent patent = notice.getPatent();
			Patent patentInDb = patentDao.getPatentByAppNoAndOwner(patent.getAppNo(), patent.getOwnerId());
			
			boolean isNewPatent = patentInDb == null;
			if (isNewPatent) {
				patentDao.insertPatent(patent);
				
				addUserPatentRecord(patent);
			} else {
				patentDao.updatePatent(patent);
				notice.getPatent().setPatentId(patentInDb.getPatentId());
			}
			
			noticeDao.insertOrUpdateNotice(notice);
		}
	}
	
	private void addUserPatentRecord(Patent patent) {
		List<Map<String, Integer>> userPatents = new ArrayList<>();
		Map<String, Integer> userPatentMap = new HashMap<>();
		userPatentMap.put("user", patent.getOwnerId());
		userPatentMap.put("patent", (int) patent.getPatentId());
		userPatents.add(userPatentMap);
		sharePatentDao.insertUserPatents(userPatents);
	}
	
}
