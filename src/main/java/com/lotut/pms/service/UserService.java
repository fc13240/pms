package com.lotut.pms.service;

import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.ContactAddress;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.User;


public interface UserService {
	
	List<User> getAllUsers(Page page);
	
	long getAllUsersCount();
	
	/*
	 * 注册
	 */
	boolean register(User user);
	/*
	 * 修改密码
	 */
	boolean changePassword(String lastPassword,String newPassword);
	
	User getUserDetail(int userId);
	
	List<Map<String, String>> getAllProvinces();
	
	List<Map<String, String>> getCitiesByProvinceId(int provinceId);
	
	List<Map<String, String>> getDistrictsByCityId(long cityId);
	
	void saveContactAddress(ContactAddress contactAddress);
	
	List<ContactAddress> getUserContactAddresses(int userId);
	
	boolean updateUserDetail(User user);
	
	void updateUserContactAddresses(ContactAddress contactAddress);
	
	void deleteUserContactAddresses(int id);
	
	void defaultUserContactAddresses(int id);
	
	void defaulStatus();
	
	ContactAddress getContactAddressesById(int id);
	
	List<User> getAllUser();
}
