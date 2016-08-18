package com.lotut.pms.dao.mybatis;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.ShareInventorDao;
import com.lotut.pms.dao.mapper.ShareInventorMapper;

public class ShareInventorMybatisDao extends SqlSessionDaoSupport implements ShareInventorDao {
	private ShareInventorMapper shareInventorMapper;
	
	public void setShareInventorMapper(ShareInventorMapper shareInventorMapper){
		this.shareInventorMapper=shareInventorMapper;
	}
	@Override
	public void insertUserInventors(List<Map<String, Integer>> userInventorRecords) {
		// TODO Auto-generated method stub
		shareInventorMapper.insertUserInventors(userInventorRecords);
	}
	
}
