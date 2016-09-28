package com.lotut.pms.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.PatentOfficeAccountDao;
import com.lotut.pms.dao.mapper.PatentOfficeAccountMapper;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.PatentOfficeAccount;

public class PatentOfficeAccountMybatisDao extends SqlSessionDaoSupport implements PatentOfficeAccountDao {
	private PatentOfficeAccountMapper patentOfficeAccountMapper;

	public PatentOfficeAccountMapper getPatentOfficeAccountMapper() {
		return patentOfficeAccountMapper;
	}

	public void setPatentOfficeAccountMapper(PatentOfficeAccountMapper patentOfficeAccountMapper) {
		this.patentOfficeAccountMapper = patentOfficeAccountMapper;
	}

	@Override
	public List<PatentOfficeAccount> getUserAccounts(Page page) {
		return patentOfficeAccountMapper.getUserAccounts(page);
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

	
	@Override
	public int getUserAccountsCount(int userId) {
		return patentOfficeAccountMapper.getUserAccountsCount(userId);
	}
	
	@Override
	public List<PatentOfficeAccount> getAllAccount() {
		return patentOfficeAccountMapper.getAllAccount();
	}
	
	@Override
	public List<PatentOfficeAccount> getAllAccountBypage(Page page) {
		return patentOfficeAccountMapper.getAllAccountBypage(page);
	}
}
