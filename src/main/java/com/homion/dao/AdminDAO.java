package com.homion.dao;

import java.util.List;

import com.homion.model.Address;
import com.homion.model.Chef;
import com.homion.model.Order;
import com.homion.model.OrderItem;
import com.homion.model.User;

public interface AdminDAO {
	
	public List<Chef> getRequestedChefs();
	
	public List<Address> getRequestedChefsAddress();

	public List<Chef> getChefs();

	public List<Address> getChefAddress();
	
	public List<User> getUsers();

	public List<Address> getUserAddress();
	
	public List<Order> getOrders();

	public List<OrderItem> getOrderItems();

}
