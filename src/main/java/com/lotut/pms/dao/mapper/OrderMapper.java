package com.lotut.pms.dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.AdminOrderSearchCondition;
import com.lotut.pms.domain.Order;
import com.lotut.pms.domain.OrderItem;
import com.lotut.pms.domain.OrderSearchCondition;
import com.lotut.pms.domain.OrderStatus;
import com.lotut.pms.domain.Page;

public interface OrderMapper {
	int insertOrder(Order order);
	int insertOrderItems(@Param("orderItems")List<OrderItem> orderItems);
	List<Order> selectUserOrders(int userId);
	Order getOrderById(long orderId);
	
	List<Order> selectUserOrders(Page page);
	
	int getUserOrdersCount(int userId);
	void deleteUserOrder(@Param("orderId") long orderId, @Param("userId") int userId);
	int updateOrderStatus(@Param("orderId")long orderId,@Param("status")int status);
	
	int getAllNeedProcessOrderCount();
	
	List<OrderStatus> getAllOrderStatus();
	
	List<Order> getUserOrdersByStatus(@Param("userId") int userId, @Param("orderStatus")int orderStatus);
	
	List<Order> searchUserOrdersByPage(OrderSearchCondition searchCondition);
	
	int searchUserOrdersCount(OrderSearchCondition searchCondition);
	List<Order> getAllNeedProcessOrders(Page page);
	
	int setUserOrderToPaid(@Param("orderId")long orderId);
	
	int setUserOrderToPaidSuccess(@Param("orderId")long orderId);
	
	int updateUserOrderExpress(Map<String, String> expressInfo);
	
	List<Order> getAllNeedProcessOrdersBySearch(AdminOrderSearchCondition searchCondition);
	
	int getAllNeedProcessOrdersBySearchCount(AdminOrderSearchCondition searchCondition);
	
	void updateOrderFeesStatus(@Param("orderItems")List<OrderItem> orderItems);
	
	@MapKey("orderStatus")
	Map<String, Map<String, String>> searchUserOrdersByOrderStatus(int userId);
	
	@MapKey("orderStatus")
	Map<String, Map<String, String>> searchUserAllOrdersByOrderStatus();
	
	void setUserOrderToSelfServicePay(long orderId);
	
}
