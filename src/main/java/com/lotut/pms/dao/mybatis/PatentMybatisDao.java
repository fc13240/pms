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
import com.lotut.pms.domain.PatentRemark;
import com.lotut.pms.domain.PatentSearchCondition;
import com.lotut.pms.domain.PatentStatus;
import com.lotut.pms.domain.PatentType;
import com.lotut.pms.domain.SalePatentGood;
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
	public long insertOrUpdatePatent(Patent patent) {
		return patentMapper.insertOrUpdatePatent(patent);
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
	public Long getPatentIdByAppNo(Integer userId,String appNo) {
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

	@Override
	public void updateGoodPatents(int price, int patentSecondColumn, int patentId) {
		patentMapper.updateGoodPatents(price, patentSecondColumn, patentId);
	}

	@Override

	public void changePrice(int price, int patentId) {
		patentMapper.changePrice(price, patentId);
	}

	@Override
	public void changSecondColume(int SecondColumn, int patentId) {
		patentMapper.changSecondColume(SecondColumn, patentId);
	}

	@Override
	public void batchChangePrice(int price, List<Long> patentIds) {
		patentMapper.batchChangePrice(price, patentIds);
	}
	public int bacthsaveGoodsCheckOut(List<Long> patentIds) {
		return patentMapper.bacthsaveGoodsCheckOut(patentIds);

	}

	@Override
	public List<PatentRemark> getPatentRemarks(long patentId) {
		
		return patentMapper.getPatentRemarks(patentId);
	}

	@Override
	public void addPatentRemark(long patentId, String content,int userId) {
		patentMapper.addPatentRemark(patentId,content,userId);
	}

	@Override
	public Patent showPatentDetail(long patentId) {
		return patentMapper.showPatentDetail(patentId);
	}

	@Override
	public boolean savePatentDetail(Patent patent) {
		
		return patentMapper.savePatentDetail(patent);
	}

	@Override
	public void deleteShareUser(long patentId, int ownerId, int shareUserId) {
		
		patentMapper.deleteShareUser(patentId,ownerId,shareUserId);
	}

	@Override
	public List<Integer> getPatentDocShareUesrs(String internalCode) {
		return patentMapper.getPatentDocShareUesrs(internalCode);
	}
	
	@Override
	public Long getPatentIdByInternalCode(String internalCode,int currentUserId) {
		return patentMapper.getPatentIdByInternalCode(internalCode,currentUserId);
	}

//	@Override
//	public void savePatentShareUser(List<Integer> userIds, long patentId) {
//		patentMapper.savePatentShareUser(userIds, patentId);
//	}
	
	@Override
	public void savePatentShareUser(int userId, long patentId) {
		patentMapper.savePatentShareUser(userId, patentId);
	}
	@Override
	public List<Patent> getUserPatentsByIds(List<Long> patentIds) {
		return patentMapper.getUserPatentsByIds(patentIds);
	}

	@Override
	public void updateDocumentStatusText(String patentStatusText, String internalCode) {
		patentMapper.updateDocumentStatusText(patentStatusText, internalCode);
	}

	@Override
	public void updateDocumentStatus(int patentStatus, String internalCode) {
		patentMapper.updateDocumentStatus(patentStatus, internalCode);
	}

	@Override
	public void cancelRecommendPatent(long patentId) {
		patentMapper.cancelRecommendPatent(patentId);
		
	}

	@Override
	public void recommendPatent(long patentId) {
		patentMapper.recommendPatent(patentId);
		
	}

	@Override
	public void batchChangeTransferor(String transferor, List<Long> patentIds) {
		patentMapper.batchChangeTransferor(transferor, patentIds);
	}

	@Override
	public void saveSellPatentDescription(String description, int patentId) {
		patentMapper.saveSellPatentDescription(description, patentId);
	}

	@Override
	public Map<String, Map<String, String>> getUserTransactionCountByPatentType(int userId) {
		return patentMapper.getUserTransactionCountByPatentType(userId);
	}

	@Override
	public Map<String, Map<String, String>> searchUserTransactionByTransactionStatus(int userId) {
		return patentMapper.searchUserTransactionByTransactionStatus(userId);
	}

	@Override
	public List<Patent> exportTransactionPatents(List<Long> patentIds) {

		return patentMapper.exportTransactionPatents(patentIds);
	}
	
	public void changeStatus(int status, int patentId) {
		patentMapper.changeStatus(status, patentId);
	}

	@Override
	public void batchChangeDescription(String description, List<Long> patentIds) {
		patentMapper.batchChangeDescription(description, patentIds);
	}
	
	@Override
	public void batchUpdatePatentField(int field, List<Long> patentIds) {
		patentMapper.batchUpdatePatentField(field, patentIds);
	}

	@Override
	public Patent getOverviewPatentByAppNo(String appNo,int userId) {
		return patentMapper.getOverviewPatentByAppNo(appNo,userId);
	}

	@Override
	public List<PatentRemark> getRemarkByUserIdAndAppNo(String appNo, int userId) {
		return patentMapper.getRemarkByUserIdAndAppNo(appNo, userId);
	}
	
	@Override
	public	SalePatentGood getTransactionOverview(String appNo,int userId) {
		return patentMapper.getTransactionOverview(appNo, userId);
	}

	public List<GoodsDetail> searchAllTransactionPatentsByPage(TransactionPatentSearchCondition searchCondition) {
		return patentMapper.searchAllTransactionPatentsByPage(searchCondition);
	}

	@Override
	public int searchAllTransactionPatentsCount(TransactionPatentSearchCondition searchCondition) {
		return patentMapper.searchAllTransactionPatentsCount(searchCondition);
	}

	@Override
	public Map<String, Map<String, String>> getTraderUserTransactionCountByPatentType(
			TransactionPatentSearchCondition searchCondition) {
		return patentMapper.getTraderUserTransactionCountByPatentType(searchCondition);
	}

	@Override
	public Map<String, Map<String, String>> searchTraderUserTransactionByTransactionStatus(
			TransactionPatentSearchCondition searchCondition) {
		return patentMapper.searchTraderUserTransactionByTransactionStatus(searchCondition);
	}
	@Override
	public List<GoodsDetail> getAllUserTransactionPatents(Page page) {
		return patentMapper.getAllUserTransactionPatents(page);
	}

	@Override
	public int getAllUserTransactionPatentsCount() {
		return patentMapper.getAllUserTransactionPatentsCount();
	}

	@Override
	public Map<String, Map<String, String>> getTransactionCountByPatentType() {
		return patentMapper.getTransactionCountByPatentType();
	}

	@Override
	public Map<String, Map<String, String>> getTransactionByTransactionStatus() {
		return patentMapper.getTransactionByTransactionStatus();
	}

	@Override
	public List<Patent> getLOTUTPatentsByIds(int userId) {
		return patentMapper.getLOTUTPatentsByIds(userId);
	}

}
