package com.lotut.pms.domain;

public class Friend {
	private int friendId;
	private String username;
	private String realname;
	private String email;
	private String phone;
	private String remarkName;
	
	public int getFriendId() {
		return friendId;
	}
	public void setFriendId(int friendId) {
		this.friendId = friendId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getRemarkName() {
		if (remarkName == null) {
			return realname;
		}
		return remarkName;
	}
	public void setRemarkName(String remarkName) {
		this.remarkName = remarkName;
	}
}
