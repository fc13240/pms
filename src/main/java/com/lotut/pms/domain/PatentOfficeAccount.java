package com.lotut.pms.domain;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class PatentOfficeAccount {

	private long accountId;
	private int userId;
	private String name;
	private String username;
	private String password;
	private Date patentUpdateTime;
	public long getAccountId() {
		return accountId;
	}
	public void setAccountId(long accountId) {
		this.accountId = accountId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String userName) {
		this.username = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getPatentUpdateTime() {
		return patentUpdateTime;
	}
	public void setPatentUpdateTime(Date patentUpdateTime) {
		this.patentUpdateTime = patentUpdateTime;
	}

	

	

}
