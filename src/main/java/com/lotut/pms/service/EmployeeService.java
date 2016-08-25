package com.lotut.pms.service;

import java.util.List;

import com.lotut.pms.domain.CustomerSupport;
import com.lotut.pms.domain.TechPerson;
import com.lotut.pms.domain.ProcessPerson;
import com.lotut.pms.domain.ProxyOrg;

public interface EmployeeService {

	List<CustomerSupport> getCustomerSupportList(int proxyOrgId);
	
	List<TechPerson> getTechPersonList(int proxyOrgId);
	
	List<ProcessPerson> getProcessPersonList(int proxyOrgId);

	void addOrUpdateCustomerSupport(CustomerSupport customerSupport);
	
	void addOrUpdateTechPerson(TechPerson techPerson);
	
	void addOrUpdateProcessPerson(ProcessPerson processPerson);

	void deleteCustomerSupport(int id);
	
	void deleteTechPerson(int id);
	
	void deleteProcessPerson(int id);

	void changeCustomerSupportRemarkName(int id, String remarkName);

	void changeTechPersonRemarkName(int id, String remarkName);

	void changeProcessPersonRemarkName(int id, String remarkName);

	List<ProxyOrg> getProxyOrgList(int parentOrgId);

	void addOrUpdateProxyOrg(ProxyOrg proxyOrg);

	void changeProxyOrgRemarkName(int orgId, String remarkName);

	void deleteProxyOrg(int orgId);

	int getParentOrgIdByUserId(int currentUserId);
	
	

}

