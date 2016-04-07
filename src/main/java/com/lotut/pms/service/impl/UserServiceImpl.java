package com.lotut.pms.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

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
	public boolean update(String lastPassword,String newPassword){
		User user=PrincipalUtils.getCurrentPrincipal();
		BCryptPasswordEncoder encode = new BCryptPasswordEncoder();
		if(user.getPassword().equals(encode.encode(lastPassword))){
			user.setPassword(encode.encode(newPassword));
			return true;
		}
		return false;
	}
}
