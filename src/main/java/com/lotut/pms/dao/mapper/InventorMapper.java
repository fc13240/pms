package com.lotut.pms.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.CommonInventor;

public interface InventorMapper {
	 void addInventor(CommonInventor inventor);
	 List<CommonInventor> getAllInventorsByUser(int id);
	 CommonInventor getInventorById(int id);
	 void updateById(CommonInventor inventor);
	 void deleteById(int id);
	 List<CommonInventor> getInventorByName(@Param("inventor") String inventor);
	 List<CommonInventor> getUserInventors(int userId);

}
