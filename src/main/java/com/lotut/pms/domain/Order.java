package com.lotut.pms.domain;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotNull;

public class Order {
	private long id;
	private OrderStatus orderStatus;
	private OrderSendStatus orderSendStatus;
	@NotNull
	private ContactAddress postAddress;
	private int amount;
	private User owner;
	private User processUser;
	private boolean received;
	private String expressCompany;
	private String expressNo;
	private Date createTime;
	private Date payTime;
	private Date sendTime;
	private String courier;
	private String courierPhone;
	private List<Fee> feeList;
	private String invoice;
	@NotNull
	private PaymentMethod paymentMethod;
	private int expressFee;
	private int serviceFee;
	private int invoiceFee;
	private int order_send_status;
	
	public int getExpressFee() {
		return expressFee;
	}
	public void setExpressFee(int expressFee) {
		this.expressFee = expressFee;
	}
	public int getServiceFee() {
		return serviceFee;
	}
	public void setServiceFee(int serviceFee) {
		this.serviceFee = serviceFee;
	}
	public int getInvoiceFee() {
		return invoiceFee;
	}
	public void setInvoiceFee(int invoiceFee) {
		this.invoiceFee = invoiceFee;
	}

	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public OrderStatus getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(OrderStatus orderStatus) {
		this.orderStatus = orderStatus;
	}
	
	
	public int getTotalAmount() {
		return getAmount();
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
	public boolean isReceived() {
		return received;
	}
	public void setReceived(boolean received) {
		this.received = received;
	}
	public String getExpressCompany() {
		return expressCompany;
	}
	public void setExpressCompany(String expressCompany) {
		this.expressCompany = expressCompany;
	}
	public Date getSendTime() {
		return sendTime;
	}
	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}
	public String getCourier() {
		return courier;
	}
	public void setCourier(String courier) {
		this.courier = courier;
	}
	public String getCourierPhone() {
		return courierPhone;
	}
	public void setCourierPhone(String courierPhone) {
		this.courierPhone = courierPhone;
	}
	public List<Fee> getFeeList() {
		return feeList;
	}
	public void setFeeList(List<Fee> feeList) {
		this.feeList = feeList;
	}
	public ContactAddress getPostAddress() {
		return postAddress;
	}
	public void setPostAddress(ContactAddress postAddress) {
		this.postAddress = postAddress;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public PaymentMethod getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(PaymentMethod paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public User getOwner() {
		return owner;
	}
	public void setOwner(User owner) {
		this.owner = owner;
	}
	public String getExpressNo() {
		return expressNo;
	}
	public void setExpressNo(String expressNo) {
		this.expressNo = expressNo;
	}
	public Date getPayTime() {
		return payTime;
	}
	public void setPayTime(Date payTime) {
		this.payTime = payTime;
	}
	public String getInvoice() {
		return invoice;
	}
	public void setInvoice(String invoice) {
		this.invoice = invoice;
	}
	
}
