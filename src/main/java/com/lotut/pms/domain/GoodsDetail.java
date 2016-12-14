package com.lotut.pms.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class GoodsDetail {
	private int userId;
	private int id;
	private int FirstColumn;
	private int owner;
	private int SecondColumn;
	private int price;
	private int transactionType;
	private int status;
	private int patentId;
	private String appNo;
	private String patentName;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern = "yyyy-MM-dd")
	private Date addDate;
	private Date transactionDate;
	private int recommendStatus;
	private String transferor;
	private String patentImageUrl;
	private String description;
	private Patent patent;
	private PatentType patentType;
	
	
	public Patent getPatent() {
		return patent;
	}
	public void setPatent(Patent patent) {
		this.patent = patent;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTransferor() {
		return transferor;
	}
	public void setTransferor(String transferor) {
		this.transferor = transferor;
	}
	public int getRecommendStatus() {
		return recommendStatus;
	}
	public void setRecommendStatus(int recommendStatus) {
		this.recommendStatus = recommendStatus;
	}
	public int getOwner() {
		return owner;
	}
	public void setOwner(int owner) {
		this.owner = owner;
	}
	public int getPatentId() {
		return patentId;
	}
	public void setPatentId(int patentId) {
		this.patentId = patentId;
	}
	public String getAppNo() {
		return appNo;
	}
	public void setAppNo(String appNo) {
		this.appNo = appNo;
	}
	public String getPatentName() {
		return patentName;
	}
	public void setPatentName(String patentName) {
		this.patentName = patentName;
	}
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
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
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getFirstColumn() {
		return FirstColumn;
	}
	public void setFirstColumn(int firstColumn) {
		FirstColumn = firstColumn;
	}
	public int getSecondColumn() {
		return SecondColumn;
	}
	public void setSecondColumn(int secondColumn) {
		SecondColumn = secondColumn;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getTransactionDate() {
		return transactionDate;
	}
	public void setTransactionDate(Date transactionDate) {
		this.transactionDate = transactionDate;
	}
	
	public String getPatentImageUrl() {
		return patentImageUrl;
	}
	public void setPatentImageUrl(String patentImageUrl) {
		this.patentImageUrl = patentImageUrl;
	}
	public PatentType getPatentType() {
		return patentType;
	}
	public void setPatentType(PatentType patentType) {
		this.patentType = patentType;
	}
	
	
	
}
