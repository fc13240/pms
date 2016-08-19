package com.lotut.pms.dao.mapper;

import java.util.List;

import com.lotut.pms.domain.AppPersonType;
import com.lotut.pms.domain.CommonAppPerson;



public interface AppPersonMapper {
	void addAppPerson(CommonAppPerson CommonAppPerson);
	List<AppPersonType>  getAppPersonTypes();
	List<CommonAppPerson> getAllAppPersonByUser(int useId) ;
	CommonAppPerson getOneAppPersonById(int id);
	void updateAppPerson(CommonAppPerson AppPerson);
	void deleteAppPersonById(int id);

	List<CommonAppPerson> getUserAppPersons(int userId);

	void saveAttachmentFile(CommonAppPerson AppPerson);
	String getAppPersonUrlById(int id);

	void addCommonAppPerson(CommonAppPerson CommonAppPerson);
}
