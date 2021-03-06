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
	
	void addFeeReduceAppPerson(CommonAppPerson commonAppPerson);
	
	void addSharePlatFormAppPerson(int appPersonId);
	
	List<CommonAppPerson> getUserFeeReduceAppPersonList(Page page);
	
	List<CommonAppPerson> getAllFeeReduceAppPersonList(Page page);
	
	List<CommonAppPerson> searchFeeReduceAppPersonByPage(AppPersonSearchCondition searchCondition);
	
	int searchFeeReduceAppPersonCount(AppPersonSearchCondition searchCondition);
	
	List<CommonAppPerson> searchFeeReduceAppPersonForPlat(AppPersonSearchCondition searchCondition);
	
	int searchFeeReduceAppPersonForPlatCount(AppPersonSearchCondition searchCondition);
	
	int getAllFeeReduceAppPersonCount();
	
	int getUserFeeReduceAppPersonCount(int userId);
	
	void updateFeeReduceAppPerson(CommonAppPerson AppPerson);
}
