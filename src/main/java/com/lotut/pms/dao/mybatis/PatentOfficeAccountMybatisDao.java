package com.lotut.pms.dao.mybatis;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.PatentOfficeAccountDao;
import com.lotut.pms.dao.UserDao;
import com.lotut.pms.dao.mapper.PatentOfficeAccountMapper;
import com.lotut.pms.dao.mapper.UserMapper;
import com.lotut.pms.domain.ContactAddress;
import com.lotut.pms.domain.PatentOfficeAccount;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.User;

public class PatentOfficeAccountMybatisDao extends SqlSessionDaoSupport implements PatentOfficeAccountDao {
	private PatentOfficeAccountMapper patentOfficeAccountMapper;

	public PatentOfficeAccountMapper getPatentOfficeAccountMapper() {
		return patentOfficeAccountMapper;
	}

	public void setPatentOfficeAccountMapper(PatentOfficeAccountMapper patentOfficeAccountMapper) {
		this.patentOfficeAccountMapper = patentOfficeAccountMapper;
	}

	@Override
	public List<PatentOfficeAccount> getUserAccounts(int userId) {
		return patentOfficeAccountMapper.getUserAccounts(userId);
	}
	
	@Override
	public void deleteOfficeAccount(long accountId) {
		patentOfficeAccountMapper.deleteOfficeAccount(accountId);
	}
	
	@Override
	public boolean updateOfficeAccount(PatentOfficeAccount patentOfficeAccount) {
		return patentOfficeAccountMapper.updateOfficeAccount(patentOfficeAccount);
	}
	
	@Override
	public PatentOfficeAccount getById(long accountId) {
		return patentOfficeAccountMapper.getById(accountId);
	}

	@Override
	public void addOfficeAccount(PatentOfficeAccount patentOfficeAccount) {
		patentOfficeAccountMapper.addOfficeAccount(patentOfficeAccount);
		
	}

	@Override
	public void updatePatentsTime(long accountId) {
		patentOfficeAccountMapper.updatePatentsTime(accountId);
	}
}
