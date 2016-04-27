package com.lotut.pms.dao;

import java.util.List;

import com.lotut.pms.domain.User;

public interface FriendDao {
	List<User> getUserFriends(int userId);
	
	void deleteFriend(int userId, int friendId);
	
	List<User> searchFriends(String keyword);
	
	List<User> searchUserFriends(int userId, String keyword);
	
	void insertFriendRequest(int fromUserId, int toUserId);
	
	List<User> getFriendRequests(int userId);
	
	void processFriendRequest(int processUserId, int requestUserId, int processStatus);
	
	List<User> searchUserFriendsByUser(int userId,String keyword);
}
