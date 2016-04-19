package com.lotut.pms.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.Order;
import com.lotut.pms.domain.OrderItem;

public interface OrderMapper {
	int insertOrder(Order order);
	int insertOrderItems(@Param("orderItems")List<OrderItem> orderItems);
	List<Order> selectUserOrders(int userId);
}
