package com.lotut.pms.service;

import java.util.List;

import com.lotut.pms.domain.AppPersonType;
import com.lotut.pms.domain.CommonAppPerson;

public interface AppPersonService {
	void addAppPerson(CommonAppPerson commonAppPerson);
	List<AppPersonType>  getAppPersonTypes();
	List<CommonAppPerson> getAllAppPersonByUser(int userId);
	CommonAppPerson getOneAppPersonById(int id);
	void updateAppPerson(CommonAppPerson AppPerson);
	void deleteAppPersonById(int id);

	List<CommonAppPerson> getUserAppPersons(int userId);
	
	void addCommonAppPerson(CommonAppPerson CommonAppPerson);

}
