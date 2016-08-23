package com.lotut.pms.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.AppPersonDao;
import com.lotut.pms.dao.mapper.AppPersonMapper;
import com.lotut.pms.domain.CommonAppPerson;
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
	public List<CommonAppPerson> getUserAppPersons(int userId) {
		
		return appPersonMapper.getUserAppPersons(userId);
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
	public Integer getIdbyAppPerson(CommonAppPerson commonAppPerson) {
		return appPersonMapper.getIdbyAppPerson(commonAppPerson);
	}
	@Override
	public void deleteUserAppPersonbyId(UserAppPerson userAppPerson) {
		appPersonMapper.deleteUserAppPersonbyId(userAppPerson);
	}

	
	
}
