package com.lotut.pms.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.FriendDao;
import com.lotut.pms.dao.mapper.FriendMapper;
import com.lotut.pms.domain.User;

public class FriendMybatisDao extends SqlSessionDaoSupport implements FriendDao {
	private FriendMapper friendMapper;
	
	@Override
	public List<User> getUserFriends(int userId) {
		return friendMapper.getUserFriends(userId);
	}

	@Override
	public void deleteFriend(int userId, int friendId) {
		friendMapper.deleteFriend(userId, friendId);
	}
	
	@Override
	public List<User> searchFriends(String keyword) {
		return friendMapper.searchFriends(keyword);
	}
	
	@Override
	public List<User> searchUserFriends(int userId, String keyword) {
		return friendMapper.searchUserFriends(userId, keyword);
	}

	@Override
	public void insertFriendRequest(int fromUserId, int toUserId) {
		friendMapper.insertFriendRequest(fromUserId, toUserId);
	}
	
	@Override
	public List<User> getFriendRequests(int userId) {
		return friendMapper.getFriendRequests(userId);
	}

	@Override
	public void processFriendRequest(int processUserId, int requestUserId, int processStatus) {
		friendMapper.processFriendRequest(processUserId, requestUserId, processStatus);
	}
	

	public FriendMapper getFriendMapper() {
		return friendMapper;
	}

	public void setFriendMapper(FriendMapper friendMapper) {
		this.friendMapper = friendMapper;
	}

	@Override
	public List<User> searchUserFriendsByUser(int userId, String keyword) {
		return friendMapper.searchUserFriendsByUser(userId, keyword);
	}
	
	@Override
	public void updateRemarkName(int userId, int friendId, String remarkName) {
		friendMapper.updateRemarkName(userId, friendId, remarkName);
	}

	@Override
	public List<User> findFriendsByUserId(int userId, String keyword) {
		// TODO Auto-generated method stub
		return friendMapper.findFriendsByUserId(userId, keyword);
	}
}
