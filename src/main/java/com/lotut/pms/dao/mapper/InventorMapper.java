package com.lotut.pms.dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.CommonInventor;
import com.lotut.pms.domain.InventorSearchCondition;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.UserInventor;

public interface InventorMapper {
	void addInventor(CommonInventor inventor);

	List<CommonInventor> getAllInventorsByUser(int id);

	CommonInventor getInventorById(int id);

	void updateById(CommonInventor inventor);

	void deleteById(int id);

	List<CommonInventor> getInventorByName(@Param("inventor") String inventor);

	List<CommonInventor> getUserInventors(Page page);
	
	int getUserInventorCount(int userId);

	List<CommonInventor> getInventorByName(@Param("inventor") String inventor, @Param("userId") int userId);

	void saveAttachmentFile(CommonInventor CommonInventor);

	String getInventorUrlById(int id);

	void addUserInventor(UserInventor userInventor);

	List<Integer> getIdByInventor(CommonInventor commonInventor);

	void deleteUserInventorById(UserInventor userInventor);
	
	void insertUserInventors(List<Map<String, Integer>> userInventorRecords);
	
	int searchInventorCount(InventorSearchCondition inventorSearchCondition);
	
	List<CommonInventor> searchInventorByPage(InventorSearchCondition inventorSearchCondition);

}
