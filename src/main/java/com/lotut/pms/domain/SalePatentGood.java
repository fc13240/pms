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
	private GoodsFirstColumn firstColumn;
	private GoodsSecondColumn secondColumn;
	private String description;
	
	
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public GoodsFirstColumn getFirstColumn() {
		return firstColumn;
	}
	public void setFirstColumn(GoodsFirstColumn firstColumn) {
		this.firstColumn = firstColumn;
	}
	public GoodsSecondColumn getSecondColumn() {
		return secondColumn;
	}
	public void setSecondColumn(GoodsSecondColumn secondColumn) {
		this.secondColumn = secondColumn;
	}
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
	
	public String getTransactionStatus(int transactionType) {
		if(transactionType==1){
			return "转让";
		}
		return "许可";
	}
	
	public String getStatusText(int status) {
		if(status==1){
			return "待交易";
		}else if(status==2){
			return "已预订";
		}else{
			return "交易成功";
		}
		
	}
}
