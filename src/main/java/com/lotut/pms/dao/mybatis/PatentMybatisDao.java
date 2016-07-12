package com.lotut.pms.dao.mybatis;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.PatentDao;
import com.lotut.pms.dao.mapper.PatentMapper;
import com.lotut.pms.domain.GoodsDetail;
import com.lotut.pms.domain.GoodsFirstColumn;
import com.lotut.pms.domain.GoodsSecondColumn;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.Patent;
import com.lotut.pms.domain.PatentSearchCondition;
import com.lotut.pms.domain.PatentStatus;
import com.lotut.pms.domain.PatentType;
import com.lotut.pms.domain.TransactionPatentSearchCondition;
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

	@Override
	public int searchUserPatentsCount(PatentSearchCondition searchCondition) {
		return patentMapper.searchUserPatentsCount(searchCondition);
	}

	@Override
	public List<GoodsFirstColumn> getFirstColumn() {
		// TODO Auto-generated method stub
		return patentMapper.getFirstColumn();
	}

	@Override
	public List<GoodsSecondColumn> getSecondColumn(int firstColumnId) {
		return patentMapper.getSecondColumn(firstColumnId);
	}

	@Override
	public void saveGoods(GoodsDetail goodsDetail) {
		patentMapper.saveGoods(goodsDetail);
	}

	@Override
	public void addPatent(Patent patent) {
		patentMapper.addPatent(patent);
		
	}

	@Override
	public Map<String, Map<String, String>> getUserPatentCountByType(int userId) {
		return patentMapper.getUserPatentCountByType(userId);
	}

	@Override
	public Map<String, Map<String, String>> searchUserPatentsByPatentStatus(int userId) {
		return patentMapper.searchUserPatentsByPatentStatus(userId);
	}

	@Override
	public List<Patent> getUserPatentsWithFee(int userId) {
		return patentMapper.getUserPatentsWithFee(userId);
	}

	@Override
	public Patent getPatentsByAppNo(Integer userId,String appNo) {
		return patentMapper.getPatentsByAppNo(userId,appNo);
	}

	@Override
	public long getPatentIdByAppNo(Integer userId,String appNo) {
		return patentMapper.getPatentIdByAppNo(userId,appNo);
	}

	@Override
	public List<GoodsDetail> getUserTransactionPatents(Page page) {
		return patentMapper.getUserTransactionPatents(page);
	}

	@Override
	public int getUserTransactionPatentsCount(int userId) {
		return patentMapper.getUserTransactionPatentsCount(userId);
	}

	@Override
	public List<GoodsDetail> searchTransactionPatentsByPage(TransactionPatentSearchCondition searchCondition) {
		return patentMapper.searchTransactionPatentsByPage(searchCondition);
	}

	@Override
	public int searchTransactionPatentsCount(TransactionPatentSearchCondition searchCondition) {
		return patentMapper.searchTransactionPatentsCount(searchCondition);
	}
	public void downTransactionPatent(int patentId) {
		patentMapper.downTransactionPatent(patentId);
	}

	@Override
	public void upTransactionPatent(int patentId) {
		patentMapper.upTransactionPatent(patentId);
	}

	@Override
	public void deleteTransactionPatent(int patentId) {
		patentMapper.deleteTransactionPatent(patentId);
	}

	@Override
	public void patentsTrash(List<Long> patentIds,int userId) {
		patentMapper.patentsTrash(patentIds,userId);
	}

	@Override
	public List<Patent> getPatentsRecycled(Page page) {
		return patentMapper.getPatentsRecycled(page);
	}

	@Override
	public int getPatentsRecycledCount(int userId) {
		return patentMapper.getPatentsRecycledCount(userId);
	}

	@Override
	public void recoverPatents(List<Long> patentIds, int userId) {
		patentMapper.recoverPatents(patentIds, userId);
		
	}

	@Override
	public void deleteForeverPatents(List<Long> patentIds, int userId) {
		patentMapper.deleteForeverPatents(patentIds, userId);
		
	}

	@Override
	public List<Patent> getUserPatentsByCreateTime(Page page) {
		return patentMapper.getUserPatentsByCreateTime(page);
	}

	@Override
	public void batchSaveGoods(List<Long> patentIds, int userId) {
		patentMapper.batchSaveGoods(patentIds, userId);
		
	}

	@Override
	public void updatePatentsGoodsStatus(List<Long> patentIds) {
		patentMapper.updatePatentsGoodsStatus(patentIds);
		
	}
}
