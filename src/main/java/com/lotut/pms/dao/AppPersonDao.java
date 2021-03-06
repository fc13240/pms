package com.lotut.pms.dao;

import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.AppPersonSearchCondition;
import com.lotut.pms.domain.CommonAppPerson;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.UserAppPerson;

public interface AppPersonDao {
	void addAppPerson(CommonAppPerson commonAppPerson);

	List<CommonAppPerson> getAllAppPersonByUser(int userId);

	void updateAppPerson(CommonAppPerson AppPerson);

	CommonAppPerson getOneAppPersonById(int id);

	void deleteAppPersonById(int id);

	List<CommonAppPerson> getUserAppPersons(Page page);

	void saveAttachmentFile(CommonAppPerson AppPerson);

	String getAppPersonUrlById(int id);

	void addCommonAppPerson(CommonAppPerson commonAppPerson);

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
	
	void addFeeReduceAppPerson(CommonAppPerson commonAppPerson);
	
	void addSharePlatFormAppPerson(int appPersonId);

	List<CommonAppPerson> getUserFeeReduceAppPersonList(Page page);
	
	List<CommonAppPerson> getAllFeeReduceAppPersonList(Page page);

	int searchFeeReduceAppPersonCount(AppPersonSearchCondition searchCondition);

	List<CommonAppPerson> searchFeeReduceAppPersonForPlat(AppPersonSearchCondition searchCondition);

	int searchFeeReduceAppPersonForPlatCount(AppPersonSearchCondition searchCondition);

	List<CommonAppPerson> searchFeeReduceAppPersonByPage(AppPersonSearchCondition searchCondition);
	
	int getAllFeeReduceAppPersonCount();
	
	int getUserFeeReduceAppPersonCount(int userId);
	
	
	void updateFeeReduceAppPerson(CommonAppPerson AppPerson);
}
