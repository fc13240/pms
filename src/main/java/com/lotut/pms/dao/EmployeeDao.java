package com.lotut.pms.dao;

import java.util.List;

import com.lotut.pms.domain.CustomerSupport;

public interface EmployeeDao {

	List<CustomerSupport> getCustomerSupportList(int proxyOrgId);

	void addOrUpdateCustomerSupport(CustomerSupport customerSupport);

	void deleteCustomerSupport(int id);

	void changeRemarkName(int id, String remarkName);

	void insertGroupMember(int userId);

}
