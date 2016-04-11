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
	public boolean changePassword(String lastPassword,String newPassword);
	
	public User getUserDetail(int userId);
}
