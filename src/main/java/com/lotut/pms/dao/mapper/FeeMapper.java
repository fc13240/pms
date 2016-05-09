package com.lotut.pms.dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.Fee;
import com.lotut.pms.domain.FeeSearchCondition;
import com.lotut.pms.domain.Notice;
import com.lotut.pms.domain.NoticeSearchCondition;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.Patent;

public interface FeeMapper {
	
	//CS:分页
	List<Fee> getUserMonitoredFees(int userId);
	
	List<Fee> getUserMonitoredFeesByPage(Page page);
	
	int getUserMonitoredFeesCount(int userId);
	
	//CS:搜索分页
	
    int searchUserMonitoredFeesCount(FeeSearchCondition searchCondition);
	
	List<Fee> searchMonitoredFeesByPage(FeeSearchCondition searchCondition);
	
	
	
	void insertFees(List<Fee> fees);
	
	List<Fee> getFeesByIds(@Param("feeIdList")List<Long> feeIdList);
	
	List<Fee> getFeesByPatentIds(@Param("patentIds")List<Long> patentIds, @Param("userId")int userId);
	
	List<Fee> searchUserMonitoredFees(FeeSearchCondition searchCondition);
	
	void updateFeesInvoiceTitle(@Param("feeIdList")List<Long> feeIdList, @Param("invoiceTitle")String invoiceTitle);
	
	/*
	 * 费用监控相关
	 */
	List<Fee> getFeesForPatent(@Param("feeId")long feeId,@Param("userId")int userId);
	
	void updateMonitorStatus(@Param("feeIds")List<Long> feeIds,@Param("monitorStatus")int monitorStatus);
	
	//CS:deleteFees
	void deleteFees(@Param("feeIdList")List<Long> feeIdList, @Param("userId")int userId);

	int updateFeesStatus(@Param("feeIdList")List<Long> feeIdList, @Param("status")int status);
	
	@MapKey("patentType")
	Map<String,Map<String,String>> getMonitoredFeesByType(int userId);
	
	@MapKey("feePaymentStatus")
	Map<String,Map<String,String>> getMonitoredFeesByStatus(int userId);
	
	@MapKey("patentStatus")
	Map<String,Map<String,String>> getMonitoredFeesByFeeType(int userId);
	
	List<Fee> getFeesForPatentId(@Param("patentId")long patentId);
}
