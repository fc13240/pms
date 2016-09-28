package com.lotut.pms.dao;

import java.util.List;

import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.PatentOfficeAccount;

public interface PatentOfficeAccountDao {

	
	List<PatentOfficeAccount> getUserAccounts(Page page);
	int getUserAccountsCount(int userId);
	
	void deleteOfficeAccount(long accountId);
	
	boolean updateOfficeAccount(PatentOfficeAccount patentOfficeAccount);
	
	PatentOfficeAccount getById(long accountId);

	void addOfficeAccount(PatentOfficeAccount patentOfficeAccount);
	
	void updatePatentsTime(long accountId);
	
	List<PatentOfficeAccount> getAllAccount();
	
	List<PatentOfficeAccount> getAllAccountBypage(Page page);
}
