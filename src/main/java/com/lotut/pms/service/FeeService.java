package com.lotut.pms.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;


import com.lotut.pms.domain.Fee;
import com.lotut.pms.domain.FeeSearchCondition;
import com.lotut.pms.domain.Page;

public interface FeeService {
	Map<String, List<?>> batchGrabFees(List<Long> patentIds);
	
	Map<String, Object> grabFees(long patentId);
	
	//CS:分页
	List<Fee> getUserMonitoredFees(int userId);
	
	List<Fee> getUserMonitoredFeesByPage(Page page);
	

	
	long getUserMonitoredFeesCounts(int userId);
	
	
	//CS:搜索分页
	List<Fee> searchUserMonitoredFees(FeeSearchCondition searchCondition);
	
    long searchUserMonitoredFeesCount(FeeSearchCondition searchCondition);
	
    List<Fee> searchUserMonitoredFeesByPage(FeeSearchCondition searchCondition);
	
	String generateFeeExportExcel(List<Long> feeIdList, String excelName)  throws IOException;
	
	void changeFeesInvoiceTitle(List<Long> feeIdList, String invoiceTitle);
	/*
	 * 费用监控
	 */
	List<Fee> changeMonitorStatus(List<Long> feeIds,int monitorStatus);
	List<Fee> batchChangeMonitorStatus(List<Long> feeIds,List<Long> patents,int monitorStatus);
	//deleteFees
	void deleteFees(List<Long> feeIdList, int userId);
	
	List<Fee> getFeesByIds(List<Long> feeIds);
	
	int updateFeesStatus(List<Long> feeIdList, int status);
	
	Map<String,Map<String,String>> getMonitoredFeesByType(int userId);
	
	Map<String,Map<String,String>> getMonitoredFeesByStatus(int userId);
	
	Map<String,Map<String,String>> getMonitoredFeesByFeeType(int userId);
	
	List<Fee> getFeesForPatentId(long patentId);
	
	long getFeeAllCountByUser(int userId);
	
	long getUnPaidCountByUser(int userId);
	
	List<String> getFeeTypes(String appNo);
	
	void saveFee (Fee fee);
	
	Map<String,Long> getCountByDeadlinePayment(int userId);
	
	String FeeExportExcel(List<Long> feeIdList, String excelName)  throws IOException;
}
