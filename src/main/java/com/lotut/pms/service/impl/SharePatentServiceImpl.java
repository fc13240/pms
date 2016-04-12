package com.lotut.pms.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.lotut.pms.dao.SharePatentDao;
import com.lotut.pms.domain.SharePatent;
import com.lotut.pms.service.SharePatentService;

public class SharePatentServiceImpl implements SharePatentService {
	private SharePatentDao sharePatentDao;
	
	public SharePatentServiceImpl(SharePatentDao sharePatentDao) {
		this.sharePatentDao = sharePatentDao;
	}

	@Override
	@Transactional
	public void sharePatents(List<Map<String, Integer>> sharePatentRecords,
			List<Map<String, Integer>> userPatentRecords) {
		sharePatentDao.insertSharePatents(sharePatentRecords, userPatentRecords);
	}

	@Override
	public List<SharePatent> getUserSharedPatents(int userId) {
		return sharePatentDao.getUserSharedPatents(userId);
	}

	@Override
	public List<SharePatent> getFriendsSharedPatents(int userId) {
		return sharePatentDao.getFriendsSharedPatents(userId);
	}
}
