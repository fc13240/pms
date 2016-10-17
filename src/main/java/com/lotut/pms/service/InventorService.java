package com.lotut.pms.service;

import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.CommonInventor;
import com.lotut.pms.domain.InventorSearchCondition;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.UserInventor;

public interface InventorService {
	void addInventor(CommonInventor inventor);

	List<CommonInventor> getAllInventorsByUser(int id);

	CommonInventor getInventorById(int id);

	void updateById(CommonInventor inventor);

	void deleteById(int id);

	List<CommonInventor> getUserInventors(Page page);

	List<CommonInventor> getInventor(String inventor);

	List<CommonInventor> getInventor(String inventor, int userId);

	void saveAttachmentFile(CommonInventor CommonInventor);

	String getInventorUrlById(int id);

	void addUserInventor(UserInventor userInventor);

	List<Integer> getIdByInventor(CommonInventor commonInventor);

	void deleteUserInventorById(UserInventor userInventor);
	
	void insertUserInventors(List<Map<String, Integer>> userInventorRecords);
	
	int getUserInventorCount(int userId);
	
	int searchInventorCount(InventorSearchCondition searchCondition);
	
	List<CommonInventor> searchInventorByPage(InventorSearchCondition searchCondition);
	

}
