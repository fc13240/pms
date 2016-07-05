package com.lotut.pms.domain;

public class GoodsDetail {
	private int userId;
	private int id;
	private int FirstColumn;
	
	private int SecondColumn;
	private int price;
	private int transactionType;
	private int status;
	
	
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
