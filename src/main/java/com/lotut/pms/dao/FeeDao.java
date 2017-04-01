package com.lotut.pms.dao;

import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.Fee;
import com.lotut.pms.domain.FeeSearchCondition;
import com.lotut.pms.domain.Page;

public interface FeeDao {
	
	//CS:分页
	List<Fee> getUserMonitoredFees(int userId);
	
	List<Fee> getUserMonitoredFeesByPage(Page page);
	
	int getUserMonitoredFeesCount(int userId);
	
	
	
	//CS:搜索分页
	List<Fee> searchUserMonitoredFees(FeeSearchCondition searchCondition);
	
	List<Fee> searchUserMonitoredFeesByPage(FeeSearchCondition searchCondition);
	
	int searchUserMonitoredFeesCount(FeeSearchCondition searchCondition);
	
	
	
	
	List<Fee> getFeesByIds(List<Long> feeIdList);
	
	List<Fee> getFeesByPatentIds(List<Long> patentIds, int userId);
	
	void insertFees(List<Fee> fees);
	
	void updateFeesInvoiceTitle(List<Long> feeIdList, String invoiceTitle);
	/*
	 * 费用监控
	 */
	//List<Fee> getFeesByFeeIds(List<Long> feeIds);
	void updateMonitorStatus(List<Long> feeIds,int monitorStatus);
	
	List<Fee> getFeesForPatent(long feeId,int userId);
	
	//CS:deleteFees
	void deleteFees(List<Long> feeIdList, int userId);
	
	
	int updateFeesStatus(List<Long> feeIdList, int status);
	
	Map<String,Map<String,String>> getMonitoredFeesByType(int userId);
	
	Map<String,Map<String,String>> getMonitoredFeesByStatus(int userId);
	
	Map<String,Map<String,String>> getMonitoredFeesByFeeType(int userId);
	
	List<Fee> getFeesForPatentId(long patentId);
	
	long getFeeAllCountByUser(int userId);
	
	long getUnPaidCountByUser(int userId);

	List<String> getFeeTypes(String appNo);
	
	long saveFee (Fee fee);
	
	Map<String,Long> getCountByDeadlinePayment(int userId);
	
	void deleteUnmonitoredFeesByPatentIds(List<Long> patentIds, int userId);

	List<String> getFeeTypesByPatentType(int patentTypeId);
	
	void insertUserFees(List<Map<String, Long>> userFeeRecords);
	
	int getLastFeeId();
	
	void insertFee(Fee fee);

	void saveUserFee(int userId, long feeId);
	
	long getFeeIdByUniqueKey(Fee fee);
}
