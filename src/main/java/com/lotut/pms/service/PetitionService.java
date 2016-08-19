package com.lotut.pms.service;

import java.util.List;

import com.lotut.pms.domain.CommonAppPerson;
import com.lotut.pms.domain.CommonInventor;

public interface PetitionService {
	List<CommonInventor> findInventorNameById(List<Long> inventorIds,int userId );
	
	List<CommonAppPerson> findAppPersonNameById(List<Integer> appPersonIds,int userId);
	
	void addCommonAppPerson(CommonAppPerson commonAppPerson);
}
