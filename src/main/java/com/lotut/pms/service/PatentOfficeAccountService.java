package com.lotut.pms.service;

import java.util.List;

import com.lotut.pms.domain.PatentOfficeAccount;


public interface PatentOfficeAccountService {
	
	
	List<PatentOfficeAccount> getUserAccounts(Integer userId);
	
	void deleteOfficeAccount(long accountId);
	
	boolean updateOfficeAccount(PatentOfficeAccount patentOfficeAccount);
	
	PatentOfficeAccount getOfficeAccountDetail(long accountId);
	
	void addOfficeAccount(PatentOfficeAccount patentOfficeAccount);
	
	void updatePatentsTime(long accountId);
	
	List<PatentOfficeAccount> getAllAccount();
}
