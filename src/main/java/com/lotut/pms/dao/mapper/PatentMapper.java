package com.lotut.pms.dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.MapKey;
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
import com.lotut.pms.domain.SalePatentGood;
import com.lotut.pms.domain.TransactionPatentSearchCondition;

public interface PatentMapper {
	int getUserPatentCount(@Param("userId")int userId);
	
	List<Patent> getUserPatents(Page page);
	
	List<Patent> getUserPatentsByType(@Param("userId") int userId, @Param("patentType") int patentType);
	
	List<Patent> getUserPatentsByStatus(@Param("userId") int userId, @Param("patentStatus") int patentStatus);
	
	Patent getPatentById(long patentId);
	
	List<Patent> getPatentsByIds(@Param("patentIds")List<Long> patentIds);
	
	Patent getPatentByAppNoAndOwner(@Param("appNo")String appNo, @Param("ownerId")int ownerId);
	
	List<Integer> getUserPatentIdsByPage(Page page);
	
	List<Patent> searchUserPatents(@Param("searchCondtion")PatentSearchCondition searchCondtion);
	
	int searchUserPatentsCount(PatentSearchCondition searchCondition);
	
	List<Patent> searchUserPatentsByPage(PatentSearchCondition searchCondtion);
	
	List<PatentType> getAllPatentTypes();
	
	List<PatentStatus> getAllPatentStatus();
	
	void updateInternalCode(@Param("patentId") int patentId, @Param("internalCode") String internalCode);
	
	long insertOrUpdatePatent(Patent patent);
	
	void insertPatent(Patent patent);
	
	void updatePatent(Patent patent);

	List<GoodsFirstColumn> getFirstColumn();

	List<GoodsSecondColumn> getSecondColumn(int firstColumnId);

	void saveGoods(GoodsDetail goodsDetail);
	
	void addPatent(Patent patent);
	
	@MapKey("patentType")
	Map<String, Map<String, String>> getUserPatentCountByType(int userId);
	
	@MapKey("patentStatus")
	Map<String, Map<String, String>> searchUserPatentsByPatentStatus(int userId);
	
	List<Patent> getUserPatentsWithFee(@Param("userId")int userId);
	
	Patent getPatentsByAppNo(@Param("userId") Integer user_id, @Param("appNo")String appNo);
	
	Long getPatentIdByAppNo(@Param("userId") Integer user_id,@Param("appNo")String appNo);
	
	List<GoodsDetail> getUserTransactionPatents(Page page);
	
	int getUserTransactionPatentsCount(@Param("userId")int userId);
	
	List<GoodsDetail> searchTransactionPatentsByPage(TransactionPatentSearchCondition searchCondition);
	
	int searchTransactionPatentsCount(TransactionPatentSearchCondition searchCondition);
	
	void downTransactionPatent(int patentId);

	void upTransactionPatent(int patentId);

	void deleteTransactionPatent(int patentId);

	void patentsTrash(@Param("patentIds")List<Long> patentIds,@Param("userId")int userId);
	
	List<Patent> getPatentsRecycled(Page page);
	
	int getPatentsRecycledCount(@Param("userId")int userId);
	
	void recoverPatents(@Param("patentIds")List<Long> patentIds,@Param("userId")int userId );
	
	void deleteForeverPatents(@Param("patentIds")List<Long> patentIds,@Param("userId")int userId);
	
	List<Patent> getUserPatentsByCreateTime(Page page);
	
	void batchSaveGoods(@Param("patentIds")List<Long> patentIds,@Param("userId")int userId,@Param("transferor")String transferor);
	
	void updatePatentsGoodsStatus(@Param("patentIds")List<Long> patentIds);
	
	void updateGoodPatents(@Param("price")int price,@Param("SecondColumn")int SecondColumn,@Param("patentId")int patentId);
	
	void changePrice(@Param("price")int price,@Param("patentId")int patentId);
	
	void changeStatus(@Param("status")int status,@Param("patentId")int patentId);
	
	void changSecondColume(@Param("SecondColumn")int SecondColumn,@Param("patentId")int patentId);
	
	void batchChangePrice(@Param("price")int price,@Param("patentIds")List<Long> patentIds);

	int bacthsaveGoodsCheckOut(@Param("patentIds")List<Long> patentIds);
	
	List<PatentRemark> getPatentRemarks(long patentId);
	
	void addPatentRemark(@Param("patentId")long patentId,@Param("content")String content,@Param("userId")int userId);
	
	Patent showPatentDetail(long patentId);
	
	boolean savePatentDetail(Patent patent);

	void deleteShareUser(@Param("patentId") long patentId, @Param("ownerId") int ownerId, @Param("shareUserId") int shareUserId);

	List<Integer> getPatentDocShareUesrs(String internalCode);
	
	Long getPatentIdByInternalCode(@Param("internalCode")String internalCode,@Param("currentUserId")int currentUserId);
	
	//void savePatentShareUser(@Param("userIds") List<Integer> userIds,@Param("patentId") long patentId);
	
	void savePatentShareUser(@Param("userId") int userIds,@Param("patentId") long patentId);

	List<Patent> getUserPatentsByIds(@Param("patentIds")List<Long> patentIds);
	
	void updateDocumentStatusText(@Param("patentStatusText") String patentStatusText,@Param("internalCode") String internalCode);
	
	void updateDocumentStatus(@Param("patentStatus") int patentStatus,@Param("internalCode") String internalCode);

	void cancelRecommendPatent(long patentId);
	
	void recommendPatent(long patentId);
	
	void batchChangeTransferor(@Param("transferor")String transferor,@Param("patentIds")List<Long> patentIds);
	
	void saveSellPatentDescription(@Param("description") String description,@Param("patentId") int patentId);

	@MapKey("patentType")
	Map<String, Map<String, String>> getUserTransactionCountByPatentType(int userId);

	@MapKey("transactionStatus")
	Map<String, Map<String, String>> searchUserTransactionByTransactionStatus(int userId);
	
	List<Patent> exportTransactionPatents(@Param("patentIds") List<Long> patentIds);	
	
	void batchChangeDescription(@Param("description")String description,@Param("patentIds")List<Long> patentIds);
	
	void batchUpdatePatentField(@Param("field")int field,@Param("patentIds")List<Long> patentIds);

	Patent getOverviewPatentByAppNo(@Param("appNo")String appNo,@Param("userId") int userId);
	
	List<PatentRemark> getRemarkByUserIdAndAppNo(@Param("appNo") String appNo,@Param("userId") int userId);
	
	SalePatentGood getTransactionOverview(@Param("appNo") String appNo,@Param("userId") int userId);

	List<GoodsDetail>searchAllTransactionPatentsByPage(TransactionPatentSearchCondition searchCondition);
	
	int searchAllTransactionPatentsCount(TransactionPatentSearchCondition searchCondition);
	
	@MapKey("patentType")
	Map<String, Map<String, String>> getTraderUserTransactionCountByPatentType(TransactionPatentSearchCondition searchCondition);

	@MapKey("transactionStatus")
	Map<String, Map<String, String>> searchTraderUserTransactionByTransactionStatus(TransactionPatentSearchCondition searchCondition);
	
	List<GoodsDetail> getAllUserTransactionPatents(Page page);
	
	int getAllUserTransactionPatentsCount();
	
	@MapKey("patentType")
	Map<String, Map<String, String>> getTransactionCountByPatentType();
	
	@MapKey("transactionStatus")
	Map<String, Map<String, String>> getTransactionByTransactionStatus();
	
	List<Patent> getLOTUTPatentsByIds(int userId);
	
	List<Patent> getUserAnnualFeeMonitorPatents(Page page);
	
	int  getUserAnnualFeeMonitorPatentsCount(int userId);
	
	int isFeeMonitorPatents(@Param("userId") int userId,@Param("patentIds")List<Long> patentIds);
	
	void batchAddFeeMonitorPatents(@Param("userId") int userId,@Param("patentIds")List<Long> patentIds);
	
	void batchCancelFeeMonitorPatents(@Param("userId") int userId,@Param("patentIds")List<Long> patentIds);
	
	List<Patent> searchUserAnnualFeeMonitorPatents(PatentSearchCondition searchCondition);
	
	int searchUserAnnualFeeMonitorPatentsCount(PatentSearchCondition searchCondition);

	List<Patent> SearchPatentsRecycled(PatentSearchCondition searchCondition);
	
	int SearchPatentsRecycledCount(PatentSearchCondition searchCondition);
	
	List<Map<String,String>> getAppPersonCountByAppPerson(int userId);
	
}
