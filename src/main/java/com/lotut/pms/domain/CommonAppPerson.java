package com.lotut.pms.domain;

import java.util.List;
import java.util.stream.Collectors;

public class CommonAppPerson {
	private int appPersonId;
	private String name;
	private String typeName;
	private String idNumber;
	private String postcodeAddress;
	private String feeReduceTransactionStatus;
	private String otherInfo;
	private int userId;
	private List<User> shareUsers;
	private String appPersonUrl;
	private String transactionIdentityId;
	private String transactionYear ;
	private String proxyUrl;
	
	
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
	public String getProxyUrl() {
		return proxyUrl;
	}
	public void setProxyUrl(String proxyUrl) {
		this.proxyUrl = proxyUrl;
	}
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	
	
	
}
