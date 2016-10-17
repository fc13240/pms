package com.lotut.pms.dao.mybatis;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.AppPersonDao;
import com.lotut.pms.dao.mapper.AppPersonMapper;
import com.lotut.pms.domain.AppPersonSearchCondition;
import com.lotut.pms.domain.CommonAppPerson;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.UserAppPerson;


public class AppPersonMybatisDao extends SqlSessionDaoSupport implements AppPersonDao{
	private AppPersonMapper appPersonMapper;
	
	public void setAppPersonMapper(AppPersonMapper appPersonMapper){
		this.appPersonMapper=appPersonMapper;
	}
	public void addAppPerson(CommonAppPerson commonAppPerson) {
		appPersonMapper.addAppPerson(commonAppPerson);
		
	}
	
	@Override
	public List<CommonAppPerson> getAllAppPersonByUser(int userId) {
		
		return appPersonMapper.getAllAppPersonByUser(userId) ;
	}
	public CommonAppPerson getOneAppPersonById(int id) {
		
		return appPersonMapper.getOneAppPersonById(id);
	}
	public void updateAppPerson(CommonAppPerson AppPerson) {
		appPersonMapper.updateAppPerson(AppPerson);
		
	}
	public void deleteAppPersonById(int id) {
		
		appPersonMapper.deleteAppPersonById(id);
	}
	
	@Override

	public void saveAttachmentFile(CommonAppPerson AppPerson) {
		
		appPersonMapper.saveAttachmentFile(AppPerson);
	}
	@Override
	public String getAppPersonUrlById(int id) {
		
		return appPersonMapper.getAppPersonUrlById(id);
	}
	public void addCommonAppPerson(CommonAppPerson CommonAppPerson) {
		appPersonMapper.addCommonAppPerson(CommonAppPerson);

	}
	@Override
	public void saveProxyFile(CommonAppPerson AppPerson) {
		
		appPersonMapper.saveProxyFile(AppPerson);
	}
	@Override
	public String getProxyUrlById(int id) {
		
		return appPersonMapper.getProxyUrlById(id);
	}
	@Override
	public void deleteAttachmentFileById(int id) {
		
		appPersonMapper.deleteAttachmentFileById(id);
	}
	@Override
	public void addUserAppPerson(UserAppPerson userAppPerson) {
		appPersonMapper.addUserAppPerson(userAppPerson);
		
	}
	@Override
	public List<Integer> getIdbyAppPerson(CommonAppPerson commonAppPerson) {
		return appPersonMapper.getIdbyAppPerson(commonAppPerson);
	}
	@Override
	public void deleteUserAppPersonbyId(UserAppPerson userAppPerson) {
		appPersonMapper.deleteUserAppPersonbyId(userAppPerson);
	}
	@Override
	public void updateAppPersonUserIdNull(CommonAppPerson commonAppPerson) {
		
		appPersonMapper.updateAppPersonUserIdNull(commonAppPerson);
		
	}
	@Override
	public void insertUserAppPersons(List<Map<String, Integer>> userAppPersonRecords) {
		appPersonMapper.insertUserAppPersons(userAppPersonRecords);
		
	}
	@Override
	public List<CommonAppPerson> searchAppPersonByPage(AppPersonSearchCondition searchCondition) {
		
		return appPersonMapper.searchAppPersonByPage(searchCondition);
	}
	@Override
	public int searchAppPersonCount(AppPersonSearchCondition searchCondition) {
		
		return appPersonMapper.searchAppPersonCount(searchCondition);
	}
	@Override
	public int getUserAppPersonCount(int userId) {
		
		return appPersonMapper.getUserAppPersonCount(userId);
	}
	@Override
	public List<CommonAppPerson> getUserAppPersons(Page page) {
		
		return appPersonMapper.getUserAppPersons(page);
	}
	@Override
	public void addFeeRedurceAppPerson(CommonAppPerson commonAppPerson) {
		appPersonMapper.addFeeRedurceAppPerson(commonAppPerson);
	}
	@Override
	public void addSharePlatFormAppPerson(int appPersonId) {
		appPersonMapper.addSharePlatFormAppPerson(appPersonId);
	}
	

	
}
