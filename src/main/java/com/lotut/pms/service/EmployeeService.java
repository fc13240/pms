package com.lotut.pms.service;

import java.util.List;

import com.lotut.pms.domain.CustomerSupport;
import com.lotut.pms.domain.Tech;

public interface EmployeeService {

	List<CustomerSupport> getCustomerSupportList(int proxyOrgId);
	
	List<Tech> getTechList(int proxyOrgId);

	void addOrUpdateCustomerSupport(CustomerSupport customerSupport);
	
	void addOrUpdateTech(Tech tech);

	void deleteCustomerSupport(int id);

	void changeCustomerSupportRemarkName(int id, String remarkName);

	void deleteTech(int id);

	void changeTechRemarkName(int id, String remarkName);
	
	

}


