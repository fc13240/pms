package com.lotut.pms.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.lotut.pms.dao.FriendDao;
import com.lotut.pms.domain.User;
import com.lotut.pms.service.FriendService;

public class FriendServiceImpl implements FriendService {
	private FriendDao friendDao;
	
	public FriendServiceImpl(FriendDao friendDao) {
		this.friendDao = friendDao;
	}
	
	@Override
	public List<User> getUserFriends(int userId) {
		return friendDao.getUserFriends(userId);
	}

	@Override
	@Transactional
	public void deleteFriend(int userId, int friendId) {
		friendDao.deleteFriend(userId, friendId);
	}
	
	@Override
	public List<User> searchFriends(String keyword) {
		return friendDao.searchFriends(keyword);
	}

	@Override
	public List<User> searchUserFriends(int userId, String keyword) {
		return friendDao.searchUserFriends(userId, keyword);
	}

	@Override
	@Transactional
	public void sendFriendRequst(int fromUserId, int toUserId) {
		friendDao.insertFriendRequest(fromUserId, toUserId);
	}

	@Override
	public List<User> getFriendRequests(int userId) {
		return friendDao.getFriendRequests(userId);
	}
	
	@Override
	@Transactional
	public void processFriendRequest(int processUserId, int requestUserId, int processStatus) {
		friendDao.processFriendRequest(processUserId, requestUserId, processStatus);
	}

	@Override
	public List<User> searchUserFriendsByUser(int userId,String keyword) {
		return friendDao.searchUserFriendsByUser(userId,keyword);
	}

	@Override
	public void changeRemarkName(int userId, int friendId, String remarkName) {
		friendDao.updateRemarkName(userId, friendId, remarkName);
	}
}
