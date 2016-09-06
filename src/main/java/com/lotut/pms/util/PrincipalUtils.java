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
	
	public static boolean isAdmin() {//管理员
		return PrincipalUtils.hasAuthority(Role.ROLE_ADMIN.getRoleName());
	}
	
	public static boolean isOrderProcessor() {//订单管理者
		return PrincipalUtils.hasAuthority(Role.ROLE_ORDER.getRoleName());
	}
	
	public static boolean isNormalUser() {//默认用户
		return PrincipalUtils.hasAuthority(Role.ROLE_USER.getRoleName());
	}
	
	public static boolean isTraderUser() {//专利交易者
		return PrincipalUtils.hasAuthority(Role.ROLE_TRADER.getRoleName());
	}
	
	public static boolean isProxyOrg() {//代理机构
		return PrincipalUtils.hasAuthority(Role.ROLE_PROXY_ORG.getRoleName());
	}
	
	public static boolean isCustomerSupport() {//客服
		return PrincipalUtils.hasAuthority(Role.ROLE_CUSTOMER_SUPPORT.getRoleName());
	}
	
	public static boolean isTech() {//技术人员
		return PrincipalUtils.hasAuthority(Role.ROLE_TECH.getRoleName());
	}
	
	public static boolean isProcess() {//流程员
		return PrincipalUtils.hasAuthority(Role.ROLE_PROCESS.getRoleName());
	}
}
