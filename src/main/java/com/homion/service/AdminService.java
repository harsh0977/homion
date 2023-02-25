package com.homion.service;

import java.util.List;

import com.homion.model.Address;
import com.homion.model.Area;
import com.homion.model.Category;
import com.homion.model.Chef;
import com.homion.model.Order;
import com.homion.model.OrderItem;
import com.homion.model.SubCategory;
import com.homion.model.User;

public interface AdminService {
	
	/************************ AREA **********************/
	public void deleteArea(long id);
	
	public Area editArea(long id);
	
	/************************ CATEGORY **********************/
	public void deleteCategory(long id);
	
	public Category editCategory(long id);
	
	/************************ SUBCATEGORY **********************/
	public void deleteSubCategory(long id);
	
	public SubCategory editSubCategory(long id);

	/************************ CHEF **********************/
	public List<Chef> getRequestedChefs();

	public List<Address> getRequestedChefsAddress();

	public Object updateStatus(long id, String action, String className);

	public List<Chef> getChefs();

	public List<Address> getChefAddress();
	
	public List<User> getUsers();

	public List<Address> getUserAddress();
	
	public List<Order> getOrders();

	public List<OrderItem> getOrderItems();
	
}
