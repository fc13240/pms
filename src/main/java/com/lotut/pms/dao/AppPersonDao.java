package com.lotut.pms.dao;

import java.util.List;

import com.lotut.pms.domain.AppPersonType;
import com.lotut.pms.domain.CommonAppPerson;

public interface AppPersonDao {
	void addAppPerson(CommonAppPerson commonAppPerson);
	List<AppPersonType>  getAppPersonTypes();
	List<CommonAppPerson> getAllAppPersonByUser(int userId) ;
	void updateAppPerson(CommonAppPerson AppPerson);
	CommonAppPerson getOneAppPersonById(int id);
	void deleteAppPersonById(int id);

	List<CommonAppPerson> getUserAppPersons(int userId);
	
	void addCommonAppPerson(CommonAppPerson CommonAppPerson);

}
