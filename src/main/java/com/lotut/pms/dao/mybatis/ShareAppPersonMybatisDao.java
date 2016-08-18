package com.lotut.pms.dao.mybatis;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.ShareAppPersonDao;
import com.lotut.pms.dao.mapper.ShareAppPersonMapper;

public class ShareAppPersonMybatisDao extends SqlSessionDaoSupport implements ShareAppPersonDao{
	private ShareAppPersonMapper shareAppPersonMapper;
	
	public void setShareAppPersonMapper(ShareAppPersonMapper shareAppPersonMapper){
		this.shareAppPersonMapper=shareAppPersonMapper;
		
	}
	

	@Override
	public void insertUserAppPersons(List<Map<String, Integer>> userAppPersonRecords) {
		shareAppPersonMapper.insertUserAppPersons(userAppPersonRecords);
		
	}

	@Override
	public void shareAppPersons(List<Map<String, Integer>> shareAppPersonRecords,
			List<Map<String, Integer>> userAppPersonRecords) {
		// TODO Auto-generated method stub
		shareAppPersonMapper.insertShareAppPersons(shareAppPersonRecords);
		shareAppPersonMapper.insertUserAppPersons(userAppPersonRecords);
	}


	

}
