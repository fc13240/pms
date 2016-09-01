package com.lotut.pms.domain;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotNull;

public class PatentDocOrder {
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
}
