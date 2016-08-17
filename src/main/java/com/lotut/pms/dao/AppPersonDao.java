package com.lotut.pms.dao;

import java.util.List;

import com.lotut.pms.domain.CommonAppPerson;
import com.lotut.pms.domain.AppPersonType;

public interface AppPersonDao {
	void addAppPerson(CommonAppPerson commonAppPerson);
	List<AppPersonType>  getAppPersonTypes();
	List<CommonAppPerson> getAllAppPersonByUser(int userId) ;
	void updateAppPerson(CommonAppPerson AppPerson);
	CommonAppPerson getOneAppPersonById(int id);
	void deleteAppPersonById(int id);
<<<<<<< HEAD
	List<CommonAppPerson> getUserAppPersons(int userId);
=======
	
	List<CommonAppPerson> getAppPersonByName(String appPerson);
>>>>>>> 11828c8b664468145c2208b258b9980c2fc85eac
}
