package com.lotut.pms.domain;

import java.util.List;
import java.util.stream.Collectors;

public class CommonInventor {
	private int inventorId;
	private String inventorName;
	private String inventorNumber;
	private String inventorNationality;
	private	int inventorMobile;
	private String  inventorEmail;
	private String  inventorComment;
	private int userId;
	private List<User> shareUsers;
	private String inventorUrl;
	
	
	public String getInventorUrl() {
		return inventorUrl;
	}
	public void setInventorUrl(String inventorUrl) {
		this.inventorUrl = inventorUrl;
	}
	public int getInventorId() {
		return inventorId;
	}
	public void setInventorId(int inventorId) {
		this.inventorId = inventorId;
	}
	public String getInventorName() {
		return inventorName;
	}
	public void setInventorName(String inventorName) {
		this.inventorName = inventorName;
	}
	public String getInventorNumber() {
		return inventorNumber;
	}
	public void setInventorNumber(String inventorNumber) {
		this.inventorNumber = inventorNumber;
	}
	public String getInventorNationality() {
		return inventorNationality;
	}
	public void setInventorNationality(String inventorNationality) {
		this.inventorNationality = inventorNationality;
	}
	public int getInventorMobile() {
		return inventorMobile;
	}
	public void setInventorMobile(int inventorMobile) {
		this.inventorMobile = inventorMobile;
	}
	public String getInventorEmail() {
		return inventorEmail;
	}
	public void setInventorEmail(String inventorEmail) {
		this.inventorEmail = inventorEmail;
	}
	public String getInventorComment() {
		return inventorComment;
	}
	public void setInventorComment(String inventorComment) {
		this.inventorComment = inventorComment;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public List<User> getShareUsers() {
		return shareUsers;
	}
	public void setShareUsers(List<User> shareUsers) {
		this.shareUsers = shareUsers;
	}
	public String getShareUsersAsString() {
		if (this.shareUsers != null) {
			return String.join(";", this.shareUsers.stream().map(User::getUsername).collect(Collectors.toList()));
		}
		
		return "";
	}
	
	
	

}
