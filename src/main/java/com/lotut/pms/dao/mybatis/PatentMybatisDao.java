package com.lotut.pms.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.PatentDao;
import com.lotut.pms.dao.mapper.PatentMapper;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.Patent;
import com.lotut.pms.domain.PatentSearchCondition;
import com.lotut.pms.domain.PatentStatus;
import com.lotut.pms.domain.PatentType;
import com.lotut.pms.util.PrincipalUtils;

public class PatentMybatisDao extends SqlSessionDaoSupport implements PatentDao {
	private PatentMapper patentMapper;
	
	@Override
	public List<Patent> getUserPatentsByType(int userId, int patentType) {
		return patentMapper.getUserPatentsByType(userId, patentType);
	}

	@Override
	public List<Patent> getUserPatentsByStatus(int userId, int patentStatus) {
		return patentMapper.getUserPatentsByStatus(userId, patentStatus);
	}

	@Override
	public List<Patent> getUserPatents(Page page) {
		return patentMapper.getUserPatents(page);
	}
	
	@Override
	public Patent getPatentById(long patentId) {
		return patentMapper.getPatentById(patentId);
	}
	

	@Override
	public Patent getPatentByAppNoAndOwner(String appNo, int ownerId) {
		return patentMapper.getPatentByAppNoAndOwner(appNo, ownerId);
	}
	
	@Override
	public List<Patent> searchUserPatents(PatentSearchCondition searchCondition) {
		return patentMapper.searchUserPatents(searchCondition);
	}
	
	@Override
	public List<Patent> searchUserPatentsByPage(PatentSearchCondition searchCondition) {
		Page page = searchCondition.getPage();
		page.setUserId(PrincipalUtils.getCurrentUserId());
		int userPatentCount = patentMapper.getUserPatentCount(page.getUserId());
		page.setTotalRecords(userPatentCount);
		return patentMapper.searchUserPatentsByPage(searchCondition);
	}

	@Override
	public List<PatentType> getAllPatentTypes() {
		return patentMapper.getAllPatentTypes();
	}
	
	@Override
	public List<PatentStatus> getAllPatentStatus() {
		return patentMapper.getAllPatentStatus();
	}
	
	@Override
	public void updateInternalCode(int patentId, String internalCode) {
		patentMapper.updateInternalCode(patentId, internalCode);
	}

	public void setPatentMapper(PatentMapper patentMapper) {
		this.patentMapper = patentMapper;
	}

	@Override
	public void insertOrUpdatePatent(Patent patent) {
		patentMapper.insertOrUpdatePatent(patent);
	}

	@Override
	public void insertPatent(Patent patent) {
		patentMapper.insertPatent(patent);
	}

	@Override
	public void updatePatent(Patent patent) {
		patentMapper.updatePatent(patent);
	}

	@Override
	public List<Patent> getPatentsByIds(List<Long> patentIds) {
		return patentMapper.getPatentsByIds(patentIds);
	}

	@Override
	public int getUserPatentCount(int userId) {
		return patentMapper.getUserPatentCount(userId);
	}
}
