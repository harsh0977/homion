package com.homion.service;

import java.util.List;
import java.util.Map;

import com.homion.model.Order;
import com.homion.model.OrderItem;

public interface ChefService {
	
	List<Order> getOrdersByChef(String type, long chefId);
	
	List<OrderItem> getOrderItems(long id);
	
	void changeOrderStatus(String status, long id);
	
	Map<Long,Double> getRevenue(String day, long chefId);
	  
	Map<Long,Double> getWeeksRevenue(long chefId);
	
	List<Order> getOrdersByTime(String time, long chefId);
}
