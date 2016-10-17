package com.lotut.pms.service;

import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.AppPersonSearchCondition;
import com.lotut.pms.domain.CommonAppPerson;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.UserAppPerson;

public interface AppPersonService {
	void addAppPerson(CommonAppPerson commonAppPerson);

	List<CommonAppPerson> getAllAppPersonByUser(int userId);

	CommonAppPerson getOneAppPersonById(int id);

	void updateAppPerson(CommonAppPerson AppPerson);

	void deleteAppPersonById(int id);

	List<CommonAppPerson> getUserAppPersons(Page page);

	void saveAttachmentFile(CommonAppPerson AppPerson);

	String getAppPersonUrlById(int id);

	void addCommonAppPerson(CommonAppPerson CommonAppPerson);

	void saveProxyFile(CommonAppPerson AppPerson);

	String getProxyUrlById(int id);

	void deleteAttachmentFileById(int id);

	void addUserAppPerson(UserAppPerson userAppPerson);

	List<Integer> getIdbyAppPerson(CommonAppPerson commonAppPerson);

	void deleteUserAppPersonbyId(UserAppPerson userAppPerson);

	void updateAppPersonUserIdNull(CommonAppPerson commonAppPerson);
	
	void insertUserAppPersons(List<Map<String, Integer>> userAppPersonRecords);
	
	List<CommonAppPerson> searchAppPersonByPage(AppPersonSearchCondition searchCondition);
	
	int searchAppPersonCount(AppPersonSearchCondition searchCondition);
	
	int getUserAppPersonCount(int userId);
	
	void addFeeRedurceAppPerson(CommonAppPerson commonAppPerson);
	
	List<CommonAppPerson> getFeeRedurceAppPersonList(Page page);
	List<CommonAppPerson> searchFeeRedurceAppPersonByPage(AppPersonSearchCondition searchCondition);
	
	int searchFeeRedurceAppPersonCount(AppPersonSearchCondition searchCondition);
	
	List<CommonAppPerson> searchFeeRedurceAppPersonForPlat(AppPersonSearchCondition searchCondition);
	
	int searchFeeRedurceAppPersonForPlatCount(AppPersonSearchCondition searchCondition);
}
