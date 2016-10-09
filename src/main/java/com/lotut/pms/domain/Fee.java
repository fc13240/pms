package com.lotut.pms.domain;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class Fee {
	private long feeId;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern = "yyyy-MM-dd")
	private Date deadline;
	private String feeType;
	private int amount;
	private User processUser;
	private FeeMonitorStatus monitorStatus;
	private FeeProcessStatus processStatus;
	private FeePaymentStatus paymentStatus;
	private User owner;
	private String invoiceTitle;
	private Patent patent;
	private long orderId;
	private List<User> shareUsers;


	public long getFeeId() {
		return feeId;
	}

	public void setFeeId(long feeId) {
		this.feeId = feeId;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public User getProcessUser() {
		return processUser;
	}

	public void setProcessUser(User processUser) {
		this.processUser = processUser;
	}


	public User getOwner() {
		return owner;
	}

	public void setOwner(User owner) {
		this.owner = owner;
	}

	public String getInvoiceTitle() {
		if (invoiceTitle ==  null || invoiceTitle.isEmpty()) {
			return getPatent().getFirstAppPerson();
		}
		
		return invoiceTitle;
	}

	public void setInvoiceTitle(String invoiceTitle) {
		this.invoiceTitle = invoiceTitle;
	}

	public Date getDeadline() {
		return deadline;
	}

	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}

	public String getFeeType() {
		return feeType;
	}

	public void setFeeType(String feeType) {
		this.feeType = feeType;
	}

	public FeeMonitorStatus getMonitorStatus() {
		return monitorStatus;
	}

	public void setMonitorStatus(FeeMonitorStatus monitorStatus) {
		this.monitorStatus = monitorStatus;
	}

	public FeeProcessStatus getProcessStatus() {
		return processStatus;
	}

	public void setProcessStatus(FeeProcessStatus processStatus) {
		this.processStatus = processStatus;
	}

	public Patent getPatent() {
		return patent;
	}

	public void setPatent(Patent patent) {
		this.patent = patent;
	}

	public FeePaymentStatus getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(FeePaymentStatus paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public long getOrderId() {
		return orderId;
	}

	public void setOrderId(long orderId) {
		this.orderId = orderId;
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
}
