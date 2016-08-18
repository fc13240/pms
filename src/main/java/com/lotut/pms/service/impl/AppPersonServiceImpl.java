package com.lotut.pms.service.impl;

import java.util.List;

import com.lotut.pms.dao.AppPersonDao;
import com.lotut.pms.domain.CommonAppPerson;
import com.lotut.pms.domain.AppPersonType;
import com.lotut.pms.service.AppPersonService;

public class AppPersonServiceImpl implements AppPersonService {
	private AppPersonDao AppPersonDao;
	
	
	
	public AppPersonServiceImpl(AppPersonDao AppPersonDao) {
		this.AppPersonDao = AppPersonDao;
	}


	public void addAppPerson(CommonAppPerson commonAppPerson) {
		AppPersonDao.addAppPerson(commonAppPerson);
		
	}


	@Override
	public List<AppPersonType> getAppPersonTypes() {
		return AppPersonDao.getAppPersonTypes();
	}


	@Override
	public List<CommonAppPerson> getAllAppPersonByUser(int userId) {
		// TODO Auto-generated method stub
		return AppPersonDao.getAllAppPersonByUser(userId) ;
	}


	@Override
	public CommonAppPerson getOneAppPersonById(int id) {
		return AppPersonDao.getOneAppPersonById(id);
	}


	@Override
	public void updateAppPerson(CommonAppPerson AppPerson) {
		AppPersonDao.updateAppPerson(AppPerson);
		
	}


	@Override
	public void deleteAppPersonById(int id) {
		AppPersonDao.deleteAppPersonById(id);
		
	}
	@Override
	public List<CommonAppPerson> getUserAppPersons(int userId) {
		// TODO Auto-generated method stub
		return AppPersonDao.getUserAppPersons(userId);
	}


	@Override
	public void addCommonAppPerson(CommonAppPerson CommonAppPerson) {
		AppPersonDao.addCommonAppPerson(CommonAppPerson);
	}

}
