package com.lotut.pms.domain;

import java.util.List;
import java.util.stream.Collectors;

public class Friend {
	private int friendId;
//	private String username;
//	private String realname;
//	private String email;
//	private String phone;
	private String remarkName;
	private User user;
	private List<GroupMembers> userTypes;
	private User organization;
	public int getFriendId() {
		return friendId;
	}
	public void setFriendId(int friendId) {
		this.friendId = friendId;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<GroupMembers> getUserTypes() {
		return userTypes;
	}
	public void setUserTypes(List<GroupMembers> userType) {
		this.userTypes = userType;
	}
	public User getOrganization() {
		return organization;
	}
	public void setOrganization(User organization) {
		this.organization = organization;
	}
	public String getRemarkName() {
		return remarkName;
	}
	public void setRemarkName(String remarkName) {
		this.remarkName = remarkName;
	}
	
	public String getUserTypeAsString() {
		if(this.userTypes != null){
			if(this.userTypes.size()==1){
				return "普通用户";
			}else{
			for (int i = 0; i < this.userTypes.size(); i++) {
				if(this.userTypes.get(i).getGroupId()==4){
					return "代理机构";
				}
				if(this.userTypes.get(i).getGroupId()==5)
				{
					return "客服";
				}
				if(this.userTypes.get(i).getGroupId()==6){
					return "技术员";
				}
				if(this.userTypes.get(i).getGroupId()==7){
					return "流程员";
						}
					}
				}
			
		}
		return "";
	}
	
}
