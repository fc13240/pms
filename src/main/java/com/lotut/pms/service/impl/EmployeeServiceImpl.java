package com.lotut.pms.service.impl;


import java.util.List;


import org.springframework.transaction.annotation.Transactional;
import com.lotut.pms.dao.EmployeeDao;
import com.lotut.pms.domain.CustomerSupport;
import com.lotut.pms.domain.Tech;
import com.lotut.pms.domain.Process;
import com.lotut.pms.service.EmployeeService;
import com.lotut.pms.util.Role;

public class EmployeeServiceImpl implements EmployeeService {
	private EmployeeDao employeeDao;

	public EmployeeServiceImpl(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}
	@Override
	public List<CustomerSupport> getCustomerSupportList(int proxyOrgId) {
		return employeeDao.getCustomerSupportList(proxyOrgId);
	}
	@Override
	@Transactional
	public void addOrUpdateCustomerSupport(CustomerSupport customerSupport) {
		employeeDao.addOrUpdateCustomerSupport(customerSupport);
		boolean isNewCustomerSupport = customerSupport.getId() != 0;
		if (isNewCustomerSupport) {
			employeeDao.insertGroupMember(customerSupport.getUserId(),Role.ROLE_CUSTOMER_SUPPORT.getRoleName());
		}
	}
	
	@Override
	@Transactional
	public void addOrUpdateTech(Tech tech) {
		employeeDao.addOrUpdateTech(tech);
		boolean isNewTech = tech.getId() != 0;
		if (isNewTech) {
			employeeDao.insertGroupMember(tech.getUserId(),Role.ROLE_TECH.getRoleName());
		}
	}
	
	
	@Override
	@Transactional
	public void deleteCustomerSupport(int id) {
		employeeDao.deleteCustomerSupport(id);	
		
	}
	@Override
	public void changeCustomerSupportRemarkName(int id, String remarkName) {
		employeeDao.changeCustomerSupportRemarkName(id, remarkName);	
		
	}
	@Override
	public List<Tech> getTechList(int proxyOrgId) {
		return employeeDao.getTechList(proxyOrgId);
	}
	@Override
	@Transactional
	public void deleteTech(int id) {
		employeeDao.deleteTech(id);	
		
	}
	@Override
	public void changeTechRemarkName(int id, String remarkName) {
		employeeDao.changeTechRemarkName(id, remarkName);	
	}
	@Override
	public List<Process> getProcessList(int proxyOrgId) {
		return  employeeDao.getProcessList(proxyOrgId);
	}
	@Override
	public void addOrUpdateProcess(Process process) {
		employeeDao.addOrUpdateProcess(process);
		boolean isNewProcess = process.getId() != 0;
		if (isNewProcess) {
			employeeDao.insertGroupMember(process.getUserId(),Role.ROLE_PROCESS.getRoleName());
		}
	}
	@Override
	@Transactional
	public void deleteProcess(int id) {
		employeeDao.deleteProcess(id);	
		
	}
	@Override
	public void changeProcessRemarkName(int id, String remarkName) {
		employeeDao.changeProcessRemarkName(id, remarkName);
		
	}

}

