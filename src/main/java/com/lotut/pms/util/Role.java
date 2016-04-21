package com.lotut.pms.util;

public enum Role {
	ROLE_ADMIN("ROLE_ADMIN"), 
	ROLE_ORDER("ROLE_ORDER"),
	ROLE_USER("ROLE_USER");
	
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
