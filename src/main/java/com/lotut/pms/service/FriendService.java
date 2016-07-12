package com.lotut.pms.service;

import java.util.List;

import com.lotut.pms.domain.User;

public interface FriendService {
	List<User> getUserFriends(int userId);
	
	void deleteFriend(int userId, int friendId);
	
	List<User> searchFriends(String keyword);
	
	List<User> searchUserFriends(int userId, String keyword);
	
	void sendFriendRequst(int fromUserId, int toUserId);
	
	List<User> getFriendRequests(int userId);
	
	void processFriendRequest(int processUserId, int requestUserId, int processStatus);
	
	List<User> searchUserFriendsByUser(int userId, String keyword);
	
	void changeRemarkName(int userId, int friendId, String remarkName);
}
