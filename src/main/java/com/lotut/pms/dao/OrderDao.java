package com.lotut.pms.dao;

import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.AdminOrderSearchCondition;
import com.lotut.pms.domain.Order;
import com.lotut.pms.domain.OrderItem;
import com.lotut.pms.domain.OrderSearchCondition;
import com.lotut.pms.domain.OrderStatus;
import com.lotut.pms.domain.Page;

public interface OrderDao {
	int insertOrder(Order order);
	int insertOrderItems(List<OrderItem> orderItems);
	List<Order> selectUserOrders(int userId);
	Order getOrderById(long orderId);
	
	List<Order> selectUserOrders(Page page);
	
	int getUserOrdersCount(int userId);
	
	int updateOrderStatus(long orderId, int status);
	
	void deleteUserOrder(long orderId, int userId);
	
	int getAllNeedProcessOrderCount();
	
	List<Order> getAllNeedProcessOrders(Page page);
	
	List<OrderStatus> getAllOrderStatus();
	
	List<Order> getUserOrdersByStatus(int userId, int orderStatus);
	
	List<Order> searchUserOrdersByPage(OrderSearchCondition searchCondition);
	
	int searchUserOrdersCount(OrderSearchCondition searchCondition);
	
	int updateUserOrderStatus(long orderId);
	
	int updateUserOrderExpress(Map<String, String> expressInfo);
	
	List<Order> getAllNeedProcessOrdersBySearch(AdminOrderSearchCondition searchCondition);
	
	int getAllNeedProcessOrdersBySearchCount(AdminOrderSearchCondition searchCondition);
}
