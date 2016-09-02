package com.lotut.pms.dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.ContactAddress;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.User;

public interface UserMapper {
	List<User> getAllUsers(Page page);
	
	
	int getAllUsersCount();
	
	User findByName(String username);
	
	void save(User user);
	
	void updatePassword(User user);
	
	User getById(int userId);
	
	List<Map<String, String>> getAllProvinces();
	
	List<Map<String, String>> getCitiesByProvinceId(int provinceId);
	
	List<Map<String, String>> getDistrictsByCityId(long cityId);
	
	
	void saveContactAddress(ContactAddress contactAddress);
	
	List<ContactAddress> getUserContactAddresses(@Param("userId")int userId);
	
	boolean updateUserDetail(User user);
	
	void updateUserContactAddresses(ContactAddress contactAddress);
	
	void deleteUserContactAddresses(int id);
	
	void defaultUserContactAddresses(int id);
	
	void defaulStatus();
	
	ContactAddress getContactAddressesById(int id);
	
	List<User> getAllUser();
	
	List<ContactAddress> getContactAddressesByReceiver(@Param("userId") int userId,@Param("receiver") String receiver);

	List<User> searchUsers(@Param("keyword") String keyword,@Param("userId") int userId);
}
