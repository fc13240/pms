package com.lotut.pms.util;

import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

import com.lotut.pms.domain.User;

public class PrincipalUtils {
	public static User getCurrentPrincipal() {
		return (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}
	
	public static int getCurrentUserId() {
		return  getCurrentPrincipal().getUserId();
	}
	
	public static boolean hasAuthority(String role) {
		User user = getCurrentPrincipal();
		Set<GrantedAuthority> authorities = user.getAuthorities();
		for (GrantedAuthority authority: authorities) {
			if (authority.getAuthority().equalsIgnoreCase(role)) {
				return true;
			}
		}
		return false;
	}
	
	public static boolean isAdmin() {
		return PrincipalUtils.hasAuthority(Role.ROLE_ADMIN.getRoleName());
	}
	
	public static boolean isOrderProcessor() {
		return PrincipalUtils.hasAuthority(Role.ROLE_ORDER.getRoleName());
	}
	
	public static boolean isNormalUser() {
		return PrincipalUtils.hasAuthority(Role.ROLE_USER.getRoleName());
	}
	
	public static boolean isTraderUser() {
		return PrincipalUtils.hasAuthority(Role.ROLE_TRADER.getRoleName());
	}
	
	public static boolean isProxyOrg() {
		return PrincipalUtils.hasAuthority(Role.ROLE_PROXY_ORG.getRoleName());
	}
	
	public static boolean isCustomerSupport() {
		return PrincipalUtils.hasAuthority(Role.ROLE_CUSTOMER_SUPPORT.getRoleName());
	}
	
	public static boolean isTech() {
		return PrincipalUtils.hasAuthority(Role.ROLE_TECH.getRoleName());
	}
	
	public static boolean isProcess() {
		return PrincipalUtils.hasAuthority(Role.ROLE_PROCESS.getRoleName());
	}
}
