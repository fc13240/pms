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

	List<CommonAppPerson> getUserAppPersons(int userId);

	
<<<<<<< HEAD
	List<CommonAppPerson> getAppPersonByName(String appPerson,int userId);
=======
	List<CommonAppPerson> getAppPersonByName(String appPerson);

>>>>>>> 873ed05ffa0c6cefc5b6da50ed50971790d8e800
}
