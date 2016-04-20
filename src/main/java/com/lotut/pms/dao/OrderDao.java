package com.lotut.pms.dao;

import java.util.List;

import com.lotut.pms.domain.Order;
import com.lotut.pms.domain.OrderItem;
import com.lotut.pms.domain.Page;

public interface OrderDao {
	int insertOrder(Order order);
	int insertOrderItems(List<OrderItem> orderItems);
	List<Order> selectUserOrders(int userId);
	Order getOrderById(long orderId);
	
	List<Order> selectUserOrders(Page page);
	
	int getUserOrdersCount(int userId);
}
