package com.lotut.pms.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.Fee;
import com.lotut.pms.domain.FeeSearchCondition;

public interface FeeService {
	Map<String, List<?>> batchGrabFees(List<Long> patentIds);
	
	Map<String, Object> grabFees(long patentId);
	
	List<Fee> getUserMonitoredFees(int userId);
	
	List<Fee> searchUserMonitoredFees(FeeSearchCondition searchCondition);
	
	String generateFeeExportExcel(List<Long> feeIdList, String excelName)  throws IOException;
	
	void changeFeesInvoiceTitle(List<Long> feeIdList, String invoiceTitle);
	/*
	 * 费用监控
	 */
	List<Fee> changeMonitorStatus(List<Long> feeIds,int monitorStatus);
	
}
