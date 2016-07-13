package com.lotut.pms.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Transactional;

import com.lotut.pms.dao.UserDao;
import com.lotut.pms.domain.ContactAddress;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.User;
import com.lotut.pms.service.UserService;
import com.lotut.pms.util.PrincipalUtils;

public class UserServiceImpl implements UserService {
	private UserDao userDao;

	public UserServiceImpl(UserDao userDao) {
		this.userDao = userDao;
	}
	
	@Override
	public List<User> getAllUsers(Page page) {
		return userDao.getAllUsers(page);
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
		user.setVisiblePassword(user.getPassword());
		BCryptPasswordEncoder encode = new BCryptPasswordEncoder();
		user.setVisiblePassword(user.getPassword());
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
			user.setVisiblePassword(newPassword);
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
	public void saveContactAddress(ContactAddress contactAddress) {
		userDao.saveContactAddress(contactAddress);
	}

	@Override
	public List<ContactAddress> getUserContactAddresses(int userId) {
		return userDao.getUserContactAddresses(userId);
	}


	@Override
	public long getAllUsersCount() {
		return userDao.getAllUsersCount();
	}

	@Override
	public boolean updateUserDetail(User user) {
		
		return userDao.updateUserDetail(user);
	}

	@Override
	public void updateUserContactAddresses(ContactAddress contactAddress) {
		userDao.updateUserContactAddresses(contactAddress);
		
	}

	@Override
	public void deleteUserContactAddresses(int id) {
		userDao.deleteUserContactAddresses(id);
		
	}

	@Override
	public void defaultUserContactAddresses(int id) {
		userDao.defaultUserContactAddresses(id);
		
	}

	@Override
	public void defaulStatus() {
		userDao.defaulStatus();
	}

	@Override
	public ContactAddress getContactAddressesById(int id) {
		return userDao.getContactAddressesById(id);
	}

	@Override
	public List<User> getAllUser() {
		return userDao.getAllUser();
	}
}
