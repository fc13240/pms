package com.lotut.pms.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.EmployeeDao;
import com.lotut.pms.dao.mapper.EmployeeMapper;
import com.lotut.pms.domain.CustomerSupport;
import com.lotut.pms.domain.Tech;
import com.lotut.pms.domain.Process;

public class EmployeeMybatisDao extends SqlSessionDaoSupport implements EmployeeDao{
	private EmployeeMapper employeeMapper;
	
	public EmployeeMapper getEmployeeMapper() {
		return employeeMapper;
	}

	public void setEmployeeMapper(EmployeeMapper employeeMapper) {
		this.employeeMapper = employeeMapper;
	}

	
	@Override
	public List<CustomerSupport> getCustomerSupportList(int proxyOrgId) {
		
		return employeeMapper.getCustomerSupportList(proxyOrgId);
	}

	@Override
	public List<Tech> getTechList(int proxyOrgId) {
		return employeeMapper.getTechList(proxyOrgId);
	}
	
	@Override
	public List<Process> getProcessList(int proxyOrgId) {
		return employeeMapper.getProcessList(proxyOrgId);
	}
	
	
	@Override
	public void addOrUpdateCustomerSupport(CustomerSupport customerSupport) {
		employeeMapper.addOrUpdateCustomerSupport(customerSupport);
	}

	@Override
	public void addOrUpdateTech(Tech tech) {
		employeeMapper.addOrUpdateTech(tech);
	}
	
	@Override
	public void addOrUpdateProcess(Process process) {
		employeeMapper.addOrUpdateProcess(process);
	}
	
	
	@Override
	public void deleteCustomerSupport(int id) {
		employeeMapper.deleteCustomerSupport(id);
	}

	@Override
	public void deleteTech(int id) {
		employeeMapper.deleteTech(id);
	}
	
	@Override
	public void deleteProcess(int id) {
		employeeMapper.deleteProcess(id);
	}
	
	
	@Override
	public void changeCustomerSupportRemarkName(int id, String remarkName) {
		employeeMapper.changeCustomerSupportRemarkName(id,remarkName);
	}

	@Override
	public void changeTechRemarkName(int id, String remarkName) {
		employeeMapper.changeTechRemarkName(id,remarkName);
	}

	@Override
	public void changeProcessRemarkName(int id, String remarkName) {
		employeeMapper.changeProcessRemarkName(id,remarkName);
	}

	
	@Override
	public void insertGroupMember(int userId,String roleName) {
		employeeMapper.insertGroupMember(userId,roleName);
	}
}
