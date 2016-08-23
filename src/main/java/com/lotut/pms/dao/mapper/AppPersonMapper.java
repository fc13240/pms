package com.lotut.pms.dao.mapper;

import java.util.List;

import com.lotut.pms.domain.AppPersonType;
import com.lotut.pms.domain.CommonAppPerson;
import com.lotut.pms.domain.UserAppPerson;



public interface AppPersonMapper {
	void addAppPerson(CommonAppPerson commonAppPerson);
	List<AppPersonType>  getAppPersonTypes();
	List<CommonAppPerson> getAllAppPersonByUser(int useId) ;
	CommonAppPerson getOneAppPersonById(int id);
	void updateAppPerson(CommonAppPerson appPerson);
	void deleteAppPersonById(int id);
	List<CommonAppPerson> getUserAppPersons(int userId);
	void saveAttachmentFile(CommonAppPerson appPerson);
	String getAppPersonUrlById(int id);
	void addCommonAppPerson(CommonAppPerson commonAppPerson);
	void saveProxyFile(CommonAppPerson appPerson);
	String getProxyUrlById(int id);
	void deleteAttachmentFileById(int id);
	void deleteProxyFileById(int id);
	void addUserAppPerson(UserAppPerson userAppPerson);
	Integer getIdbyAppPerson(CommonAppPerson commonAppPerson);
}
