package com.lotut.pms.dao;

import java.util.List;

import com.lotut.pms.domain.Order;
import com.lotut.pms.domain.OrderItem;

public interface OrderDao {
	int insertOrder(Order order);
	int insertOrderItems(List<OrderItem> orderItems);
	List<Order> selectUserOrders(int userId);
	Order getOrderById(long orderId);
}
