package com.lotut.pms.service;

import java.util.List;

import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.PatentOfficeAccount;


public interface PatentOfficeAccountService {
	
	
	List<PatentOfficeAccount> getUserAccounts(Page page);
	
	void deleteOfficeAccount(long accountId);
	
	boolean updateOfficeAccount(PatentOfficeAccount patentOfficeAccount);
	
	PatentOfficeAccount getOfficeAccountDetail(long accountId);
	
	void addOfficeAccount(PatentOfficeAccount patentOfficeAccount);
	
	void updatePatentsTime(long accountId);
	
	List<PatentOfficeAccount> getAllAccount();
	
	List<PatentOfficeAccount> getAllAccountByPage(Page page);
	
	int getUserAccountsCount(int userId);
	
	int getAllAccountCount();
	
	
}
