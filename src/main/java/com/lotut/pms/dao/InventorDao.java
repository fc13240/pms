package com.lotut.pms.dao;

import java.util.List;

import com.lotut.pms.domain.CommonInventor;

public interface InventorDao {
	void addInventor(CommonInventor inventor);
	List<CommonInventor> getAllInventorsByUser(int id);
	CommonInventor getInventorById(int id);
	void updateById(CommonInventor inventor);
	 void deleteById(int id);
<<<<<<< HEAD
	 List<CommonInventor> getUserInventors(int userId);
	 List<CommonInventor> getInventorByName(String inventor);
=======
	 
	 List<CommonInventor> getInventorByName(String inventor,int userId);
>>>>>>> e291817510070760d64ed99f894cdb1267f785a4
}
