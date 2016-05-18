package com.lotut.pms.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Transactional;

import com.lotut.pms.dao.PatentOfficeAccountDao;
import com.lotut.pms.dao.UserDao;
import com.lotut.pms.domain.ContactAddress;
import com.lotut.pms.domain.PatentOfficeAccount;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.User;
import com.lotut.pms.service.PatentOfficeAccountService;
import com.lotut.pms.service.UserService;
import com.lotut.pms.util.PrincipalUtils;

public class PatentOfficeAccountServiceImpl implements PatentOfficeAccountService {
	private PatentOfficeAccountDao patentOfficeAccountDao;

	public PatentOfficeAccountServiceImpl(PatentOfficeAccountDao patentOfficeAccountDao) {
		this.patentOfficeAccountDao = patentOfficeAccountDao;
	}
	
	@Override
	public List<PatentOfficeAccount> getUserAccounts(Integer userId) {
		return patentOfficeAccountDao.getUserAccounts(userId);
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
	public List<PatentOfficeAccount> getAllAccount() {
		return patentOfficeAccountDao.getAllAccount();
	}
}
