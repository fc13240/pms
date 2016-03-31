package com.lotut.pms.service;

import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.SharePatent;

public interface SharePatentService {
	void sharePatents(List<Map<String, Integer>> sharePatentRecords, List<Map<String, Integer>> userPatentRecords);
	
	List<SharePatent> getUserSharedPatents(int userId);
	
	List<SharePatent> getFriendsSharedPatents(int userId);
}
