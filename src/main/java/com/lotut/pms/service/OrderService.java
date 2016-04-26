package com.lotut.pms.service;

import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.AdminOrderSearchCondition;
import com.lotut.pms.domain.Fee;
import com.lotut.pms.domain.Order;
import com.lotut.pms.domain.OrderSearchCondition;
import com.lotut.pms.domain.OrderStatus;
import com.lotut.pms.domain.Page;

public interface OrderService {
	int createOrder(Order order, List<Fee> fees);
	List<Order> getUserOrders(int userId);
	Order getOrderById(long orderId);
	
	List<Order> getUserOrders(Page page);
	
	long getUserOrdersCount(int userId);
	
	List<Order> searchUserOrdersByPage(OrderSearchCondition searchCondition);
	
	long searchUserOrdersCount(OrderSearchCondition searchCondition);
	
	int deleteUserOrders(long orderId);
	
	void processOrderPaidSuccess(long orderId);
	
	int updateOrderStatus(long orderId, int status);
	
	int getAllNeedProcessOrderCount();
	
	List<Order> getAllNeedProcessOrders(Page page);
	
	List<OrderStatus> getAllOrderStatus();
	
	List<Order> getUserOrdersByStatus(int userId, int orderStatus);
	
	int updateUserOrderStatus(long orderId); 
	
	int updateUserOrderExpress(Map<String, String> expressInfo);
	
	List<Order> getAllNeedProcessOrdersBySearch(AdminOrderSearchCondition searchCondition);
	
	long getAllNeedProcessOrdersBySearchCount(AdminOrderSearchCondition searchCondition);
}
