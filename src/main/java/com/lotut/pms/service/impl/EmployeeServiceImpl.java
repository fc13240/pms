package com.lotut.pms.service.impl;


import java.util.List;


import org.springframework.transaction.annotation.Transactional;
import com.lotut.pms.dao.EmployeeDao;
import com.lotut.pms.domain.CustomerSupport;
import com.lotut.pms.service.EmployeeService;

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
			employeeDao.insertGroupMember(customerSupport.getUserId());
		}
	}
	
	
	
	
	@Override
	@Transactional
	public void deleteCustomerSupport(int id) {
		employeeDao.deleteCustomerSupport(id);	
		
	}
	@Override
	public void changeRemarkName(int id, String remarkName) {
		employeeDao.changeRemarkName(id, remarkName);	
		
	}

}

