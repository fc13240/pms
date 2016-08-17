package com.lotut.pms.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.AppPersonDao;
import com.lotut.pms.dao.mapper.AppPersonMapper;
import com.lotut.pms.domain.CommonAppPerson;
import com.lotut.pms.domain.AppPersonType;

public class AppPersonMybatisDao extends SqlSessionDaoSupport implements AppPersonDao{
	private AppPersonMapper AppPersonMapper;
	
	public void setAppPersonMapper(AppPersonMapper AppPersonMapper){
		this.AppPersonMapper=AppPersonMapper;
	}
	public void addAppPerson(CommonAppPerson commonAppPerson) {
		AppPersonMapper.addAppPerson(commonAppPerson);
		
	}
	@Override
	public List<AppPersonType> getAppPersonTypes() {
		// TODO Auto-generated method stub
		return AppPersonMapper.getAppPersonTypes();
	}
	@Override
	public List<CommonAppPerson> getAllAppPersonByUser(int userId) {
		// TODO Auto-generated method stub
		return AppPersonMapper.getAllAppPersonByUser(userId) ;
	}
	public CommonAppPerson getOneAppPersonById(int id) {
		// TODO Auto-generated method stub
		return AppPersonMapper.getOneAppPersonById(id);
	}
	public void updateAppPerson(CommonAppPerson AppPerson) {
		AppPersonMapper.updateAppPerson(AppPerson);
		
	}
	public void deleteAppPersonById(int id) {
		// TODO Auto-generated method stub
		AppPersonMapper.deleteAppPersonById(id);
	}
	@Override
	public List<CommonAppPerson> getAppPersonByName(String appPerson,int userId) {
		return AppPersonMapper.getAppPersonByName(appPerson,userId);
	}

	

}
