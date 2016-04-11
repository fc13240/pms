package com.lotut.pms.dao.mapper;

import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.User;

public interface UserMapper {
	List<User> getAllUsers();
	User findByName(String username);
	void save(User user);
	void updatePassword(User user);
	
	User getById(int userId);
	
	List<Map<String, String>> getAllProvinces();
	
	List<Map<String, String>> getCitiesByProvinceId(int provinceId);
	
	List<Map<String, String>> getDistrictsByCityId(long cityId);
	
	List<Map<String, String>> getStreetsByDistrictId(long districtId);
}
