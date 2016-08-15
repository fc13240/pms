package com.lotut.pms.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.CustomerSupport;
import com.lotut.pms.domain.Process;
import com.lotut.pms.domain.Tech;


public interface EmployeeMapper {

	List<CustomerSupport> getCustomerSupportList(int proxyOrgId);

	void addOrUpdateCustomerSupport(CustomerSupport customerSupport);

	void deleteCustomerSupport(int id);

	void changeCustomerSupportRemarkName(@Param("id") int id,@Param("remarkName") String remarkName);

	void insertGroupMember(@Param("userId") int userId,@Param("roleName") String roleName);

	List<Tech> getTechList(int proxyOrgId);

	void addOrUpdateTech(Tech tech);

	void deleteTech(int id);

	void changeTechRemarkName(@Param("id") int id, @Param("remarkName") String remarkName);

	List<Process> getProcessList(int proxyOrgId);

	void addOrUpdateProcess(Process process);

	void deleteProcess(int id);

	void changeProcessRemarkName(@Param("id") int id, @Param("remarkName") String remarkName);

}
