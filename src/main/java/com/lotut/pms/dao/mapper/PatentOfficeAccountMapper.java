package com.lotut.pms.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.PatentOfficeAccount;

public interface PatentOfficeAccountMapper {

	
	List<PatentOfficeAccount> getUserAccounts(Page page);
	
	int getUserAccountsCount(int userId);
	
	void deleteOfficeAccount(@Param("accountId") long accountId);
	
	boolean updateOfficeAccount(PatentOfficeAccount patentOfficeAccount);
	
	PatentOfficeAccount getById(long accountId);

	void addOfficeAccount(PatentOfficeAccount patentOfficeAccount);
	
	void updatePatentsTime(long accountId);
	
	List<PatentOfficeAccount> getAllAccount();
	
	List<PatentOfficeAccount> getAllAccountBypage(Page page);
	
	int getAllAccountCount();

}
