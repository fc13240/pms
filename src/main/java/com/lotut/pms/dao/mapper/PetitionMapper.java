package com.lotut.pms.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.CommonAppPerson;
import com.lotut.pms.domain.CommonInventor;

public interface PetitionMapper {
	
	List<CommonAppPerson> findAppPersonNameById(@Param("appPersonIds") List<Integer> appPersonIds,@Param("userId") int userId);
	
	List<CommonInventor> findInventorNameById(@Param("inventorIds") List<Long> inventorIds, @Param("userId") int userId );
}
