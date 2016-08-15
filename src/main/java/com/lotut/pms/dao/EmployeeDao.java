package com.lotut.pms.dao;

import java.util.List;

import com.lotut.pms.domain.CustomerSupport;
import com.lotut.pms.domain.Tech;

public interface EmployeeDao {

	List<CustomerSupport> getCustomerSupportList(int proxyOrgId);

	void addOrUpdateCustomerSupport(CustomerSupport customerSupport);

	void deleteCustomerSupport(int id);

	void changeCustomerSupportRemarkName(int id, String remarkName);

	void insertGroupMember(int userId,String roleName);

	List<Tech> getTechList(int proxyOrgId);

	void addOrUpdateTech(Tech tech);

	void deleteTech(int id);

	void changeTechRemarkName(int id, String remarkName);

}
