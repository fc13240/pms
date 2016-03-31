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
}
