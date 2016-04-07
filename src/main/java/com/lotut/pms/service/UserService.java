package com.lotut.pms.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.lotut.pms.domain.User;


public interface UserService {
	List<User> getAllUsers();
	/*
	 * 注册
	 */
	public boolean register(User user);
	/*
	 * 修改密码
	 */
	public boolean update(String lastPassword,String newPassword);
}
