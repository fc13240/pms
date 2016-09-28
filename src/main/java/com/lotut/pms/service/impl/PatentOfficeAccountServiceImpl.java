package com.lotut.pms.service.impl;

import java.util.List;

import com.lotut.pms.dao.PatentOfficeAccountDao;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.PatentOfficeAccount;
import com.lotut.pms.service.PatentOfficeAccountService;

public class PatentOfficeAccountServiceImpl implements PatentOfficeAccountService {
	private PatentOfficeAccountDao patentOfficeAccountDao;

	public PatentOfficeAccountServiceImpl(PatentOfficeAccountDao patentOfficeAccountDao) {
		this.patentOfficeAccountDao = patentOfficeAccountDao;
	}
	
	@Override
	public List<PatentOfficeAccount> getUserAccounts(Page page) {
		return patentOfficeAccountDao.getUserAccounts(page);
	}

	public void deleteOfficeAccount(long accountId){
		patentOfficeAccountDao.deleteOfficeAccount(accountId);
	}

	public boolean updateOfficeAccount(PatentOfficeAccount patentOfficeAccount) {
		return patentOfficeAccountDao.updateOfficeAccount(patentOfficeAccount);
	}

	@Override
	public PatentOfficeAccount getOfficeAccountDetail(long accountId) {
		return patentOfficeAccountDao.getById(accountId);
	}

	@Override
	public void addOfficeAccount(PatentOfficeAccount patentOfficeAccount) {
		patentOfficeAccountDao.addOfficeAccount(patentOfficeAccount);
		
	}

	@Override
	public void updatePatentsTime(long accountId) {
		patentOfficeAccountDao.updatePatentsTime(accountId);
	}


	@Override
	public int getUserAccountsCount(int userId) {
		return patentOfficeAccountDao.getUserAccountsCount(userId);
	}
	
	@Override
	public List<PatentOfficeAccount> getAllAccount() {
		return patentOfficeAccountDao.getAllAccount();
	}
	
	@Override
	public List<PatentOfficeAccount> getAllAccountByPage(Page page) {
		return patentOfficeAccountDao.getAllAccountBypage(page);
	}
}
