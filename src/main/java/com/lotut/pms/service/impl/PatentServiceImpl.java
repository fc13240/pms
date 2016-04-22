package com.lotut.pms.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.lotut.pms.dao.PatentDao;
import com.lotut.pms.dao.SharePatentDao;
import com.lotut.pms.domain.GoodsFirstColumn;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.Patent;
import com.lotut.pms.domain.PatentSearchCondition;
import com.lotut.pms.domain.PatentStatus;
import com.lotut.pms.domain.PatentType;
import com.lotut.pms.service.PatentService;
import com.lotut.pms.service.utils.PatentExcelParser;

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
	@Transactional
	public void uploadPatents(InputStream is) throws IOException {
		List<Patent> patents = PatentExcelParser.parsePatentFile(is);
		for (Patent patent: patents) {
			patentDao.insertOrUpdatePatent(patent);
		}
		
		List<Map<String, Integer>> userPatentList = new ArrayList<>();
		for (Patent patent: patents) {
			boolean isNewPatent = patent.getPatentId() != 0;
			if (isNewPatent) {
				HashMap<String, Integer> userPatentMap = new HashMap<>();
				userPatentMap.put("user", patent.getOwnerId());
				userPatentMap.put("patent", (int) patent.getPatentId());
				userPatentList.add(userPatentMap);
			}
		}
		
		if (userPatentList.size() > 0) {
			sharePatentDao.insertUserPatents(userPatentList);
		}
	}

	@Override
	public List<GoodsFirstColumn> getFirstColumn() {
		// TODO Auto-generated method stub
		return  patentDao.getFirstColumn();
	}
}
