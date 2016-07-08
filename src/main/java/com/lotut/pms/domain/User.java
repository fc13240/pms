package com.lotut.pms.domain;

import java.io.Serializable;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.SpringSecurityCoreVersion;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.util.Assert;

public class User implements Serializable, UserDetails {
	private static final long serialVersionUID = 1383587700322729576L;
	private int userId;
	private String username;
	private String password;
	private String visiblePassword;
	boolean enabled;
	private String name;
	private String phone;
	private String email;
	private Date joinDate;
	private Set<GrantedAuthority> authorities = new HashSet<>();
	
	public User() {
		
	}
	
	public User(int userId, String username, String password, String visiblePassword,boolean enabled, String name, String email, 
			String phone, Date joinDate, Collection<? extends GrantedAuthority> authorities) {
		this.userId = userId;
		this.username = username;
		this.password = password;
		this.visiblePassword = visiblePassword;
		this.enabled = enabled;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.joinDate = joinDate;
		this.authorities = Collections.unmodifiableSet(sortAuthorities(authorities));
	}
	

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	
	public int getUserId() {
		return userId;
	}


	@Override
	public boolean isAccountNonExpired() {
		return true;
	}


	@Override
	public boolean isAccountNonLocked() {
		return true;
	}


	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}


	@Override
	public boolean isEnabled() {
		return true;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}
	

	public String getVisiblePassword() {
		return visiblePassword;
	}

	public void setVisiblePassword(String visiblePassword) {
		this.visiblePassword = visiblePassword;
	}

	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public Date getJoinDate() {
		return joinDate;
	}


	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}


	public Set<GrantedAuthority> getAuthorities() {
		return authorities;
	}


	public void setAuthorities(Set<GrantedAuthority> authorities) {
		this.authorities = authorities;
	}


	@Override
	public String toString() {
		return this.username;
	}
	
	private static SortedSet<GrantedAuthority> sortAuthorities(
			Collection<? extends GrantedAuthority> authorities) {
		Assert.notNull(authorities, "Cannot pass a null GrantedAuthority collection");
		// Ensure array iteration order is predictable (as per
		// UserDetails.getAuthorities() contract and SEC-717)
		SortedSet<GrantedAuthority> sortedAuthorities = new TreeSet<GrantedAuthority>(
				new AuthorityComparator());

		for (GrantedAuthority grantedAuthority : authorities) {
			Assert.notNull(grantedAuthority,
					"GrantedAuthority list cannot contain any null elements");
			sortedAuthorities.add(grantedAuthority);
		}

		return sortedAuthorities;
	}
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	private static class AuthorityComparator implements Comparator<GrantedAuthority>, Serializable {
		private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;

		public int compare(GrantedAuthority g1, GrantedAuthority g2) {
			// Neither should ever be null as each entry is checked before
			// adding it to
			// the set.
			// If the authority is null, it is a custom authority and should
			// precede
			// others.
			if (g2.getAuthority() == null) {
				return -1;
			}

			if (g1.getAuthority() == null) {
				return 1;
			}

			return g1.getAuthority().compareTo(g2.getAuthority());
		}
	}
}
