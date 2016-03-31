package com.lotut.pms.util;

import org.springframework.security.core.context.SecurityContextHolder;

import com.lotut.pms.domain.User;

public class PrincipalUtils {
	public static User getCurrentPrincipal() {
		return (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}
	
	public static int getCurrentUserId() {
		return  getCurrentPrincipal().getUserId();
	}
}
