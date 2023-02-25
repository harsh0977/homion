package com.homion.service;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homion.dao.UserDAO;
import com.homion.model.Address;
import com.homion.model.Chef;
import com.homion.model.Feedback;
import com.homion.model.Order;
import com.homion.model.OrderItem;
import com.homion.model.Product;

@Service
@Transactional
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDAO;
	
	@Override
	public List<Chef> getChefsByPincode(String pincode) {
		return userDAO.getChefsByPincode(pincode);
	}
	
	@Override
	public List<Feedback> getFeedbacksByChefId(long id) {
		return userDAO.getFeedbacksByChefId(id);
	}
	
	@Override
	public List<OrderItem> getOrderItems(long id) {
		return userDAO.getOrderItems(id);
	}
	
	@Override
	public List<Address> getAddressByPincode(long id, String pincode) {
		return userDAO.getAddressByPincode(id, pincode);
	}
	
	@Override
	public void changeUserIdToOrderId(long userId, long orderId) {
		userDAO.changeUserIdToOrderId(userId, orderId);
	}
	
	@Override
	public Map<Long,Float> getRatingById(long id) {
		return userDAO.getRatingById(id);
	}
	
	@Override
	public List<Product> getProductsByPincode(String pincode) {
	    return userDAO.getProductsByPincode(pincode);
	}
	
	@Override
	public List<Product> getTrendingByPincode(String pincode) {
	    return userDAO.getTrendingByPincode(pincode);
	}

	@Override
	public String getUserPincode(long id) {
	    return userDAO.getUserPincode(id);
	}

	@Override
	public List<Object> searchItems(String className, String value) {
	    return userDAO.searchItems(className, value);
	}
	
	@Override
	public List<Order> getOrdersOfUser(long id, String status) {
		return userDAO.getOrdersOfUser(id, status);
	}
	
	@Override
	public void save(OrderItem orderItem) {
		userDAO.save(orderItem);
	}
	
	@SuppressWarnings("rawtypes")
	  @Override
	  public List favourites(String className, String type, long userId) {
	    return this.userDAO.favourites(className, type, userId);
	  }

	  @Override
	  public void removeFavourite(long userId, long typeId) {
	    this.userDAO.removeFavourite(userId, typeId);
	  }
	  
	  @Override
	  public boolean isFavourite(long userId, long chefId) {
	    return this.userDAO.isFavourite(userId, chefId);
	  }

}
