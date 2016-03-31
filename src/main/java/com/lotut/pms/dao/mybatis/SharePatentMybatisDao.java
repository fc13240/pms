package com.lotut.pms.dao.mybatis;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.SharePatentDao;
import com.lotut.pms.dao.mapper.SharePatentMapper;
import com.lotut.pms.domain.SharePatent;

public class SharePatentMybatisDao extends SqlSessionDaoSupport implements SharePatentDao {
	private SharePatentMapper sharePatentMapper;
	
	@Override
	public List<SharePatent> getUserSharedPatents(int userId) {
		return sharePatentMapper.getUserSharedPatents(userId);
	}
	
	@Override
	public void insertSharePatents(List<Map<String, Integer>> sharePatentRecords, List<Map<String, Integer>> userPatentRecords) {
		sharePatentMapper.insertUserPatents(userPatentRecords);
		sharePatentMapper.insertSharePatents(sharePatentRecords);
	}

	
	public SharePatentMapper getSharePatentMapper() {
		return sharePatentMapper;
	}


	public void setSharePatentMapper(SharePatentMapper sharePatentMapper) {
		this.sharePatentMapper = sharePatentMapper;
	}

	@Override
	public void insertUserPatents(List<Map<String, Integer>> userPatentRecords) {
		sharePatentMapper.insertUserPatents(userPatentRecords);
	}

	@Override
	public List<SharePatent> getFriendsSharedPatents(int userId) {
		return sharePatentMapper.getFriendsSharedPatents(userId);
	}
}
