package com.lotut.pms.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.CustomerSupport;

public interface EmployeeMapper {

	List<CustomerSupport> getCustomerSupportList(int proxyOrgId);

	void addOrUpdateCustomerSupport(CustomerSupport customerSupport);

	void deleteCustomerSupport(int id);

	void changeRemarkName(@Param("id") int id,@Param("remarkName") String remarkName);

	void insertGroupMember(int userId);

}
