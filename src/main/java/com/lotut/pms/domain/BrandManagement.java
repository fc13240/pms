package com.lotut.pms.domain;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class BrandManagement {
	private int id;
	private BrandCategory brandCategory;
	private User user;
	private BrandLegalStatus brandLegalStatus;
	private String appNo;
	private String brandNo;
	private String name;
	private String similarNo;
	private String scope;
	private int transactionMode;
	private int transactionStatus;
	private int price;
	private String appPerson;
	private String originality;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern = "yyyy-MM-dd")
	private Date appDate;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern = "yyyy-MM-dd")
	private Date publishDate;
	private String caseStatus;
	private String imageUrl;
	private String proxyFile;
	private String businessLicense;
	private String individualLicense;
	private String entityLicense;
	private String identityCard;
	private String application;
	private List<User> shareUsers;
	private int monitorStatus;
	
	
	public int getMonitorStatus() {
		return monitorStatus;
	}
	public void setMonitorStatus(int monitorStatus) {
		this.monitorStatus = monitorStatus;
	}
	public int getTransactionStatus() {
		return transactionStatus;
	}
	public void setTransactionStatus(int transactionStatus) {
		this.transactionStatus = transactionStatus;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public void setIndividualLicense(String individualLicense) {
		this.individualLicense = individualLicense;
	}
	public BrandLegalStatus getBrandLegalStatus() {
		return brandLegalStatus;
	}
	public void setBrandLegalStatus(BrandLegalStatus brandLegalStatus) {
		this.brandLegalStatus = brandLegalStatus;
	}
	public BrandCategory getBrandCategory() {
		return brandCategory;
	}
	public void setBrandCategory(BrandCategory brandCategory) {
		this.brandCategory = brandCategory;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getAppNo() {
		if(this.appNo!=null){
			return appNo.trim();
		}
		return appNo;
	}
	public void setAppNo(String appNo) {
		this.appNo = appNo;
	}
	public String getBrandNo() {
		if(this.brandNo!=null){
			return brandNo.trim();
		}
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
	public String getSimilarNo() {
		if(this.similarNo!=null){
			return similarNo.trim();
		}
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
	public String getOriginality() {
		return originality;
	}
	public void setOriginality(String originality) {
		this.originality = originality;
	}
	public Date getAppDate() {
		return appDate;
	}
	public void setAppDate(Date appDate) {
		this.appDate = appDate;
	}
	public Date getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}
	public String getCaseStatus() {
		return caseStatus;
	}
	public void setCaseStatus(String caseStatus) {
		this.caseStatus = caseStatus;
	}
	
	public String getIndividualLicense() {
		if(this.individualLicense==null){
			this.setIndividualLicense("");;
		}
		return individualLicense;
	}
	
	public String getImageUrl() {
		if(this.imageUrl==null){
			this.setImageUrl("");;
		}
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getProxyFile() {
		if(this.proxyFile==null){
			this.setProxyFile("");
		}
		return proxyFile;
	}
	public void setProxyFile(String proxyFile) {
		this.proxyFile = proxyFile;
	}
	public String getBusinessLicense() {
		if(this.businessLicense==null){
			this.setBusinessLicense("");
		}
		return businessLicense;
	}
	public void setBusinessLicense(String businessLicense) {
		this.businessLicense = businessLicense;
	}
	public String getEntityLicense() {
		if(this.entityLicense==null){
			this.setEntityLicense("");
		}
		return entityLicense;
	}
	public void setEntityLicense(String entityLicense) {
		this.entityLicense = entityLicense;
	}
	public String getIdentityCard() {
		if(this.identityCard==null){
			this.setIdentityCard("");
		}
		return identityCard;
	}
	public void setIdentityCard(String identityCard) {
		this.identityCard = identityCard;
	}
	public String getApplication() {
		if(this.application==null){
			this.setApplication("");
		}
		return application;
	}
	public void setApplication(String application) {
		this.application = application;
	}
	public String getShareUsersAsString() {
		if (this.shareUsers != null) {
			return String.join(";", this.shareUsers.stream().map(User::getUsername).collect(Collectors.toList()));
		}
		
		return "";
	}

	public List<User> getShareUsers() {
		return shareUsers;
	}

	public void setShareUsers(List<User> shareUsers) {
		this.shareUsers = shareUsers;
	}
	
	public String getTransactionStatusText() {
		if(transactionStatus == 0){
			return "待发布";
		}
		else if(transactionStatus == 1){
			return "待交易";
		}
		else if(transactionStatus == 2){
			return "已预订";
		}
		else if(transactionStatus == 3){
			return "已付款待变更";
		}
		else if(transactionStatus == 4){
			return "已变更待合格";
		}
		else if(transactionStatus == 5){
			return "交易成功";
		}
		else {
			return "其他";
		}
	}
	
	public static void main(String[] args) {
		BrandManagement m = new BrandManagement();
		System.out.println(m.getProxyFile());
		String d= null;
		String p=m.getProxyFile();
		m.setProxyFile(null);
		
		//System.out.println(d.length());
		System.out.println(m);
	}
}

