package com.lotut.pms.dao.mapper;

import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.AppPersonSearchCondition;
import com.lotut.pms.domain.CommonAppPerson;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.UserAppPerson;

public interface AppPersonMapper {
	void addAppPerson(CommonAppPerson commonAppPerson);

	List<CommonAppPerson> getAllAppPersonByUser(int useId);

	CommonAppPerson getOneAppPersonById(int id);

	void updateAppPerson(CommonAppPerson appPerson);

	void deleteAppPersonById(int id);

	List<CommonAppPerson> getUserAppPersons(Page page);

	void saveAttachmentFile(CommonAppPerson appPerson);

	String getAppPersonUrlById(int id);

	void addCommonAppPerson(CommonAppPerson commonAppPerson);

	void saveProxyFile(CommonAppPerson appPerson);

	String getProxyUrlById(int id);

	void deleteAttachmentFileById(int id);

	void deleteProxyFileById(int id);

	void addUserAppPerson(UserAppPerson userAppPerson);

	List<Integer> getIdbyAppPerson(CommonAppPerson commonAppPerson);

	void deleteUserAppPersonbyId(UserAppPerson userAppPerson);
	
	void updateAppPersonUserIdNull(CommonAppPerson commonAppPerson);
	
	void insertUserAppPersons(List<Map<String, Integer>> userAppPersonRecords);
	
	List<CommonAppPerson> searchAppPersonByPage(AppPersonSearchCondition searchCondition);
	
	int searchAppPersonCount(AppPersonSearchCondition searchCondition);
	
	int getUserAppPersonCount(int userId);
	
	void addFeeRedurceAppPerson(CommonAppPerson commonAppPerson);
	
	void addSharePlatFormAppPerson(int appPersonId);
	
	List<CommonAppPerson> getUserFeeRedurceAppPersonList(Page page);
	
	List<CommonAppPerson> getAllFeeRedurceAppPersonList(Page page);
	
	List<CommonAppPerson> searchFeeRedurceAppPersonByPage(AppPersonSearchCondition searchCondition);
	
	int searchFeeRedurceAppPersonCount(AppPersonSearchCondition searchCondition);
	
	List<CommonAppPerson> searchFeeRedurceAppPersonForPlat(AppPersonSearchCondition searchCondition);
	
	int searchFeeRedurceAppPersonForPlatCount(AppPersonSearchCondition searchCondition);
	
	int getAllFeeRedurceAppPersonCount();
	
	int getUserFeeRedurceAppPersonCount(int userId);
}
