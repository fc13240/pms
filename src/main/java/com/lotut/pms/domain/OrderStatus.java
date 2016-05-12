package com.lotut.pms.domain;

public class OrderStatus {
	private int statusId;
	private String statusDescription;
	
	private int statusSendId;
	private String statusSendDescription;
	
	private int statusSignId;
	private String statusSignDescription;	
	
	public int getStatusSendId() {
		return statusSendId;
	}
	public void setStatusSendId(int statusSendId) {
		this.statusSendId = statusSendId;
	}
	public String getStatusSendDescription() {
		return statusSendDescription;
	}
	public void setStatusSendDescription(String statusSendDescription) {
		this.statusSendDescription = statusSendDescription;
	}
	public int getStatusSignId() {
		return statusSignId;
	}
	public void setStatusSignId(int statusSignId) {
		this.statusSignId = statusSignId;
	}
	public String getStatusSignDescription() {
		return statusSignDescription;
	}
	public void setStatusSignDescription(String statusSignDescription) {
		this.statusSignDescription = statusSignDescription;
	}
	public int getStatusId() {
		return statusId;
	}
	public void setStatusId(int statusId) {
		this.statusId = statusId;
	}
	public String getStatusDescription() {
		return statusDescription;
	}
	public void setStatusDescription(String statusDescription) {
		this.statusDescription = statusDescription;
	}
}
