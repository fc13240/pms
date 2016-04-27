package com.lotut.pms.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.User;

public interface FriendMapper {
	List<User> getUserFriends(int userId);
	
	void deleteFriend(@Param("userId")int userId, @Param("friendId")int friendId);
	
	List<User> searchFriends(@Param("keyword")String keyword);
	
	List<User> searchUserFriends(@Param("userId")int userId, @Param("keyword")String keyword);
	
	void insertFriendRequest(@Param("fromUserId")int fromUserId, @Param("toUserId")int toUserId);
	
	List<User> getFriendRequests(@Param("userId")int userId);
	
	void processFriendRequest(@Param("processUserId")int processUserId, @Param("requestUserId")int requestUserId, @Param("processStatus")int processStatus);
	
	List<User> searchUserFriendsByUser(@Param("userId")int userId, @Param("keyword")String keyword);
}
