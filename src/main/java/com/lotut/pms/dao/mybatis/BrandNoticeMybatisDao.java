package com.lotut.pms.dao.mybatis;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.BrandNoticeDao;
import com.lotut.pms.dao.mapper.BrandNoticeMapper;
import com.lotut.pms.domain.BrandNotice;
import com.lotut.pms.domain.BrandNoticeRemark;
import com.lotut.pms.domain.BrandNoticeSearchCondition;
import com.lotut.pms.domain.BrandNoticeType;
import com.lotut.pms.domain.Notice;
import com.lotut.pms.domain.NoticeSearchCondition;
import com.lotut.pms.domain.BrandNoticeTypeCount;
import com.lotut.pms.domain.Page;

public class BrandNoticeMybatisDao extends SqlSessionDaoSupport implements BrandNoticeDao{
	private BrandNoticeMapper brandNoticeMapper;
	
	public void setBrandNoticeMapper(BrandNoticeMapper brandNoticeMapper) {
		this.brandNoticeMapper = brandNoticeMapper;
	}

	@Override
	public int getUserBrandNoticeCount(int userId) {
		return brandNoticeMapper.getUserBrandNoticeCount(userId);
	}

	@Override
	public List<BrandNotice> getUserBrandNoticeList(Page page) {
		return brandNoticeMapper.getUserBrandNoticeList(page);
	}

	@Override
	public List<BrandNotice> getUserBrandNoticeExcelData(List<Integer> noticeIds) {
		return brandNoticeMapper.getUserBrandNoticeExcelData(noticeIds);
	}

	@Override
	public void saveBrandNoticeRemark(BrandNoticeRemark brandNoticeRemark) {
		brandNoticeMapper.saveBrandNoticeRemark(brandNoticeRemark);
	}

	@Override
	public List<BrandNoticeRemark> getBrandNoticeListByNoticeId(long brandNoticeId) {
		return brandNoticeMapper.getBrandNoticeListByNoticeId(brandNoticeId);
	}
	
	@Override
	public void batchChangeBrandNoticeViewStatus(List<Map<String, Long>> noticeIdList) {
		brandNoticeMapper.batchChangeBrandNoticeViewStatus(noticeIdList);
	}

	@Override
	public void batchUpdateStarTargetStatus(List<Long> noticeIds) {
		 brandNoticeMapper.batchUpdateStarTargetStatus(noticeIds);
	}	
	
	@Override
	public void batchCancelStarTargetStatus(List<Long> noticeIds) {
		 brandNoticeMapper.batchCancelStarTargetStatus(noticeIds);
		
	}
	
	public List<BrandNotice> searchUserBrandNoticeByPage(BrandNoticeSearchCondition searchCondition) {
		return brandNoticeMapper.searchUserBrandNoticeByPage(searchCondition);
	}

	@Override
	public int searchBrandNoticeCountByPage(BrandNoticeSearchCondition searchCondition) {
		return brandNoticeMapper.searchBrandNoticeCountByPage(searchCondition);
	}

	@Override
	public List<BrandNoticeType> getBrandNoticeTypes() {
		return brandNoticeMapper.getBrandNoticeTypes();
	}

	@Override
	public Map<String, Map<String, String>> getUserStarTargetNoticeCountByRemainDay(int userId) {
		return brandNoticeMapper.getUserStarTargetNoticeCountByRemainDay(userId);
	}

	@Override
	public List<BrandNotice> getUserStarTargetNoticesByPage(Page page) {
		return brandNoticeMapper.getUserStarTargetNoticesByPage(page);
	}

	@Override
	public int getUserStarTargetNoticesCount(int userId) {
		return brandNoticeMapper.getUserStarTargetNoticesCount(userId);
	}


	public List<BrandNoticeTypeCount> getBrandNoticeCountByNoticeType(int userId) {
		return brandNoticeMapper.getBrandNoticeCountByNoticeType(userId);
	}
	
	@Override
	public void saveBrandNotice(BrandNotice brandNotice) {
		brandNoticeMapper.saveBrandNotice(brandNotice);
	}

	@Override
	public int getAllBrandNoticeCountByUserId(int userId) {
		return brandNoticeMapper.getAllBrandNoticeCountByUserId(userId);
	}

	@Override
	public List<BrandNotice> searchUserStarTargetNoticesByPage(NoticeSearchCondition searchCondition) {
		return brandNoticeMapper.searchUserStarTargetNoticesByPage(searchCondition);
	}

	@Override
	public int searchUserStarTargetNoticesCount(NoticeSearchCondition searchCondition) {
		return brandNoticeMapper.searchUserStarTargetNoticesCount(searchCondition);
	}

	@Override
	public String getzipFileNameById(long noticeId) {
		return brandNoticeMapper.getzipFileNameById(noticeId);
	}

	
	
}
