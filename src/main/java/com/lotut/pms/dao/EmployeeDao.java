package com.lotut.pms.dao;

import java.util.List;

import com.lotut.pms.domain.CustomerSupport;
import com.lotut.pms.domain.Tech;
import com.lotut.pms.domain.Process;

public interface EmployeeDao {

	List<CustomerSupport> getCustomerSupportList(int proxyOrgId);

	List<Tech> getTechList(int proxyOrgId);
	
	List<Process> getProcessList(int proxyOrgId);
	
	void addOrUpdateCustomerSupport(CustomerSupport customerSupport);

	void addOrUpdateTech(Tech tech);
	
	void addOrUpdateProcess(Process process);
	
	void deleteCustomerSupport(int id);
	
	void deleteTech(int id);
	
	void deleteProcess(int id);

	void changeCustomerSupportRemarkName(int id, String remarkName);

	void changeTechRemarkName(int id, String remarkName);

	void changeProcessRemarkName(int id, String remarkName);
	
	void insertGroupMember(int userId,String roleName);

}
