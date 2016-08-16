package com.lotut.pms.service.impl;


import java.util.List;


import org.springframework.transaction.annotation.Transactional;
import com.lotut.pms.dao.EmployeeDao;
import com.lotut.pms.domain.CustomerSupport;
import com.lotut.pms.domain.TechPerson;
import com.lotut.pms.domain.ProcessPerson;
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
	public List<TechPerson> getTechPersonList(int proxyOrgId) {
		return employeeDao.getTechPersonList(proxyOrgId);
	}
	
	@Override
	public List<ProcessPerson> getProcessPersonList(int proxyOrgId) {
		return  employeeDao.getProcessPersonList(proxyOrgId);
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
	public void addOrUpdateTechPerson(TechPerson techPerson) {
		employeeDao.addOrUpdateTechPerson(techPerson);
		boolean isNewTechPerson = techPerson.getId() != 0;
		if (isNewTechPerson) {
			employeeDao.insertGroupMember(techPerson.getUserId(),Role.ROLE_TECH.getRoleName());
		}
	}
	
	@Override
	@Transactional
	public void addOrUpdateProcessPerson(ProcessPerson processPerson) {
		employeeDao.addOrUpdateProcessPerson(processPerson);
		boolean isNewProcessPerson = processPerson.getId() != 0;
		if (isNewProcessPerson) {
			employeeDao.insertGroupMember(processPerson.getUserId(),Role.ROLE_PROCESS.getRoleName());
		}
	}
	
	
	@Override
	@Transactional
	public void deleteCustomerSupport(int id) {
		employeeDao.deleteCustomerSupport(id);		
	}
	
	@Override
	@Transactional
	public void deleteTechPerson(int id) {
		employeeDao.deleteTechPerson(id);	
	}
	
	@Override
	@Transactional
	public void deleteProcessPerson(int id) {
		employeeDao.deleteProcessPerson(id);	
	}
	
	
	@Override
	public void changeCustomerSupportRemarkName(int id, String remarkName) {
		employeeDao.changeCustomerSupportRemarkName(id, remarkName);	
	}
	
	@Override
	public void changeTechPersonRemarkName(int id, String remarkName) {
		employeeDao.changeTechPersonRemarkName(id, remarkName);	
	}
	
	@Override
	public void changeProcessPersonRemarkName(int id, String remarkName) {
		employeeDao.changeProcessPersonRemarkName(id, remarkName);
	}
}

