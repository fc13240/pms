package com.lotut.pms.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.lotut.pms.constants.Settings;
import com.lotut.pms.dao.PatentDao;
import com.lotut.pms.dao.SharePatentDao;
import com.lotut.pms.domain.Fee;
import com.lotut.pms.domain.GoodsDetail;
import com.lotut.pms.domain.GoodsFirstColumn;
import com.lotut.pms.domain.GoodsSecondColumn;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.Patent;
import com.lotut.pms.domain.PatentRemark;
import com.lotut.pms.domain.PatentSearchCondition;
import com.lotut.pms.domain.PatentStatus;
import com.lotut.pms.domain.PatentType;
import com.lotut.pms.domain.TransactionPatentSearchCondition;
import com.lotut.pms.service.PatentService;
import com.lotut.pms.service.utils.PatentExcelGenerator;
import com.lotut.pms.service.utils.PatentExcelParser;
import com.lotut.pms.service.utils.PatentFeeExcelGenerator;

public class PatentServiceImpl implements PatentService {
	private PatentDao patentDao;
	private SharePatentDao sharePatentDao;
	
	public PatentServiceImpl(PatentDao patentDao, SharePatentDao sharePatentDao) {
		this.patentDao = patentDao;
		this.sharePatentDao = sharePatentDao;
	}
	
	/*
	 * 专利分页相关
	 */
	public long getPatentsCount(int userId){
		return patentDao.getUserPatentCount(userId);
	}
	@Override
	public List<Patent> getUserPatents(Page page) {
		return patentDao.getUserPatents(page);
	}
	
	@Override
	public List<Patent> getUserPatentsByType(int userId, int patentType) {
		return patentDao.getUserPatentsByType(userId, patentType);
	}	
	
	@Override
	public List<Patent> getUserPatentsByStatus(int userId, int patentStatus) {
		return patentDao.getUserPatentsByStatus(userId, patentStatus);
	}	
	
	@Override
	public Patent getPatentDetail(long patentId) {
		return patentDao.getPatentById(patentId);
	}
	
	@Override
	public List<Patent> searchUserPatents(PatentSearchCondition searchCondition) {
		return patentDao.searchUserPatents(searchCondition);
	}
	//搜索专利分页
	@Override
	public long searchUserPatentsCount(PatentSearchCondition searchCondition){
		return patentDao.searchUserPatentsCount(searchCondition);
	}
	
	@Override
	public List<Patent> searchUserPatentsWithPage(PatentSearchCondition searchCondition) {
		return patentDao.searchUserPatentsByPage(searchCondition);
	}
	
	@Override
	public List<PatentType> getAllPatentTypes() {
		return patentDao.getAllPatentTypes();
	}
	
	@Override
	public List<PatentStatus> getAllPatentStatus() {
		return patentDao.getAllPatentStatus();
	}

	@Override
	@Transactional
	public void changeInternalCode(int patentId, String internalCode) {
		patentDao.updateInternalCode(patentId, internalCode);
	}

	@Override
	public boolean  uploadPatents(InputStream is,int userId) throws IOException {
		List<Patent> patents = PatentExcelParser.parsePatentFile(is,userId);
		return addOrUpdatePatents(patents, userId);
	}
	
	@Override
	@Transactional
	public boolean  addOrUpdatePatents(List<Patent> patents,int userId) {
		for (Patent patent: patents) {
			 patentDao.insertOrUpdatePatent(patent);
		}
		List<Map<String, Integer>> userPatentList = new ArrayList<>();
		for (Patent patent: patents) {
			boolean isNewPatent = patent.getPatentId() != 0;
			if (isNewPatent) {
				HashMap<String, Integer> userPatentMap = new HashMap<>();
				userPatentMap.put("user", userId);
				userPatentMap.put("patent", (int)patent.getPatentId());
				userPatentList.add(userPatentMap);
			}else{
				Patent oldPatent=patentDao.getPatentByAppNoAndOwner(patent.getAppNo(),patent.getOwnerId());
				HashMap<String, Integer> userPatentMap = new HashMap<>();
				userPatentMap.put("user", userId);
				userPatentMap.put("patent", (int)oldPatent.getPatentId());
				userPatentList.add(userPatentMap);
			}
		}
		if (userPatentList.size() > 0) {
			sharePatentDao.insertUserPatents(userPatentList);
		}
		return true;
	}

	@Override
	public List<GoodsFirstColumn> getFirstColumn() {
		
		return  patentDao.getFirstColumn();
	}

	@Override
	public List<GoodsSecondColumn> getSecondColumn(int firstColumnId) {
		
		return  patentDao.getSecondColumn(firstColumnId);
	}

	@Override
	public void saveGoods(GoodsDetail goodsDetail) {
		
		patentDao.saveGoods(goodsDetail);
	}

	@Override
	@Transactional
	public void addPatent(Patent patent) {
		patentDao.insertOrUpdatePatent(patent);
		long patentId = patent.getPatentId();
		boolean isNewPatent = patentId != 0;
		if (isNewPatent) {
			List<Map<String, Integer>> userPatentList = new ArrayList<>();
			HashMap<String, Integer> userPatentMap = new HashMap<>();
			userPatentMap.put("user", patent.getOwnerId());
			userPatentMap.put("patent", (int) patentId);
			userPatentList.add(userPatentMap);
			sharePatentDao.insertUserPatents(userPatentList);
		}
	}

	@Override
	public Map<String, Map<String, String>> getUserPatentCountByType(int userId) {
		return patentDao.getUserPatentCountByType(userId);
	}

	@Override
	public Map<String, Map<String, String>> searchUserPatentsByPatentStatus(int userId) {
		return patentDao.searchUserPatentsByPatentStatus(userId);
	}

	@Override
	public List<Patent> getUserPatentsWithFee(int userId) {
		return patentDao.getUserPatentsWithFee(userId);
	}

	@Override
	public Patent getPatentsByAppNo(Integer userId,String appNo) {
		return patentDao.getPatentsByAppNo(userId,appNo);
	}

	@Override
	public Long getPatentIdByAppNo(Integer userId,String appNo) {
		return patentDao.getPatentIdByAppNo(userId,appNo);
	}

	@Override
	public void autoUpdatePatents(InputStream is,int userId) throws IOException {
		List<Patent> patents = PatentExcelParser.parsePatentFile(is,userId);
		addOrUpdatePatents(patents, userId);
	}

//	@Override
//	public String generatePatentExportExcel(List<Long> patentIds,String excelName) throws IOException {
//		List<Patent> patents=patentDao.getPatentsByIds(patentIds);
//		String exportExcelPath=Settings.TEMP_DIR+excelName;
//		PatentExcelGenerator.writerPatentRecodesToExcel(patents, exportExcelPath);
//		return exportExcelPath;
//	}

	@Override
	public List<GoodsDetail> getUserTransactionPatents(Page page) {
		return patentDao.getUserTransactionPatents(page);
	}

	@Override
	public int getUserTransactionPatentsCount(int userId) {
		return patentDao.getUserTransactionPatentsCount(userId);
	}

	@Override
	public List<GoodsDetail> searchTransactionPatentsByPage(TransactionPatentSearchCondition searchCondition) {
		return patentDao.searchTransactionPatentsByPage(searchCondition);
	}

	@Override
	public int searchTransactionPatentsCount(TransactionPatentSearchCondition searchCondition) {
		return patentDao.searchTransactionPatentsCount(searchCondition);
	}
	public void downTransactionPatent(int patentId) {
		patentDao.downTransactionPatent(patentId);
	}

	@Override
	public void upTransactionPatent(int patentId) {
		patentDao.upTransactionPatent(patentId);
	}

	@Override
	public void deleteTransactionPatent(int patentId) {
		patentDao.deleteTransactionPatent(patentId);
	}

	@Override
	public void patentsTrash(List<Long> patentIds,int userId) {
		patentDao.patentsTrash(patentIds,userId);
		
	}

	@Override
	public List<Patent> getPatentsRecycled(Page page) {
		return patentDao.getPatentsRecycled(page);
	}

	@Override
	public int getPatentsRecycledCount(int userId) {
		return patentDao.getPatentsRecycledCount(userId);
	}

	@Override
	public void recoverPatents(List<Long> patentIds, int userId) {
		patentDao.recoverPatents(patentIds, userId);
		
	}

	@Override
	public void deleteForeverPatents(List<Long> patentIds, int userId) {
		patentDao.deleteForeverPatents(patentIds, userId);
	}

	@Override
	public List<Patent> getUserPatentsByCreateTime(Page page) {
		return patentDao.getUserPatentsByCreateTime(page);
	}

	@Override
	public void batchSaveGoods(List<Long> patentIds, int userId) {
		patentDao.batchSaveGoods(patentIds, userId);
		
	}

	@Override
	public void updatePatentsGoodsStatus(List<Long> patentIds) {
		patentDao.updatePatentsGoodsStatus(patentIds);
		
	}

	@Override
	public void updateGoodPatents(int price, int SecondColumn, int patentId) {
		patentDao.updateGoodPatents(price, SecondColumn, patentId);
	}

	@Override
	public void changePrice(int price, int patentId) {
		patentDao.changePrice(price, patentId);
		
	}

	@Override
	public void changSecondColume(int SecondColumn, int patentId) {
		patentDao.changSecondColume(SecondColumn, patentId);
	}

	@Override
	public void batchChangePrice(int price, List<Long> patentIds) {
		patentDao.batchChangePrice(price, patentIds);
	}
	public boolean bacthsaveGoodsCheckOut(List<Long> patentIds) {
		int findPatentSize = patentDao.bacthsaveGoodsCheckOut(patentIds);
		if(findPatentSize>0){
			return true;
		}else {
			
			return false;
		}

	}

	@Override
	public List<PatentRemark> getPatentRemarks(long patentId) {
		return patentDao.getPatentRemarks(patentId);
	}

	@Override
	public void addPatentRemark(long patentId, String content,int userId) {
		
		 patentDao.addPatentRemark(patentId,content,userId);
	}

	@Override
	public Patent showPatentDetail(long patentId) {
		
		return  patentDao.showPatentDetail(patentId);
	}

	@Override
	public boolean savePatentDetail(Patent patent) {
		
		return patentDao.savePatentDetail(patent);
	}

	@Override
	@Transactional
	public void deleteShareUser(long patentId, int ownerId, int shareUserId) {
		
		 patentDao.deleteShareUser(patentId,ownerId,shareUserId);
	}

	@Override
	public String patentExportExcel(List<Long> patentIds, String exportExcelName) throws IOException {
		List<Patent> patents = patentDao.getUserPatentsByIds(patentIds);
		String exportExcelPath=Settings.TEMP_DIR+exportExcelName;
		PatentExcelGenerator.writePatentRecordsToExcel(patents, exportExcelPath);
		return exportExcelPath;
	}
	
	@Override
	public String patentTransactionExportExcel(List<Long> patentIds, String exportExcelName) throws IOException {
		List<Patent> patents = patentDao.exportTransactionPatents(patentIds);
		String exportExcelPath=Settings.TEMP_DIR+exportExcelName;
		PatentExcelGenerator.writeTransactionPatentRecordsToExcel(patents, exportExcelPath);
		return exportExcelPath;
	}	

	@Override
	public void cancelRecommendPatent(long patentId) {
		patentDao.cancelRecommendPatent(patentId);
		
	}

	@Override
	public void recommendPatent(long patentId) {
		patentDao.recommendPatent(patentId);
		
	}

	@Override
	public void batchChangeTransferor(String transferor, List<Long> patentIds) {
		patentDao.batchChangeTransferor(transferor, patentIds);
	}

	@Override
	public void saveSellPatentDescription(String description, int patentId) {
		patentDao.saveSellPatentDescription(description, patentId);
	}

	@Override
	public Map<String, Map<String, String>> getUserTransactionCountByPatentType(int userId) {
		return patentDao.getUserTransactionCountByPatentType(userId);
	}

	@Override
	public Map<String, Map<String, String>> searchUserTransactionByTransactionStatus(int userId) {
		return patentDao.searchUserTransactionByTransactionStatus(userId);
	}

	@Override
	public List<Patent> exportTransactionPatents(List<Long> patentIds) {
		return patentDao.exportTransactionPatents(patentIds);
	}
}
