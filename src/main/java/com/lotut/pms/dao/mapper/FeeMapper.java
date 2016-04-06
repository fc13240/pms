package com.lotut.pms.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.Fee;
import com.lotut.pms.domain.FeeSearchCondition;

public interface FeeMapper {
	List<Fee> getUserMonitoredFees(int userId);
	
	void insertFees(List<Fee> fees);
	
	List<Fee> getFeesByIds(@Param("feeIdList")List<Long> feeIdList);
	
	List<Fee> getFeesByPatentIds(@Param("patentIds")List<Long> patentIds, @Param("userId")int userId);
	
	List<Fee> searchUserMonitoredFees(FeeSearchCondition searchCondition);
	
	void updateFeesInvoiceTitle(@Param("feeIdList")List<Long> feeIdList, @Param("invoiceTitle")String invoiceTitle);
	
	/*
	 * 费用监控相关
	 */
	List<Fee> getFeesForPatent(@Param("feeId")long feeId,@Param("userId")int userId);
	
	void updateMonitStatus(@Param("feeIds")List<Long> feeIds,@Param("monitorStatus")int monitorStatus);
	
	//CS:deleteFees
	void deleteFees(@Param("feeIdList")List<Long> feeIdList, @Param("userId")int userId);

	
}
