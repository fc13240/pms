package com.lotut.pms.dao.mybatis;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.NoticeDao;
import com.lotut.pms.dao.mapper.NoticeMapper;
import com.lotut.pms.domain.Notice;
import com.lotut.pms.domain.NoticePaperApplyType;
import com.lotut.pms.domain.NoticeProcessStatus;
import com.lotut.pms.domain.NoticeRemark;
import com.lotut.pms.domain.NoticeSearchCondition;
import com.lotut.pms.domain.NoticeType;
import com.lotut.pms.domain.Page;
import com.lotut.pms.util.PrincipalUtils;

public class NoticeMybatisDao extends SqlSessionDaoSupport implements NoticeDao {
	private NoticeMapper noticeMapper;
	
	@Override
	public List<Notice> getUserNotices(int userId) {
		return noticeMapper.getUserNotices(userId);
	}

	@Override
	public List<Notice> searchUserNotices(NoticeSearchCondition searchCondition) {
		return noticeMapper.searchUserNotices(searchCondition);
	}
	
	@Override
	public List<NoticeProcessStatus> getAllNoticeProcessStatus() {
		return noticeMapper.getAllNoticeProcessStatus();
	}

	@Override
	public void updateNoticesProcessStatus(List<Integer> noticeIdList, int noticeProcessStatus) {
		noticeMapper.updateNoticesProcessStatus(noticeIdList, noticeProcessStatus);
	}

	@Override
	public void updateNoticePaperApplyType(int noticeId, int paperApplyType) {
		noticeMapper.updateNoticePaperApplyType(noticeId, paperApplyType);
	}
	
	@Override
	public List<NoticePaperApplyType> getAllNoticePaperApplyType() {
		return noticeMapper.getAllNoticePaperApplyType();
	}

	@Override
	public List<NoticeType> getAllNoticeType() {
		return noticeMapper.getAllNoticeType();
	}

	public NoticeMapper getNoticeMapper() {
		return noticeMapper;
	}

	public void setNoticeMapper(NoticeMapper noticeMapper) {
		this.noticeMapper = noticeMapper;
	}

	@Override
	public Notice getNoticeById(int noticeId) {
		return noticeMapper.getNoticeById(noticeId);
	}

	@Override
	public void insertOrUpdateNotice(Notice notice) {
		noticeMapper.insertOrUpdateNotice(notice);
	}

	@Override
	public int getUserNoticesCount(int userId) {
		return noticeMapper.getUserNoticesCount(userId);
	}

	@Override
	public List<Notice> getUserNoticesByPage(Page page) {
		return noticeMapper.getUserNoticesByPage(page);
	}

	@Override
	public int searchUserNoticesCount(NoticeSearchCondition searchCondition) {
		return noticeMapper.searchUserNoticesCount(searchCondition);
	}

	@Override
	public List<Notice> searchUserNoticesByPage(NoticeSearchCondition searchCondition) {
		Page page = searchCondition.getPage();
		page.setUserId(PrincipalUtils.getCurrentUserId());
		int userNoticeCount = noticeMapper.getUserNoticesCount(page.getUserId());
		page.setTotalRecords(userNoticeCount);
		return noticeMapper.searchUserNoticesByPage(searchCondition);
	}

	@Override
	public void batchUpdateNoticesNoticePaperType(List<Integer> noticeIdList, int noticePaperApplyType) {
		noticeMapper.batchUpdateNoticesNoticePaperType(noticeIdList, noticePaperApplyType);
		
	}

	@Override
	public Map<Integer, Map<String, Long>> getUserNoticeCountByType(int userId) {
		return noticeMapper.getUserNoticeCountByType(userId);
	}

	@Override
	public Map<String, Map<String, String>> getUserNoticeCountByNoticeType(int userId) {
		return noticeMapper.getUserNoticeCountByNoticeType(userId);
	}

	@Override
	public Map<String, Map<String, String>> getUserNoticeCountByProcessStatus(int userId) {
		return noticeMapper.getUserNoticeCountByProcessStatus(userId);
	}

	@Override
	public Map<String, Map<String, String>> getUserNoticeCountByPaperApplyType(int userId) {
		return noticeMapper.getUserNoticeCountByPaperApplyType(userId);
	}


	@Override
	public Map<String, Map<String, String>> getUserNoticeCountByRemainDay(int userId) {
		return noticeMapper.getUserNoticeCountByRemainDay(userId);
	}

	@Override
	public List<NoticeRemark> getNoticeRemarks(String noticeId) {
		return noticeMapper.getNoticeRemarks(noticeId);
	}

	@Override
	public void addNoticeRemark(String noticeId, String content, int userId) {
		 noticeMapper.addNoticeRemark(noticeId,content,userId);
		
	}

	@Override
	public void updatePatentDocByInternalCode(Notice notice) {
		noticeMapper.updatePatentDocByInternalCode(notice);
	}
	
	@Override
	public List<Notice> getUserNoticesByIds(List<Long> noticeIds) {
		return noticeMapper.getUserNoticesByIds(noticeIds);

	}

	@Override
	public void batchChangeNoticeViewStatus(List<Map<String, Long>> noticeIdList) {
		noticeMapper.batchChangeNoticeViewStatus(noticeIdList);
	}

	@Override
	public int unreadNoticeCount(int userId) {
		return noticeMapper.unreadNoticeCount(userId);
	}

	@Override
	public List<Notice> unreadNoticeList(Page page) {
		return noticeMapper.unreadNoticeList(page);
	}

	@Override
	public List<Notice> getNoticeOverview(String appNo, int userId) {
		return noticeMapper.getNoticeOverview(appNo, userId);
	}

	@Override
	public List<Notice> getUserStarTargetNoticesByPage(Page page) {
		return noticeMapper.getUserStarTargetNoticesByPage(page);
	}

	@Override
	public int getUserStarTargetNoticesCount(int userId) {
		return noticeMapper.getUserStarTargetNoticesCount(userId);
	}

	@Override
	public List<Notice> searchUserStarTargetNoticesByPage(NoticeSearchCondition searchCondition) {
		return noticeMapper.searchUserStarTargetNoticesByPage(searchCondition);
	}

	@Override
	public Map<String, Map<String, String>> getUserStarTargetNoticeCountByRemainDay(int userId) {
		return noticeMapper.getUserStarTargetNoticeCountByRemainDay(userId);
	}

	@Override
	public int searchUserStarTargetNoticesCount(NoticeSearchCondition searchCondition) {
		return noticeMapper.searchUserStarTargetNoticesCount(searchCondition);
	}

	@Override
	public void batchUpdateStarTargetStatus(List<Long> noticeIds) {
		noticeMapper.batchUpdateStarTargetStatus(noticeIds);
	}	
	
	@Override
	public void batchCancelStarTargetStatus(List<Long> noticeIds) {
		noticeMapper.batchCancelStarTargetStatus(noticeIds);
	}

	@Override
	public Map<String, Integer> getNoticesDateType(int userId) {
		return noticeMapper.getNoticesDateType(userId);
	}

	@Override
	public List<Notice> getTodayNotices(Page pge) {
		return noticeMapper.getTodayNotices(pge);
	}

	@Override
	public List<Notice> getWillOverdeadLine(Page pge) {
		return noticeMapper.getWillOverdeadLine(pge);
	}

	@Override
	public int getTodayNoticesCount(int userId) {
		return noticeMapper.getTodayNoticesCount(userId);
	}

	@Override
	public int getWillOverdeadLineCount(int userId) {
		return noticeMapper.getWillOverdeadLineCount(userId);
	}	

	
	
	
}
