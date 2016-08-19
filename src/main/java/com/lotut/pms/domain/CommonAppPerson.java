package com.lotut.pms.domain;

import java.util.List;
import java.util.stream.Collectors;

public class CommonAppPerson {
	private int appPersonId;
	private String name;
	private int type;
	private String typeName;
	private AppPersonType appPersonType;
	private String peopleNumber;
	private String postcodeAddress;
	private String feeReduceTransactionStatus;
	private String otherInfo;
	private int userId;
	private List<User> shareUsers;
	private String appPersonUrl;
	private String transactionIdentityId;
	private String transactionYear ;
	
	
	
	public String getTransactionIdentityId() {
		return transactionIdentityId;
	}
	public void setTransactionIdentityId(String transactionIdentityId) {
		this.transactionIdentityId = transactionIdentityId;
	}
	public String getTransactionYear() {
		return transactionYear;
	}
	public void setTransactionYear(String transactionYear) {
		this.transactionYear = transactionYear;
	}
	public String getAppPersonUrl() {
		return appPersonUrl;
	}
	public void setAppPersonUrl(String appPersonUrl) {
		this.appPersonUrl = appPersonUrl;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public List<User> getShareUsers() {
		return shareUsers;
	}
	public void setShareUsers(List<User> shareUsers) {
		this.shareUsers = shareUsers;
	}
	public int getAppPersonId() {
		return appPersonId;
	}
	public void setAppPersonId(int appPersonId) {
		this.appPersonId = appPersonId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	public AppPersonType getAppPersonType() {
		return appPersonType;
	}
	public void setAppPersonType(AppPersonType appPersonType) {
		this.appPersonType = appPersonType;
	}
	public String getPeopleNumber() {
		return peopleNumber;
	}
	public void setPeopleNumber(String peopleNumber) {
		this.peopleNumber = peopleNumber;
	}
	public String getPostcodeAddress() {
		return postcodeAddress;
	}
	public void setPostcodeAddress(String postcodeAddress) {
		this.postcodeAddress = postcodeAddress;
	}
	
	public String getFeeReduceTransactionStatus() {
		return feeReduceTransactionStatus;
	}
	public void setFeeReduceTransactionStatus(String feeReduceTransactionStatus) {
		this.feeReduceTransactionStatus = feeReduceTransactionStatus;
	}
	public String getOtherInfo() {
		return otherInfo;
	}
	public void setOtherInfo(String otherInfo) {
		this.otherInfo = otherInfo;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public String getShareUsersAsString() {
		if (this.shareUsers != null) {
			return String.join(";", this.shareUsers.stream().map(User::getUsername).collect(Collectors.toList()));
		}
		
		return "";
	}
//	public CommonAppPerson(int appPersonId, String name, int type, String typeName, AppPersonType appPersonType,
//			String peopleNumber, String postcodeAddress, String recordStatus, String otherInfo) {
//		super();
//		this.appPersonId = appPersonId;
//		this.name = name;
//		this.type = type;
//		this.typeName = typeName;
//		this.appPersonType = new AppPersonType(type);
//		this.peopleNumber = peopleNumber;
//		this.postcodeAddress = postcodeAddress;
//		this.recordStatus = recordStatus;
//		this.otherInfo = otherInfo;
//	}
	
	
	
}
