package com.lotut.pms.util;

public enum Role {
	ROLE_ADMIN("ROLE_ADMIN"), 
	ROLE_ORDER("ROLE_ORDER"),
	ROLE_USER("ROLE_USER"),
	ROLE_TRADER("ROLE_TRADER"),
	ROLE_PROXY_ORG("ROLE_PROXY_ORG"),
	ROLE_CUSTOMER_SUPPORT("ROLE_CUSTOMER_SUPPORT"),
	ROLE_TECH("ROLE_TECH"),
	ROLE_PROCESS("ROLE_PROCESS"),
	ROLE_PLATFORM("ROLE_PLATFORM");
	
	private String roleName;
	
	private Role(String roleName) {
		this.roleName = roleName;
	}
	
	public String getRoleName() {
		return this.roleName;
	}
	
	public static void main(String[] args) {
		System.out.println(Role.ROLE_ADMIN.getRoleName());
	}
}
