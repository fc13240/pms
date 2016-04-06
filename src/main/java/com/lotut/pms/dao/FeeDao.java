package com.lotut.pms.dao;

import java.util.List;

import com.lotut.pms.domain.Fee;
import com.lotut.pms.domain.FeeSearchCondition;

public interface FeeDao {
	List<Fee> getUserMonitoredFees(int userId);
	
	List<Fee> searchUserMonitoredFees(FeeSearchCondition searchCondition);
	
	List<Fee> getFeesByIds(List<Long> feeIdList);
	
	List<Fee> getFeesByPatentIds(List<Long> patentIds, int userId);
	
	void insertFees(List<Fee> fees);
	
	void updateFeesInvoiceTitle(List<Long> feeIdList, String invoiceTitle);
	/*
	 * 费用监控
	 */
	//List<Fee> getFeesByFeeIds(List<Long> feeIds);
	void updateMonitStatus(List<Long> feeIds,int monitorStatus);
	
	List<Fee> getFeesForPatent(long feeId,int userId);
	
	//CS:deleteFees
	void deleteFees(List<Long> feeIdList, int userId);

}
