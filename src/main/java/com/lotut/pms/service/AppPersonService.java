package com.lotut.pms.service;

import java.util.List;

import com.lotut.pms.domain.CommonAppPerson;
import com.lotut.pms.domain.AppPersonType;

public interface AppPersonService {
	void addAppPerson(CommonAppPerson commonAppPerson);
	List<AppPersonType>  getAppPersonTypes();
	List<CommonAppPerson> getAllAppPersonByUser(int userId);
	CommonAppPerson getOneAppPersonById(int id);
	void updateAppPerson(CommonAppPerson AppPerson);
	void deleteAppPersonById(int id);
<<<<<<< HEAD
	List<CommonAppPerson> getUserAppPersons(int userId);
=======
	
	List<CommonAppPerson> getAppPersonByName(String appPerson);
>>>>>>> 11828c8b664468145c2208b258b9980c2fc85eac
}
