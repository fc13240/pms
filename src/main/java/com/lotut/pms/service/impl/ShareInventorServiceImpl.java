package com.lotut.pms.service.impl;

import java.util.List;
import java.util.Map;

import com.lotut.pms.dao.ShareInventorDao;
import com.lotut.pms.service.ShareInventorService;

public class ShareInventorServiceImpl implements ShareInventorService{
	private ShareInventorDao shareInventorDao;
	
	public ShareInventorServiceImpl(ShareInventorDao shareInventorDao){
		this.shareInventorDao=shareInventorDao;
	}
	@Override
	public void insertUserInventors(List<Map<String, Integer>> userInventorRecords) {
		shareInventorDao.insertUserInventors(userInventorRecords);
		
	}

}
