package com.lotut.pms.domain;

import java.util.Date;

public class SalePatentGood {
	private int patentId;
	private int price;
	private int status;
	private int transactionType;
	private Date addDate;
	private Date transactionDate;
	private int owner;
	private int recommendStatus;
	private String transferor;
	private String patentImageUrl;
	public int getPatentId() {
		return patentId;
	}
	public void setPatentId(int patentId) {
		this.patentId = patentId;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getTransactionType() {
		return transactionType;
	}
	public void setTransactionType(int transactionType) {
		this.transactionType = transactionType;
	}
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	public Date getTransactionDate() {
		return transactionDate;
	}
	public void setTransactionDate(Date transactionDate) {
		this.transactionDate = transactionDate;
	}
	public int getOwner() {
		return owner;
	}
	public void setOwner(int owner) {
		this.owner = owner;
	}
	public int getRecommendStatus() {
		return recommendStatus;
	}
	public void setRecommendStatus(int recommendStatus) {
		this.recommendStatus = recommendStatus;
	}
	public String getTransferor() {
		return transferor;
	}
	public void setTransferor(String transferor) {
		this.transferor = transferor;
	}
	public String getPatentImageUrl() {
		return patentImageUrl;
	}
	public void setPatentImageUrl(String patentImageUrl) {
		this.patentImageUrl = patentImageUrl;
	}
	
	

}
