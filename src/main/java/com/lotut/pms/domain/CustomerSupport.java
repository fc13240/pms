package com.lotut.pms.domain;

public class CustomerSupport {
	private int customerId;
	private int proxyOrgId;
	private String remarkName;
	private User customer;
	
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public int getProxyOrgId() {
		return proxyOrgId;
	}
	public void setProxyOrgId(int proxyOrgId) {
		this.proxyOrgId = proxyOrgId;
	}
	public String getRemarkName() {
		return remarkName;
	}
	public void setRemarkName(String remarkName) {
		this.remarkName = remarkName;
	}
	public User getCustomer() {
		return customer;
	}
	public void setCustomer(User customer) {
		this.customer = customer;
	}
	
	
}
