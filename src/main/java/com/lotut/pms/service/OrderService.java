package com.lotut.pms.service;

import java.util.List;

import com.lotut.pms.domain.Fee;
import com.lotut.pms.domain.Order;

public interface OrderService {
	int createOrder(Order order, List<Fee> fees);
	List<Order> getUserOrders(int userId);
	Order getOrderById(long orderId);
}
