package com.lotut.pms.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.GoodsDetail;
import com.lotut.pms.domain.GoodsFirstColumn;
import com.lotut.pms.domain.GoodsSecondColumn;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.Patent;
import com.lotut.pms.domain.PatentRemark;
import com.lotut.pms.domain.PatentSearchCondition;
import com.lotut.pms.domain.PatentStatus;
import com.lotut.pms.domain.PatentType;
import com.lotut.pms.domain.TransactionPatentSearchCondition;

public interface PatentDao {
	int getUserPatentCount(int userId);
	List<Patent> getUserPatents(Page page);
	
	List<Patent> getUserPatentsByType(int userId, int patentType);
	
	List<Patent> getUserPatentsByStatus(int userId, int patentStatus);
	
	Patent getPatentById(long patentId);
	
	List<Patent> getPatentsByIds(List<Long> patentIds);
	
	Patent getPatentByAppNoAndOwner(String appNo, int ownerId);
	
	List<Patent> searchUserPatents(PatentSearchCondition searchCondition);
	//搜索分页
	int searchUserPatentsCount(PatentSearchCondition searchCondition);
	
	List<Patent> searchUserPatentsByPage(PatentSearchCondition searchCondition);
	
	List<PatentType> getAllPatentTypes();
	
	List<PatentStatus> getAllPatentStatus();
	
	void updateInternalCode(int patentId, String internalCode);
	
	void insertOrUpdatePatent(Patent patent);
	void insertPatent(Patent patent);
	
	void updatePatent(Patent patent);
	List<GoodsFirstColumn> getFirstColumn();
	List<GoodsSecondColumn> getSecondColumn(int firstColumnId);
	void saveGoods(GoodsDetail goodsDetail);
	
	void addPatent(Patent patent);
	
	Map<String, Map<String, String>> getUserPatentCountByType(int userId);
	
	Map<String, Map<String, String>> searchUserPatentsByPatentStatus(int userId);
	
	List<Patent> getUserPatentsWithFee(int userId);
	
	Patent getPatentsByAppNo(Integer userId,String appNo);
	
	long getPatentIdByAppNo(Integer userId,String appNo);
	
	List<GoodsDetail> getUserTransactionPatents(Page page);
	
	int getUserTransactionPatentsCount(int userId);
	
	List<GoodsDetail> searchTransactionPatentsByPage(TransactionPatentSearchCondition searchCondition);
	
	int searchTransactionPatentsCount(TransactionPatentSearchCondition searchCondition);

	void downTransactionPatent(int patentId);
	void upTransactionPatent(int patentId);
	void deleteTransactionPatent(int patentId);
	
	void patentsTrash(List<Long> patentIds,int userId);
	
	List<Patent> getPatentsRecycled(Page page);
	
	int getPatentsRecycledCount(int userId);
	
	void recoverPatents(List<Long> patentIds,int userId );
	
	void deleteForeverPatents(List<Long> patentIds,int userId);
	
	List<Patent> getUserPatentsByCreateTime(Page page);
	
	void batchSaveGoods(List<Long> patentIds,int userId);
	
	void updatePatentsGoodsStatus(List<Long> patentIds);
	
	void updateGoodPatents(int price,int SecondColumn,int patentId);
	

	void changePrice(int price,int patentId);
	
	void changSecondColume(int SecondColumn,int patentId);
	
	void batchChangePrice(int price,List<Long> patentIds);

	int bacthsaveGoodsCheckOut(List<Long> patentIds);
	
	List<PatentRemark> getPatentRemarks(long patentId);
	
	void addPatentRemark(long patentId,String content,int userId);

	Patent showPatentDetail(long patentId);
	
	boolean savePatentDetail(Patent patent);
}
