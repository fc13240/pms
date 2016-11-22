package com.lotut.pms.domain;

import java.util.Date;

public class Brand {
	private User user;
	private String address;
	private BrandCategory brandCategory;
	private int checkStatus;
	private int sellStatus;
	private int isRecommend;
	private String brandNo;
	private String name;
	private String combinationType;
	private String similarNo;
	private String scope;
	private int transactionMode;
	private int price;
	private String appPerson;
	private Date app_date;
	private Date publish_date;
	private Date start_date;
	private Date end_date;
	private String originality  ;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public BrandCategory getBrandCategory() {
		return brandCategory;
	}
	public void setBrandCategory(BrandCategory brandCategory) {
		this.brandCategory = brandCategory;
	}
	public int getCheckStatus() {
		return checkStatus;
	}
	public void setCheckStatus(int checkStatus) {
		this.checkStatus = checkStatus;
	}
	public int getSellStatus() {
		return sellStatus;
	}
	public void setSellStatus(int sellStatus) {
		this.sellStatus = sellStatus;
	}
	public int getIsRecommend() {
		return isRecommend;
	}
	public void setIsRecommend(int isRecommend) {
		this.isRecommend = isRecommend;
	}
	public String getBrandNo() {
		return brandNo;
	}
	public void setBrandNo(String brandNo) {
		this.brandNo = brandNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCombinationType() {
		return combinationType;
	}
	public void setCombinationType(String combinationType) {
		this.combinationType = combinationType;
	}
	public String getSimilarNo() {
		return similarNo;
	}
	public void setSimilarNo(String similarNo) {
		this.similarNo = similarNo;
	}
	public String getScope() {
		return scope;
	}
	public void setScope(String scope) {
		this.scope = scope;
	}
	public int getTransactionMode() {
		return transactionMode;
	}
	public void setTransactionMode(int transactionMode) {
		this.transactionMode = transactionMode;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getAppPerson() {
		return appPerson;
	}
	public void setAppPerson(String appPerson) {
		this.appPerson = appPerson;
	}
	public Date getApp_date() {
		return app_date;
	}
	public void setApp_date(Date app_date) {
		this.app_date = app_date;
	}
	public Date getPublish_date() {
		return publish_date;
	}
	public void setPublish_date(Date publish_date) {
		this.publish_date = publish_date;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public String getOriginality() {
		return originality;
	}
	public void setOriginality(String originality) {
		this.originality = originality;
	}
	
	
}

