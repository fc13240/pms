package com.lotut.pms.service.impl;


import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.lotut.pms.dao.EmployeeDao;
import com.lotut.pms.domain.CustomerSupport;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.ProcessPerson;
import com.lotut.pms.domain.ProxyOrg;
import com.lotut.pms.domain.TechPerson;
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
	@Transactional
	public void deleteProxyOrg(int orgId) {
		List<CustomerSupport> customerSupports = employeeDao.getCustomerSupportList(orgId);
		if(customerSupports != null) {
			for(CustomerSupport cs : customerSupports) {
				deleteCustomerSupport(cs.getId());
			}
		}
		
		List<TechPerson> techPerson = employeeDao.getTechPersonList(orgId);
		if(techPerson != null) {
			for(TechPerson tp : techPerson) {
				deleteTechPerson(tp.getId());
			}
		}
		
		List<ProcessPerson> processPerson = employeeDao.getProcessPersonList(orgId);
		if(processPerson != null) {
			for(ProcessPerson pp : processPerson) {
				deleteProcessPerson(pp.getId());
			}
		}
		
		employeeDao.deleteProxyOrg(orgId);
		
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

	
	@Override
	public void changeProxyOrgRemarkName(int orgId, String remarkName) {
		employeeDao.changeProxyOrgRemarkName(orgId, remarkName);
		
	}

	@Override
	public List<ProxyOrg> getProxyOrgList(int parentOrgId) {
		return employeeDao.getProxyOrgList(parentOrgId);
	}


	@Override
	@Transactional
	public void addOrUpdateProxyOrg(ProxyOrg proxyOrg) {
		employeeDao.addOrUpdateProxyOrg(proxyOrg);
		boolean isNewProxyOrg = proxyOrg.getOrgId() != 0;
		if (isNewProxyOrg) {
			employeeDao.insertGroupMember(proxyOrg.getOrgUserId(),Role.ROLE_PROXY_ORG.getRoleName());
		}
		
	}


	@Override
	public int getOrgIdByUserId(int currentUserId) {
		return employeeDao.getOrgIdByUserId(currentUserId);
	}


	@Override
	public int getOrgIdByCustomerSupportId(int currentUserId) {
		return employeeDao.getOrgIdByCustomerSupportId(currentUserId);
	}


	@Override
	@Transactional
	public void addOrUpdateTopProxyOrg(ProxyOrg proxyOrg) {
		ProxyOrg org = employeeDao.getOrgByParentOrgId(proxyOrg.getOrgUserId());
		if(org == null) {
			employeeDao.addOrUpdateTopProxyOrg(proxyOrg);
			employeeDao.insertGroupMember(proxyOrg.getOrgUserId(),Role.ROLE_PROXY_ORG.getRoleName());
		}
	}


	@Override
	public List<ProxyOrg> getTopProxyOrgListByPage(Page page) {
		return employeeDao.getTopProxyOrgListByPage(page);
	}
	
	@Override
	public List<ProxyOrg> getTopProxyOrgList() {
		return employeeDao.getTopProxyOrgList();
	}


	@Override
	public List<CustomerSupport> searchCustomersByProxyId(String keyword, int currentUserId) {
		return employeeDao.searchCustomersByProxyId(keyword, currentUserId);
	}


	@Override
	public List<TechPerson> searchTechPersonByProxyId(String keyword, int currentUserId) {
		return employeeDao.searchTechPersonByProxyId(keyword, currentUserId);
	}


	@Override
	public List<ProcessPerson> searchProcessPersonByProxyId(String keyword, int currentUserId) {
		return employeeDao.searchProcessPersonByProxyId(keyword, currentUserId);
	}


	@Override
	public List<ProxyOrg> searchProxyOrgId(String keyword, Integer parentOrgId) {
		return employeeDao.searchProxyOrgId(keyword, parentOrgId);
	}


	@Override
	public List<ProxyOrg> getProxyOrgListByPage(Page page) {
		return employeeDao.getProxyOrgListByPage(page);
	}


	@Override
	public int getProxyOrgCount(int proxyOrgId) {
		return employeeDao.getProxyOrgCount(proxyOrgId);
	}


	@Override
	public List<CustomerSupport> getCustomerSupportListByPage(Page page) {
		return employeeDao.getCustomerSupportListByPage(page);
	}


	@Override
	public int getCustomerSupportCount(int proxyOrgId) {
		return employeeDao.getCustomerSupportCount(proxyOrgId);
	}


	@Override
	public List<TechPerson> getTechPersonListByPage(Page page) {
		return employeeDao.getTechPersonListByPage(page);
	}


	@Override
	public int getTechPersonCount(int proxyOrgId) {
		return employeeDao.getTechPersonCount(proxyOrgId);
	}


	@Override
	public List<ProcessPerson> getProcessPersonListByPage(Page page) {
		return employeeDao.getProcessPersonListByPage(page);
	}


	@Override
	public int getProcessPersonCount(int proxyOrgId) {
		return employeeDao.getProcessPersonCount(proxyOrgId);
	}

	@Override
	public int getTopProxyOrgListCount() {
		return employeeDao.getTopProxyOrgListCount();
	}

}

