package com.lotut.pms.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Transactional;

import com.lotut.pms.dao.UserDao;
import com.lotut.pms.domain.User;
import com.lotut.pms.service.UserService;
import com.lotut.pms.util.PrincipalUtils;

public class UserServiceImpl implements UserService {
	private UserDao userDao;

	public UserServiceImpl(UserDao userDao) {
		this.userDao = userDao;
	}
	
	@Override
	public List<User> getAllUsers() {
		return userDao.getAllUsers();
	}
	//注册
	@Override
	@Transactional
	public boolean register(User user) {
		//注册前检查用户名是否存在
		User has_user=userDao.findByName(user.getUsername());
		if(has_user!=null){
			return false;
		}
		//添加处理
		BCryptPasswordEncoder encode = new BCryptPasswordEncoder();
		user.setPassword(encode.encode(user.getPassword()));
		userDao.save(user);
		return true;
		
	}
	//修改密码
	@Transactional
	public boolean changePassword(String lastPassword,String newPassword){
		User user=PrincipalUtils.getCurrentPrincipal();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		if(encoder.matches(lastPassword, user.getPassword()) ){
			user.setPassword(encoder.encode(newPassword));
			userDao.updatePassword(user);
			return true;
		}
		return false;
	}

	@Override
	public User getUserDetail(int userId) {
		return userDao.getById(userId);
	}

	@Override
	public List<Map<String, String>> getAllProvinces() {
		return userDao.getAllProvinces();
	}

	@Override
	public List<Map<String, String>> getCitiesByProvinceId(int provinceId) {
		return userDao.getCitiesByProvinceId(provinceId);
	}

	@Override
	public List<Map<String, String>> getDistrictsByCityId(long cityId) {
		return userDao.getDistrictsByCityId(cityId);
	}

	@Override
	public List<Map<String, String>> getStreetsByDistrictId(long districtId) {
		return userDao.getStreetsByDistrictId(districtId);
	}
}
