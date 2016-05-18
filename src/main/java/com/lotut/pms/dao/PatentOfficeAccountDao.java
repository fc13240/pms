package com.lotut.pms.dao;

import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.ContactAddress;
import com.lotut.pms.domain.PatentOfficeAccount;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.User;

public interface PatentOfficeAccountDao {

	
	List<PatentOfficeAccount> getUserAccounts(Integer userId);
	
	void deleteOfficeAccount(long accountId);
	
	boolean updateOfficeAccount(PatentOfficeAccount patentOfficeAccount);
	
	PatentOfficeAccount getById(long accountId);

	void addOfficeAccount(PatentOfficeAccount patentOfficeAccount);
}
