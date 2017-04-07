package com.lotut.pms.service.impl;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.lotut.pms.constants.Settings;
import com.lotut.pms.dao.FeeDao;
import com.lotut.pms.dao.PatentDao;
import com.lotut.pms.domain.Fee;
import com.lotut.pms.domain.FeeSearchCondition;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.Patent;
import com.lotut.pms.domain.User;
import com.lotut.pms.service.FeeService;
import com.lotut.pms.service.utils.FeeCrawler;
import com.lotut.pms.service.utils.FeeExcelGenerator;
import com.lotut.pms.service.utils.PatentFeeExcelGenerator;
import com.lotut.pms.util.PrincipalUtils;

public class FeeServiceImpl implements FeeService {
	private FeeDao feeDao;
	private PatentDao patentDao;
	
	public FeeServiceImpl(FeeDao feeDao, PatentDao patentDao) {
		this.feeDao = feeDao;
		this.patentDao = patentDao;
	}

	@Override
	public List<Fee> getUserMonitoredFees(int userId) {
		return feeDao.getUserMonitoredFees(userId);
	}

	@Override
	@Transactional
	public void changeFeesInvoiceTitle(List<Long> feeIdList, String invoiceTitle) {
		feeDao.updateFeesInvoiceTitle(feeIdList, invoiceTitle);
	}

	@Override
	public String generateFeeExportExcel(List<Long> feeIdList, String excelName) throws IOException {
		List<Fee> fees = feeDao.getFeesByIds(feeIdList);
		String exportExcelPath = Settings.TEMP_DIR + excelName;
		FeeExcelGenerator.writeFeeRecordsToExcel(fees, exportExcelPath);
		return exportExcelPath;
	}
	
	@Override
	public String FeeExportExcel(List<Long> feeIdList, String excelName) throws IOException {
		List<Fee> fees = feeDao.getFeesByIds(feeIdList);
		String exportExcelPath=Settings.TEMP_DIR+excelName;
		PatentFeeExcelGenerator.writeFeeRecordsToExcel(fees, exportExcelPath);
		return exportExcelPath;
	}
	
	@Override
	public List<Fee> searchUserMonitoredFees(FeeSearchCondition searchCondition) {
		searchCondition.setUserId(PrincipalUtils.getCurrentUserId());
		return feeDao.searchUserMonitoredFees(searchCondition);
	}

	@Override
	public Map<String, List<?>> batchGrabFees(int hostPort,List<Long> patentIds) {
		feeDao.deleteUnmonitoredFeesByPatentIds(patentIds, PrincipalUtils.getCurrentUserId());
		Map<String, List<?>> grabResultMap = new HashMap<>();
		List<Patent> patents = patentDao.getPatentsByIds(patentIds);
		FeeCrawler crawler = new FeeCrawler(patents);
		crawler.grabFees(hostPort);
		Map<Patent, List<List<String>>> shouldPayRecordsMap = crawler.getShouldPayRecordsMap();
		List<Patent> failedPatents = crawler.getFailedPatents();
		List<Patent> emptyFeePatents = crawler.getEmptyFeePatents();
		grabResultMap.put("failedPatents", failedPatents);
		grabResultMap.put("emptyFeePatents", emptyFeePatents);
		getShouldPayRecords(shouldPayRecordsMap);
		int userId=PrincipalUtils.getCurrentUserId();
		List<Fee> resultFees = feeDao.getFeesByPatentIds(patentIds, userId);
		grabResultMap.put("fees", resultFees);
		
		return grabResultMap;
	}
	
	@Override
	@Transactional
	public Map<String, Object> grabFees(int hostPort,long patentId) {
		Map<String, Object> grabResultMap = new HashMap<>();
		List<Long> patentIds = new ArrayList<>();
		patentIds.add(patentId);
		feeDao.deleteUnmonitoredFeesByPatentIds(patentIds, PrincipalUtils.getCurrentUserId());
		List<Patent> patents = patentDao.getPatentsByIds(patentIds);
		FeeCrawler crawler = new FeeCrawler(patents);
		crawler.grabFees(hostPort);
		Map<Patent, List<List<String>>> shouldPayRecordsMap = crawler.getShouldPayRecordsMap();
		Map<Patent, List<List<String>>> paidRecordsMap = crawler.getPaidRecordsMap();
		getShouldPayRecords(shouldPayRecordsMap);
		List<Fee> resultFees = feeDao.getFeesByPatentIds(patentIds, PrincipalUtils.getCurrentUserId());
		grabResultMap.put("patent", patents.get(0));
		grabResultMap.put("fees", resultFees);
		grabResultMap.put("paidFees", paidRecordsMap.get(patents.get(0)));
		System.out.println(grabResultMap.values());
		return grabResultMap;
	}
	
	
	@Transactional
	private void getShouldPayRecords(Map<Patent, List<List<String>>> shouldPayRecordsMap) {
		List<Fee> fees = new ArrayList<>();
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		User user = PrincipalUtils.getCurrentPrincipal();
		int userId=user.getUserId();
		List<Long> feeIds=new ArrayList<>();
		try {
			for (Map.Entry<Patent, List<List<String>>> shouldPayRecords : shouldPayRecordsMap.entrySet()) {
				Patent patent = shouldPayRecords.getKey();

				List<List<String>> feeRecords = shouldPayRecords.getValue();
				for (List<String> feeRecord : feeRecords) {
					Fee fee = new Fee();
					fee.setPatent(patent);
					fee.setFeeType(feeRecord.get(0));
					fee.setAmount(Integer.valueOf(feeRecord.get(1)));
					fee.setDeadline(formatter.parse(feeRecord.get(2)));
					fee.setOwner(user);
					fees.add(fee);
					if(!fees.isEmpty()){
					feeDao.insertFee(fee);
					}
					if(fee.getFeeId()!=0){
						feeIds.add(fee.getFeeId());
					} else {
						long existFeeId = feeDao.getFeeIdByUniqueKey(fee);
						if (existFeeId != 0) {
							feeIds.add(existFeeId);
						}
					}
				}
			}
		} catch (ParseException e) {
			throw new RuntimeException(e);
		}
		if(!feeIds.isEmpty()){
		List<Map<String, Long>> userFeeRecords = new ArrayList<>();
		for (Long fee: feeIds) {
				Map<String, Long> userFeeRecord =  new HashMap<String, Long>();
				userFeeRecord.put("user", (long) userId);
				userFeeRecord.put("fee", fee);
				userFeeRecords.add(userFeeRecord);
			
		}
		
		feeDao.insertUserFees(userFeeRecords);
		}
	
	}
	
	/*
	 * 费用监控
	 */
	@Override
	@Transactional
	public List<Fee> changeMonitorStatus(List<Long> feeIds,int monitorStatus) {
		feeDao.updateMonitorStatus(feeIds,monitorStatus);
		int userId = PrincipalUtils.getCurrentUserId();
		List<Fee> fees = feeDao.getFeesForPatent(feeIds.get(0),userId);
		return fees;
	}
	
	/*
	 * 批量费用监控
	 */
	@Override
	@Transactional
	public List<Fee> batchChangeMonitorStatus(List<Long> feeIds,List<Long> patents,int monitorStatus) {
		feeDao.updateMonitorStatus(feeIds,monitorStatus);
		List<Fee> resultFees = feeDao.getFeesByPatentIds(patents, PrincipalUtils.getCurrentUserId());
		return resultFees;
	}
	//deleteFees
		@Override
		public void deleteFees(List<Long> feeIds, int userId) {
			feeDao.deleteFees(feeIds, userId);
		}
		
		
	//CS:分页	

		@Override
		public List<Fee> getUserMonitoredFeesByPage(Page page) {
			return feeDao.getUserMonitoredFeesByPage(page);
		}

	    @Override
	    public long getUserMonitoredFeesCounts(int userId) {
		    return feeDao.getUserMonitoredFeesCount(userId);
	    }

	    @Override
	    public long searchUserMonitoredFeesCount(FeeSearchCondition searchCondition) {
		    return feeDao.searchUserMonitoredFeesCount(searchCondition);
	    }

		@Override
		public List<Fee> searchUserMonitoredFeesByPage(FeeSearchCondition searchCondition) {
			return feeDao.searchUserMonitoredFeesByPage(searchCondition);
		}
		
		@Override
		public List<Fee> getFeesByIds(List<Long> feeIds) {
			return feeDao.getFeesByIds(feeIds);
		}

		@Override
		public int updateFeesStatus(List<Long> feeIdList, int status) {
			return feeDao.updateFeesStatus(feeIdList, status);
		}

		@Override
		public Map<String, Map<String, String>> getMonitoredFeesByType(int userId) {
			return feeDao.getMonitoredFeesByType(userId);
		}

		@Override
		public Map<String, Map<String, String>> getMonitoredFeesByStatus(int userId) {
			return feeDao.getMonitoredFeesByStatus(userId);
		}

		@Override
		public Map<String, Map<String, String>> getMonitoredFeesByFeeType(int userId) {
			return feeDao.getMonitoredFeesByFeeType(userId);
		}

		@Override
		public List<String> getFeeTypes(String appNo) {
			return feeDao.getFeeTypes(appNo);
		}

		@Override
		public long getFeeAllCountByUser(int userId) {
			return feeDao.getFeeAllCountByUser(userId);
		}

		@Override
		public long getUnPaidCountByUser(int userId) {
			return feeDao.getUnPaidCountByUser(userId);
		}
		
		@Override
		@Transactional
		public void saveFee(Fee fee) {
			feeDao.saveFee(fee);
			boolean isNewFee = fee.getFeeId() != 0;
			if(isNewFee) {
				feeDao.saveUserFee(fee.getOwner().getUserId(),fee.getFeeId());
			}
		}
		
		@Override
		public List<Fee> getFeesForPatentId(long patentId) {
			return feeDao.getFeesForPatentId(patentId);
		}

		@Override
		public Map<String, Long> getCountByDeadlinePayment(int userId) {
			return feeDao.getCountByDeadlinePayment(userId);
		}

		@Override
		public List<String> getFeeTypesByPatentType(int patentTypeId) {
			return feeDao.getFeeTypesByPatentType(patentTypeId);
		}

		@Override
		public void insertUserFees(List<Long> fees,List<Long> friendIds) {
			List<Map<String, Long>> userFeeRecords = new ArrayList<>();
			for (Long fee: fees) {
				for (Long friendId: friendIds) {
					Map<String, Long> userFeeRecord =  new HashMap<String, Long>();
					userFeeRecord.put("user", friendId);
					userFeeRecord.put("fee", fee);
					userFeeRecords.add(userFeeRecord);
				}
			}
			feeDao.insertUserFees(userFeeRecords);
		}

}
