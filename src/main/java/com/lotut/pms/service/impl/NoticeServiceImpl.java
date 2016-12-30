package com.lotut.pms.service.impl;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.transaction.annotation.Transactional;

import com.lotut.pms.constants.Settings;
import com.lotut.pms.dao.NoticeDao;
import com.lotut.pms.dao.PatentDao;
import com.lotut.pms.dao.SharePatentDao;
import com.lotut.pms.domain.Notice;
import com.lotut.pms.domain.NoticePaperApplyType;
import com.lotut.pms.domain.NoticeProcessStatus;
import com.lotut.pms.domain.NoticeRemark;
import com.lotut.pms.domain.NoticeSearchCondition;
import com.lotut.pms.domain.NoticeType;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.Patent;
import com.lotut.pms.service.NoticeService;
import com.lotut.pms.service.utils.NoticeExcelGenerator;
import com.lotut.pms.service.utils.NoticeXmlParser;
import com.lotut.pms.service.utils.ZipUtils;
import com.lotut.pms.util.PrincipalUtils;

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
	public long getUserNoticesCount(int userId) {
		return noticeDao.getUserNoticesCount(userId);
	}


	@Override
	public List<Notice> getUserNoticesByPage(Page page) {
		return noticeDao.getUserNoticesByPage(page);
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
	public List<Notice> searchUserNotices(NoticeSearchCondition searchCondition) {
		return noticeDao.searchUserNotices(searchCondition);
	}
	//搜索分页
	@Override
	public long searchUserNoticesCount(NoticeSearchCondition searchCondition){
		return noticeDao.searchUserNoticesCount(searchCondition);
	}
	
	@Override
	public List<Notice> searchUserNoticesWithPage(NoticeSearchCondition searchCondition) {
		return noticeDao.searchUserNoticesByPage(searchCondition);
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
	@Transactional
	public void updateNoticesProcessStatus(List<Integer> noticeIdList, int noticeProcessStatus) {
		noticeDao.updateNoticesProcessStatus(noticeIdList, noticeProcessStatus);
	}

	@Override
	@Transactional
	public void changeNoticePaperApplyType(int noticeId, int paperApplyType) {
		noticeDao.updateNoticePaperApplyType(noticeId, paperApplyType);
	}

	@Override
	public Path createPdfIfNeeded(int noticeId) {
		Notice notice = noticeDao.getNoticeById(noticeId);
		Path previewPath = Paths.get(Settings.NOTICE_ROOT_PATH, notice.getZipfileName(), 
				notice.getNoticeSequence(), notice.getNoticeSequence(), notice.getNoticeSequence());
		Path pdfPath = Paths.get(previewPath.toString(), notice.getPatent().getAppNo() + ".pdf");
		String[] pdfGenerateCommand = {"convert", previewPath + "/*.tif", pdfPath.toString()};
		String errorMessage = "Cannot found the preview file " + pdfPath + " for notice [id=" + noticeId + ", name=" + notice.getName() + "]";
		
		try {
			if (!pdfPath.toFile().exists()) {
				Process pdfGeneratorProcess = Runtime.getRuntime().exec(pdfGenerateCommand);
				synchronized(pdfGeneratorProcess) {
					pdfGeneratorProcess.wait(3000);
				}
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
	@Transactional
	public void uploadNotices(String zipFilePath) throws IOException, ZipException {
		String noticeSubPath = zipFilePath.substring(zipFilePath.lastIndexOf("/")+1, zipFilePath.lastIndexOf(".zip"));
		String noticePath = Settings.NOTICE_ROOT_PATH + noticeSubPath;
		
		ZipUtils.unzip(zipFilePath, noticePath);
		
		List<Notice> notices = NoticeXmlParser.parseNoticeXmlFiles(noticePath);
		
		saveOrUpdateNotices(notices);
		
		updatePatentDocuments(notices);
		
		savePatentShareUser(notices);
	}
	
	@Transactional
	public void saveOrUpdateNotices(List<Notice> notices) {
		for (Notice notice: notices) {
			Patent patent = notice.getPatent();
			Patent patentInDb = patentDao.getPatentByAppNoAndOwner(patent.getAppNo(), patent.getOwnerId());
			
			boolean isNewPatent = patentInDb == null;
			if (isNewPatent) {
				patentDao.insertPatent(patent);
				
				addUserPatentRecord(patent.getOwnerId(),patent.getPatentId());
			} else {
				
				patentDao.updatePatent(patent);
				addUserPatentRecord(patent.getOwnerId(),patentInDb.getPatentId());
				
				notice.getPatent().setPatentId(patentInDb.getPatentId());
				String patentStatusText = patentInDb.getPatentStatusText();
				String internalCode = patent.getInternalCode();
				
				final int INCREASE_SIZE = 19;
				if(patentInDb.getPatentStatus()!=null){
					int patentStatus = patentInDb.getPatentStatus().getPatentStatusId()+INCREASE_SIZE;
					patentDao.updateDocumentStatus(patentStatus,internalCode);
				}
				patentDao.updateDocumentStatusText(patentStatusText,internalCode);
				
			}
			
			noticeDao.insertOrUpdateNotice(notice);
		}
	}
	
	private void addUserPatentRecord(int userId, long patentId) {
		List<Map<String, Integer>> userPatents = new ArrayList<>();
		Map<String, Integer> userPatentMap = new HashMap<>();
		
		userPatentMap.put("user", userId);
		userPatentMap.put("patent", (int)patentId);
		userPatents.add(userPatentMap);
		sharePatentDao.insertUserPatents(userPatents);
	}

	@Override
	@Transactional
	public void batchUpdateNoticesNoticePaperType(List<Integer> noticeIdList, int noticePaperApplyType) {
		noticeDao.batchUpdateNoticesNoticePaperType(noticeIdList, noticePaperApplyType);
	}

	@Override
	public Map<Integer, Map<String, Long>> getUserNoticeCountByType(int userId) {
		return noticeDao.getUserNoticeCountByType(userId);
	}

	@Override
	public Map<String, Map<String, String>> getUserNoticeCountByNoticeType(int userId) {
		return noticeDao.getUserNoticeCountByNoticeType(userId);
	}

	@Override
	public Map<String, Map<String, String>> getUserNoticeCountByProcessStatus(int userId) {
		return noticeDao.getUserNoticeCountByProcessStatus(userId);
	}

	@Override
	public Map<String, Map<String, String>> getUserNoticeCountByPaperApplyType(int userId) {
		return noticeDao.getUserNoticeCountByPaperApplyType(userId);
	}

	@Override
	public Map<String, Map<String, String>> getUserNoticeCountByRemainDay(int userId) {
		return noticeDao.getUserNoticeCountByRemainDay(userId);
	}

	@Override
	public List<NoticeRemark> getNoticeRemarks(String noticeId) {
		return noticeDao.getNoticeRemarks(noticeId);
	}

	@Override
	public void addNoticeRemark(String noticeId, String content, int userId) {
	    noticeDao.addNoticeRemark(noticeId,content,userId);
		
	}

	public void updatePatentDocuments(List<Notice> notices){
		for(Notice notice:notices){
			if (notice.getPatent().getInternalCode() != null && !notice.getPatent().getInternalCode().isEmpty()) {
				noticeDao.updatePatentDocByInternalCode(notice);
			}
		}
	}
	@Override
	public String noticeExportExcel(List<Long> noticeIds, String exportExcelName) throws IOException {
		List<Notice> notices = noticeDao.getUserNoticesByIds(noticeIds);
		String exportExcelPath=Settings.TEMP_DIR+exportExcelName;
		NoticeExcelGenerator.writeNoticeRecordsToExcel(notices, exportExcelPath);
		return exportExcelPath;
	}
	
	public void savePatentShareUser(List<Notice> notices){
		String internalCode = null;
		
		int userId = PrincipalUtils.getCurrentUserId();
		List<Map<String, Integer>> userPatentRecords = new ArrayList<>(32);
		Map<String, Integer> userPatentMap = new HashMap<>();
		for(Notice notice:notices){
			internalCode = notice.getPatent().getInternalCode();
			if(StringUtils.isNotEmpty(internalCode)){
				List<Integer> shareUserIds = patentDao.getPatentDocShareUesrs(internalCode);
				Long patentId = patentDao.getPatentIdByInternalCode(internalCode,userId);
				if(patentId!=null){
					for(Integer shareUserId:shareUserIds){
						userPatentMap.put("user", shareUserId);
						userPatentMap.put("patent", Integer.valueOf(patentId.toString()));
						userPatentRecords.add(userPatentMap);
					}
				}
				
			}
		}
		
		if (userPatentRecords.size() > 0) {
			sharePatentDao.insertUserPatents(userPatentRecords);
		}
	}

	@Override
	@Transactional
	public int batchChangeNoticeViewStatus(List<Long> noticeIdList,int userId) {
		List<Map<String, Long>> list =new ArrayList<>();
		for(Long noticeId:noticeIdList){
			Map<String,Long> map=new HashMap<String,Long>();
			map.put("noticeId", noticeId);
			map.put("userId", new Long(userId));
			list.add(map);
		}
		noticeDao.batchChangeNoticeViewStatus(list);
		return 1;
	}

	@Override
	public int unreadNoticeCount(int userId) {
		return noticeDao.unreadNoticeCount(userId);
	}

	@Override
	public List<Notice> unreadNoticeList(Page page) {
		return noticeDao.unreadNoticeList(page);
	}

	@Override
	public List<Notice> getNoticeOverview(String appNo, int userId) {
		return noticeDao.getNoticeOverview(appNo, userId);
	}

	@Override
	public List<Notice> getUserStarTargetNoticesByPage(Page page) {
		return noticeDao.getUserStarTargetNoticesByPage(page);
	}

	@Override
	public int getUserStarTargetNoticesCount(int userId) {
		return noticeDao.getUserStarTargetNoticesCount(userId);
	}

	@Override
	public List<Notice> searchUserStarTargetNoticesByPage(NoticeSearchCondition searchCondition) {
		return noticeDao.searchUserStarTargetNoticesByPage(searchCondition);
	}

	@Override
	public Map<String, Map<String, String>> getUserStarTargetNoticeCountByRemainDay(int userId) {
		return noticeDao.getUserStarTargetNoticeCountByRemainDay(userId);
	}

	@Override
	public int searchUserStarTargetNoticesCount(NoticeSearchCondition searchCondition) {
		return noticeDao.searchUserStarTargetNoticesCount(searchCondition);
	}

	@Override
	public void batchUpdateStarTargetStatus(List<Long> noticeIds) {
		noticeDao.batchUpdateStarTargetStatus(noticeIds);
	}
	
	@Override
	public void batchCancelStarTargetStatus(List<Long> noticeIds) {
		noticeDao.batchCancelStarTargetStatus(noticeIds);
	}
}
