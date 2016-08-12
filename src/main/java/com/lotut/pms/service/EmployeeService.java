package com.lotut.pms.service;

import java.util.List;

import com.lotut.pms.domain.CustomerSupport;

public interface EmployeeService {

	List<CustomerSupport> getCustomerSupportList(int proxyOrgId);

	void addOrUpdateCustomerSupport(CustomerSupport customerSupport);

	void deleteCustomerSupport(int id);

	void changeRemarkName(int id, String remarkName);
	
	

}


