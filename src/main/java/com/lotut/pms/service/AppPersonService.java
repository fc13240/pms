package com.lotut.pms.service;

import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.CommonAppPerson;
import com.lotut.pms.domain.UserAppPerson;

public interface AppPersonService {
	void addAppPerson(CommonAppPerson commonAppPerson);

	List<CommonAppPerson> getAllAppPersonByUser(int userId);

	CommonAppPerson getOneAppPersonById(int id);

	void updateAppPerson(CommonAppPerson AppPerson);

	void deleteAppPersonById(int id);

	List<CommonAppPerson> getUserAppPersons(int userId);

	void saveAttachmentFile(CommonAppPerson AppPerson);

	String getAppPersonUrlById(int id);

	void addCommonAppPerson(CommonAppPerson CommonAppPerson);

	void saveProxyFile(CommonAppPerson AppPerson);

	String getProxyUrlById(int id);

	void deleteAttachmentFileById(int id);

	void addUserAppPerson(UserAppPerson userAppPerson);

	Integer getIdbyAppPerson(CommonAppPerson commonAppPerson);

	void deleteUserAppPersonbyId(UserAppPerson userAppPerson);

	void updateAppPersonUserIdNull(CommonAppPerson commonAppPerson);
	
	void insertUserAppPersons(List<Map<String, Integer>> userAppPersonRecords);
}
