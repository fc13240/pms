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
	//注册
	@Override
	public boolean register(User user) {
		//注册前检查用户名是否存在
		User has_user=userDao.findByName(user.getUsername());
		if(has_user!=null){
			return false;
		}
		//添加处理
		userDao.save(user);
		return true;
		
	}
}
