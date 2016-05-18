package com.lotut.pms.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.ContactAddress;
import com.lotut.pms.domain.PatentOfficeAccount;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.PatentType;
import com.lotut.pms.domain.User;


public interface PatentOfficeAccountService {
	
	
	List<PatentOfficeAccount> getUserAccounts(int userId);
	
	void deleteOfficeAccount(long accountId);

}
