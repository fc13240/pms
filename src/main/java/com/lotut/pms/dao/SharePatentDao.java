package com.lotut.pms.dao;

import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.SharePatent;

public interface SharePatentDao {
	List<SharePatent> getUserSharedPatents(int userId);
	
	List<SharePatent> getFriendsSharedPatents(int userId);
	
	void insertSharePatents(List<Map<String, Integer>> sharePatentRecords, List<Map<String, Integer>> userPatentRecords);
	
	void insertUserPatents(List<Map<String, Integer>> userPatentRecords);
}
