package com.lotut.pms.dao;

import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.ContactAddress;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.User;

public interface UserDao {
	List<User> getAllUsers(Page page);
	
	
	int getAllUsersCount();
	
	User findByName(String username);
	
	void save(User user);
	
	void updatePassword(User user);
	
	User getById(int userId);
	User getByUsername(String username);
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
	
	List<ContactAddress> getContactAddressesByReceiver(int userId,String receiver);

	List<User> searchUsers(String keyword,int userId);
	
	List<User> getPlatformUser();



}
