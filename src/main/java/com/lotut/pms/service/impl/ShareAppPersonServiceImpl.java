package com.lotut.pms.service.impl;

import java.util.List;
import java.util.Map;

import com.lotut.pms.dao.ShareAppPersonDao;
import com.lotut.pms.service.ShareAppPersonService;

public class ShareAppPersonServiceImpl implements ShareAppPersonService {
	private ShareAppPersonDao shareAppPersonDao;
	
	public ShareAppPersonServiceImpl(ShareAppPersonDao shareAppPersonDao){
		this.shareAppPersonDao=shareAppPersonDao;
	}
	

	@Override
	public void insertUserAppPersons(List<Map<String, Integer>> userAppPersonRecords) {
		// TODO Auto-generated method stub
		shareAppPersonDao.insertUserAppPersons(userAppPersonRecords);
	}

	@Override
	public void shareAppPersons(List<Map<String, Integer>> shareAppPersonRecords,
			List<Map<String, Integer>> userAppPersonRecords) {
		// TODO Auto-generated method stub
		shareAppPersonDao.shareAppPersons(shareAppPersonRecords, userAppPersonRecords);
	}

}
