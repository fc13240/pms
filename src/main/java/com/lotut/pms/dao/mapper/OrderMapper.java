package com.lotut.pms.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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
	void deleteUserOrders(long orderId);
	int updateOrderStatus(@Param("orderId")long orderId,@Param("status")int status);
	
	int getAllUnCacelledOrderCount();
	
	List<OrderStatus> getAllOrderStatus();
	
	List<Order> getUserOrdersByStatus(@Param("userId") int userId, @Param("orderStatus")int orderStatus);
	
	List<Order> searchUserOrdersByPage(@Param("searchCondtion")OrderSearchCondition searchCondition);
	
	int searchUserPatentsCount(@Param("searchCondtion")OrderSearchCondition searchCondition);
	List<Order> getAllUnCacelledOrders(Page page);
}
