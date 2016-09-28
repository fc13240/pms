package com.lotut.pms.dao.mybatis;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.UserDao;
import com.lotut.pms.dao.mapper.UserMapper;
import com.lotut.pms.domain.ContactAddress;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.User;

public class UserMybatisDao extends SqlSessionDaoSupport implements UserDao {
	private UserMapper userMapper;
	
	@Override
	public List<User> getAllUsers(Page page) {
		return userMapper.getAllUsers(page);
	}

	public UserMapper getUserMapper() {
		return userMapper;
	}

	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	@Override
	public User findByName(String username) {
		
		return userMapper.findByName(username);
	}

	@Override
	public void save(User user) {
		userMapper.save(user);
		
	}

	@Override
	public void updatePassword(User user) {
		userMapper.updatePassword(user);
		
	}

	@Override
	public User getById(int userId) {
		return userMapper.getById(userId);
	}
	
	@Override
	public User getByUsername(String username) {
		return userMapper.getByUsername(username);
	}
	
	@Override
	public List<Map<String, String>> getAllProvinces() {
		return userMapper.getAllProvinces();
	}

	@Override
	public List<Map<String, String>> getCitiesByProvinceId(int provinceId) {
		return userMapper.getCitiesByProvinceId(provinceId);
	}

	@Override
	public List<Map<String, String>> getDistrictsByCityId(long cityId) {
		return userMapper.getDistrictsByCityId(cityId);
	}


	@Override
	public void saveContactAddress(ContactAddress contactAddress) {
		userMapper.saveContactAddress(contactAddress);
	}

	@Override
	public List<ContactAddress> getUserContactAddresses(int userId) {
		return userMapper.getUserContactAddresses(userId);
	}

//	@Override
//	public List<User> getAllUsersBypage(Page page) {
//		return userMapper.getAllUsersBypage(page);
//	}

	@Override
	public int getAllUsersCount() {
		return userMapper.getAllUsersCount();
	}

	@Override
	public boolean updateUserDetail(User user) {
		return userMapper.updateUserDetail(user);
	}

	@Override
	public void updateUserContactAddresses(ContactAddress contactAddress) {
		userMapper.updateUserContactAddresses(contactAddress);
		
	}

	@Override
	public void deleteUserContactAddresses(int id) {
		userMapper.deleteUserContactAddresses(id);
		
	}

	@Override
	public void defaultUserContactAddresses(int id) {
		userMapper.defaultUserContactAddresses(id);
		
	}

	@Override
	public void defaulStatus() {
		userMapper.defaulStatus();
	}

	@Override
	public ContactAddress getContactAddressesById(int id) {
		return userMapper.getContactAddressesById(id);
	}

	@Override
	public List<User> getAllUser() {
		return userMapper.getAllUser();
	}

	@Override
	public List<ContactAddress> getContactAddressesByReceiver(int userId, String receiver) {
		return userMapper.getContactAddressesByReceiver(userId, receiver);
	}

	@Override
	public List<User> searchUsers(String keyword,int userId) {
		return userMapper.searchUsers(keyword,userId);
	}

	@Override
	public List<User> getPlatformUser() {
		
		return userMapper.getPlatformUser();
	}



	
}
