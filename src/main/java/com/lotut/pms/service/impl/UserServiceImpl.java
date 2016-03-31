package com.lotut.pms.service.impl;

import java.util.List;

import com.lotut.pms.dao.UserDao;
import com.lotut.pms.domain.User;
import com.lotut.pms.service.UserService;

public class UserServiceImpl implements UserService {
	private UserDao userDao;

	public UserServiceImpl(UserDao userDao) {
		this.userDao = userDao;
	}
	
	@Override
	public List<User> getAllUsers() {
		return userDao.getAllUsers();
	}
}
