package com.lotut.pms.dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.SharePatent;

public interface SharePatentMapper {
	List<SharePatent> getUserSharedPatents(int userId);
	
	List<SharePatent> getFriendsSharedPatents(int userId);
	
	void insertSharePatents(List<Map<String, Integer>> sharePatentRecords);
	
	void insertUserPatents(List<Map<String, Integer>> userPatentRecords);
	
	void deletePatentShare(@Param(value="userId")int userId, @Param(value="patentId")int patentId);
}
