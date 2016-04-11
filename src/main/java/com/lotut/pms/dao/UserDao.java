package com.lotut.pms.dao;

import java.util.List;

import com.lotut.pms.domain.User;

public interface UserDao {
	List<User> getAllUsers();
	public User findByName(String username);
	public void save(User user);
	public void updatePassword(User user);
	
	public User getById(int userId);
}
