package com.homion.service;

import java.util.List;
import java.util.Map;

import com.homion.model.Address;
import com.homion.model.Chef;
import com.homion.model.Feedback;
import com.homion.model.Order;
import com.homion.model.OrderItem;
import com.homion.model.Product;

public interface UserService {
	
	List<Chef> getChefsByPincode(String pincode);
	
	List<Feedback> getFeedbacksByChefId(long id);
	
	List<OrderItem> getOrderItems(long id);
	
	List<Address> getAddressByPincode(long id, String pincode);
	
	void changeUserIdToOrderId(long userId, long orderId);
	
	Map<Long,Float> getRatingById(long id);
	
	List<Product> getProductsByPincode(String pincode);
	
	List<Product> getTrendingByPincode(String pincode);
	  
	String getUserPincode(long id);
	  
	List<Object> searchItems(String className, String value);

	List<Order> getOrdersOfUser(long id, String status);
	
	void save(OrderItem orderItem);
	
	List favourites(String className, String type, long userId);
	  
	void removeFavourite(long userId, long typeId);

	boolean isFavourite(long userId, long chefId);
	
}
