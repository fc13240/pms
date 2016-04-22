package com.lotut.pms.domain;

public class GoodsDetail {

	private int id;
	private int FirstColumn;
	
	private int SecondColumn;
	private int price;
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
