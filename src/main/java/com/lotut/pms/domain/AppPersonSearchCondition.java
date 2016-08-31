package com.lotut.pms.domain;

public class AppPersonSearchCondition {
	private int userId;
	private String name;
	private String idNumber;
	private String postcodeAddress;
	private String feeReduceTransactionStatus;
	private String transactionIdentityId;
	private String transactionYear ;
	private String keyword;
	private Page page;
	
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getKeyword() {
		if (keyword != null) {
			return keyword.trim();
		}
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
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
	
	public String toString(){
		String nameStr=name ==null ? "" :name.toString();
		String idNumberStr=idNumber ==null ? "" :idNumber.toString();
		String postcodeAddressStr=postcodeAddress ==null ? "" :postcodeAddress.toString();
		String feeReduceTransactionStatusStr=feeReduceTransactionStatus ==null ? "" :feeReduceTransactionStatus.toString();
		String transactionIdentityIdStr=transactionIdentityId ==null ? "" :transactionIdentityId.toString();
		String transactionYearStr=transactionYear ==null ? "" :transactionYear.toString();
		String keywordStr=keyword ==null ? "" :keyword.toString();
		
		return "&name="+nameStr+"&idNumber="+idNumberStr+"&postcodeAddress="+postcodeAddressStr+
				"&feeReduceTransactionStatus="+feeReduceTransactionStatusStr+"&transactionIdentityId="+transactionIdentityIdStr+"&transactionYear="
				+transactionYearStr+"&keyword="+keywordStr;
		
		
	}
	
}
