package com.lotut.pms.dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.ContactAddress;
import com.lotut.pms.domain.PatentOfficeAccount;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.User;

public interface PatentOfficeAccountMapper {

	
	List<PatentOfficeAccount> getUserAccounts(int userId);
	
	void deleteOfficeAccount(@Param("accountId") long accountId);
}
