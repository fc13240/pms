package com.lotut.pms.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.EmployeeDao;
import com.lotut.pms.dao.mapper.EmployeeMapper;
import com.lotut.pms.domain.CustomerSupport;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.ProcessPerson;
import com.lotut.pms.domain.ProxyOrg;
import com.lotut.pms.domain.TechPerson;

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
	public List<TechPerson> getTechPersonList(int proxyOrgId) {
		return employeeMapper.getTechPersonList(proxyOrgId);
	}
	
	@Override
	public List<ProcessPerson> getProcessPersonList(int proxyOrgId) {
		return employeeMapper.getProcessPersonList(proxyOrgId);
	}
	
	
	@Override
	public void addOrUpdateCustomerSupport(CustomerSupport customerSupport) {
		employeeMapper.addOrUpdateCustomerSupport(customerSupport);
	}

	@Override
	public void addOrUpdateTechPerson(TechPerson techPerson) {
		employeeMapper.addOrUpdateTechPerson(techPerson);
	}
	
	@Override
	public void addOrUpdateProcessPerson(ProcessPerson processPerson) {
		employeeMapper.addOrUpdateProcessPerson(processPerson);
	}
	
	
	@Override
	public void deleteCustomerSupport(int id) {
		employeeMapper.deleteCustomerSupport(id);
	}

	@Override
	public void deleteTechPerson(int id) {
		employeeMapper.deleteTechPerson(id);
	}
	
	@Override
	public void deleteProcessPerson(int id) {
		employeeMapper.deleteProcessPerson(id);
	}
	
	@Override
	public void deleteProxyOrg(int orgId) {
		employeeMapper.deleteProxyOrg(orgId);
		
	}
	
	@Override
	public void changeCustomerSupportRemarkName(int id, String remarkName) {
		employeeMapper.changeCustomerSupportRemarkName(id,remarkName);
	}

	@Override
	public void changeTechPersonRemarkName(int id, String remarkName) {
		employeeMapper.changeTechPersonRemarkName(id,remarkName);
	}

	@Override
	public void changeProcessPersonRemarkName(int id, String remarkName) {
		employeeMapper.changeProcessPersonRemarkName(id,remarkName);
	}

	@Override
	public void changeProxyOrgRemarkName(int orgId, String remarkName) {
		employeeMapper.changeProxyOrgRemarkName(orgId,remarkName);
		
	}
	
	@Override
	public void insertGroupMember(int userId,String roleName) {
		employeeMapper.insertGroupMember(userId,roleName);
	}



	@Override
	public void addOrUpdateProxyOrg(ProxyOrg proxyOrg) {
		employeeMapper.addOrUpdateProxyOrg(proxyOrg);
		
	}

	@Override
	public int getOrgIdByUserId(int currentUserId) {
		return employeeMapper.getOrgIdByUserId(currentUserId);
	}

	@Override
	public int getOrgIdByCustomerSupportId(int currentUserId) {
		return employeeMapper.getOrgIdByCustomerSupportId(currentUserId);
	}

	@Override
	public void addOrUpdateTopProxyOrg(ProxyOrg proxyOrg) {
		employeeMapper.addOrUpdateTopProxyOrg(proxyOrg);
		
	}

	@Override
	public List<ProxyOrg> getTopProxyOrgListByPage(Page page) {
		return employeeMapper.getTopProxyOrgListByPage(page);
	}
	
	@Override
	public List<ProxyOrg> getTopProxyOrgList() {
		return employeeMapper.getTopProxyOrgList();
	}

	@Override
	public ProxyOrg getOrgByParentOrgId(int orgUserId) {
		return employeeMapper.getOrgByParentOrgId(orgUserId);
	}

	@Override
	public List<CustomerSupport> searchCustomersByProxyId(String keyword, int currentUserId) {
		return employeeMapper.searchCustomersByProxyId(keyword, currentUserId);
	}

	@Override
	public List<TechPerson> searchTechPersonByProxyId(String keyword, int currentUserId) {
		return employeeMapper.searchTechPersonByProxyId(keyword, currentUserId);
	}

	@Override
	public List<ProcessPerson> searchProcessPersonByProxyId(String keyword, int currentUserId) {
		return employeeMapper.searchProcessPersonByProxyId(keyword, currentUserId);
	}

	@Override
	public List<ProxyOrg> searchProxyOrgId(String keyword, Integer parentOrgId) {
		return employeeMapper.searchProxyOrgId(keyword, parentOrgId);
	}

	@Override
	public List<ProxyOrg> getProxyOrgList(int parentOrgId) {
		return employeeMapper.getProxyOrgList(parentOrgId);
	}

	@Override
	public List<ProxyOrg> getProxyOrgListByPage(Page page) {
		return employeeMapper.getProxyOrgListByPage(page);
	}

	@Override
	public int getProxyOrgCount(int proxyOrgId) {
		return employeeMapper.getProxyOrgCount(proxyOrgId);
	}

	@Override
	public List<CustomerSupport> getCustomerSupportListByPage(Page page) {
		return employeeMapper.getCustomerSupportListByPage(page);
	}

	@Override
	public int getCustomerSupportCount(int proxyOrgId) {
		return employeeMapper.getCustomerSupportCount(proxyOrgId);
	}

	@Override
	public List<TechPerson> getTechPersonListByPage(Page page) {
		return employeeMapper.getTechPersonListByPage(page);
	}

	@Override
	public int getTechPersonCount(int proxyOrgId) {
		return employeeMapper.getTechPersonCount(proxyOrgId);
	}

	@Override
	public List<ProcessPerson> getProcessPersonListByPage(Page page) {
		return employeeMapper.getProcessPersonListByPage(page);
	}

	@Override
	public int getProcessPersonCount(int proxyOrgId) {
		return employeeMapper.getProcessPersonCount(proxyOrgId);
	}

	@Override
	public int getTopProxyOrgListCount() {
		return employeeMapper.getTopProxyOrgListCount();
	}





	
}
