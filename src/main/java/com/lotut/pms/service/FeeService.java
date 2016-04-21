package com.lotut.pms.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.Fee;
import com.lotut.pms.domain.FeeSearchCondition;
import com.lotut.pms.domain.Notice;
import com.lotut.pms.domain.NoticeSearchCondition;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.Patent;

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
	//CS:deleteFees
	void deleteFees(List<Long> feeIdList, int userId);
	
	List<Fee> getFeesByIds(List<Long> feeIds);
	
	int updateFeesStatus(List<Long> feeIdList, int status);
}
