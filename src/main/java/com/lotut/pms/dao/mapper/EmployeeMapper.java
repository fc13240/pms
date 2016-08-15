package com.lotut.pms.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.CustomerSupport;
import com.lotut.pms.domain.Process;
import com.lotut.pms.domain.Tech;


public interface EmployeeMapper {

	List<CustomerSupport> getCustomerSupportList(int proxyOrgId);
	
	List<Tech> getTechList(int proxyOrgId);
	
	List<Process> getProcessList(int proxyOrgId);

	void addOrUpdateCustomerSupport(CustomerSupport customerSupport);
	
	void addOrUpdateTech(Tech tech);
	
	void addOrUpdateProcess(Process process);

	void deleteCustomerSupport(int id);
	
	void deleteTech(int id);
	
	void deleteProcess(int id);

	void changeCustomerSupportRemarkName(@Param("id") int id,@Param("remarkName") String remarkName);

	void changeTechRemarkName(@Param("id") int id, @Param("remarkName") String remarkName);

	void changeProcessRemarkName(@Param("id") int id, @Param("remarkName") String remarkName);
	
	void insertGroupMember(@Param("userId") int userId,@Param("roleName") String roleName);

}
