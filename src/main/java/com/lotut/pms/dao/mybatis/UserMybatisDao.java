package com.lotut.pms.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.UserDao;
import com.lotut.pms.dao.mapper.UserMapper;
import com.lotut.pms.domain.User;

public class UserMybatisDao extends SqlSessionDaoSupport implements UserDao {
	private UserMapper userMapper;
	
	@Override
	public List<User> getAllUsers() {
		return userMapper.getAllUsers();
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
	
}
