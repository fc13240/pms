package com.lotut.pms.domain;

import java.util.List;

public class Friend {
	private int friendId;
	private String remarkName;
	private User user;
	private List<GroupMembers> userTypes;
	private User customerOrganization;
	private User processOrganization;
	private User techOrganization;
	private User proxyOrganization;
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
	public User getCustomerOrganization() {
		return customerOrganization;
	}
	public void setCustomerOrganization(User customerOrganization) {
		this.customerOrganization = customerOrganization;
	}
	public User getProcessOrganization() {
		return processOrganization;
	}
	public void setProcessOrganization(User processOrganization) {
		this.processOrganization = processOrganization;
	}
	public User getTechOrganization() {
		return techOrganization;
	}
	public void setTechOrganization(User techOrganization) {
		this.techOrganization = techOrganization;
	}
	
	public User getProxyOrganization() {
		return proxyOrganization;
	}
	public void setProxyOrganization(User proxyOrganization) {
		this.proxyOrganization = proxyOrganization;
	}
	public String getOrganization(){
		if(this.customerOrganization!=null){
			return customerOrganization.getUsername();
		}
		if(this.processOrganization!=null){
			return processOrganization.getUsername();
		}
		if(this.techOrganization!=null){
			return techOrganization.getUsername();
		}
		if(this.proxyOrganization!=null){
			return proxyOrganization.getUsername();
		}
		return "";
		
	}
	
}
