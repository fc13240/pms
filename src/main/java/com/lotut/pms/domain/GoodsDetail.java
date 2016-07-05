package com.lotut.pms.domain;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class GoodsDetail {
	private int userId;
	private int id;
	private int FirstColumn;
	
	private int SecondColumn;
	private int price;
	private int transactionType;
	private int status;
	private int patentId;
	private String appNo;
	private String patentName;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern = "yyyy-MM-dd")
	private Date addDate;
	private static DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	
	
	
	
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
	public static DateFormat getFormatter() {
		return formatter;
	}
	public static void setFormatter(DateFormat formatter) {
		GoodsDetail.formatter = formatter;
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
	
}
