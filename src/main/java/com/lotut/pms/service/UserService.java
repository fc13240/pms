package com.lotut.pms.service;

import java.util.List;

import com.lotut.pms.domain.User;


public interface UserService {
	List<User> getAllUsers();
	/*
	 * 注册
	 */
	public boolean register(User user);
}
