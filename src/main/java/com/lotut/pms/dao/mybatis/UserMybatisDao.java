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
	public List<Map<String, String>> getStreetsByDistrictId(long districtId) {
		return userMapper.getStreetsByDistrictId(districtId);
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

	
}
