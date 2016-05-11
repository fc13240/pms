package com.lotut.pms.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

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
	
	List<String> getFeeTypes(String appNo);
	
	void saveFee (Fee fee,int userId,long patentId);

}
