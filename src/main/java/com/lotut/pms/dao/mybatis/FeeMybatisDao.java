package com.lotut.pms.dao.mybatis;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.FeeDao;
import com.lotut.pms.dao.mapper.FeeMapper;
import com.lotut.pms.domain.Fee;
import com.lotut.pms.domain.FeeSearchCondition;
import com.lotut.pms.domain.Page;

public class FeeMybatisDao extends SqlSessionDaoSupport implements FeeDao {
	private FeeMapper feeMapper;

	@Override
	public List<Fee> getUserMonitoredFees(int userId) {
		return feeMapper.getUserMonitoredFees(userId);
	}

	@Override
	public void updateFeesInvoiceTitle(List<Long> feeIdList, String invoiceTitle) {
		feeMapper.updateFeesInvoiceTitle(feeIdList, invoiceTitle);
	}
	

	@Override
	public List<Fee> getFeesByIds(List<Long> feeIdList) {
		return feeMapper.getFeesByIds(feeIdList);
	}

	public void setFeeMapper(FeeMapper feeMapper) {
		this.feeMapper = feeMapper;
	}
	
	public FeeMapper getFeeMapper() {
		return feeMapper;
	}

	@Override
	public List<Fee> searchUserMonitoredFees(FeeSearchCondition searchCondition) {
		return feeMapper.searchUserMonitoredFees(searchCondition);
	}

	@Override
	public void insertFees(List<Fee> fees) {
		feeMapper.insertFees(fees);
	}

	@Override
	public List<Fee> getFeesByPatentIds(List<Long> patentIds, int userId) {
		return feeMapper.getFeesByPatentIds(patentIds, userId);
	}
	/*
	 * 费用监控相关
	 * @see 
	 */
	

	@Override
	public void updateMonitorStatus(List<Long> feeIds, int monitorStatus) {
		feeMapper.updateMonitorStatus(feeIds, monitorStatus);
		
	}

	@Override
	public List<Fee> getFeesForPatent(long feeId, int userId) {
		
		return feeMapper.getFeesForPatent(feeId, userId);
	}
	
	//CS:deleteFees
		@Override
		public void deleteFees(List<Long> feeIdList, int userId) {
			feeMapper.deleteFees(feeIdList, userId);
		}

	//CS:分页	

		@Override
		public List<Fee> getUserMonitoredFeesByPage(Page page) {
			return feeMapper.getUserMonitoredFeesByPage(page);
		}
		
		/*@Override
		public List<Fee> getUserMonitoredFeesByPage(Page page,Integer dateTime) {
			return feeMapper.getUserMonitoredFeesByPage(page, dateTime);
		}*/
		
		@Override
		public int getUserMonitoredFeesCount(int userId) {
			return feeMapper.getUserMonitoredFeesCount(userId);
		}

		@Override
		public List<Fee> searchUserMonitoredFeesByPage(FeeSearchCondition searchCondition) {
			return feeMapper.searchMonitoredFeesByPage(searchCondition);
		}

		@Override
		public int searchUserMonitoredFeesCount(FeeSearchCondition searchCondition) {
			return feeMapper.searchUserMonitoredFeesCount(searchCondition);
		}

		@Override
		public int updateFeesStatus(List<Long> feeIdList, int status) {
			return feeMapper.updateFeesStatus(feeIdList, status);
		}

		@Override
		public Map<String, Map<String, String>> getMonitoredFeesByType(int userId) {
			return feeMapper.getMonitoredFeesByType(userId);
		}

		@Override
		public Map<String, Map<String, String>> getMonitoredFeesByStatus(int userId) {
			return feeMapper.getMonitoredFeesByStatus(userId);
		}

		@Override
		public Map<String, Map<String, String>> getMonitoredFeesByFeeType(int userId) {
			return feeMapper.getMonitoredFeesByFeeType(userId);
		}

		@Override
		public List<String> getFeeTypes(String appNo) {
			return feeMapper.getFeeTypes(appNo);
		}

		@Override
		public long saveFee(Fee fee) {
			return feeMapper.saveFee(fee);
		}

		@Override
		public long getFeeAllCountByUser(int userId) {
			return feeMapper.getFeeAllCountByUser(userId);
		}

		@Override
		public long getUnPaidCountByUser(int userId) {
			return feeMapper.getUnPaidCountByUser(userId);
		}

		@Override
		public List<Fee> getFeesForPatentId(long patentId) {
			return feeMapper.getFeesForPatentId(patentId);
		}

		@Override
		public Map<String, Long> getCountByDeadlinePayment(int userId) {
			return feeMapper.getCountByDeadlinePayment(userId);
		}

		@Override
		public void deleteUnmonitoredFeesByPatentIds(List<Long> patentIds, int userId) {
			feeMapper.deleteUnmonitoredFeesByPatentIds(patentIds, userId);
		}

		@Override
		public List<String> getFeeTypesByPatentType(int patentTypeId) {
			return feeMapper.getFeeTypesByPatentType(patentTypeId);
		}

		@Override
		public void insertUserFees(List<Map<String, Long>> userFeeRecords) {
			feeMapper.insertUserFees(userFeeRecords);
		}

		@Override
		public int getLastFeeId() {
			return feeMapper.getLastFeeId();
		}

		@Override
		public void insertFee(Fee fee) {
			 feeMapper.insertFee(fee);
		}
}
