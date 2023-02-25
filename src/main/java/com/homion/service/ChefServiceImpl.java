package com.homion.service;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homion.dao.ChefDAO;
import com.homion.model.Order;
import com.homion.model.OrderItem;

@Service
@Transactional
public class ChefServiceImpl implements ChefService {
	
	@Autowired
	private ChefDAO chefDAO;
	
	@Override
	  public List<Order> getOrdersByChef(String type, long chefId){
	    return chefDAO.getOrdersByChef(type, chefId) ;
	  }
	  
	  @Override
	  public List<OrderItem> getOrderItems(long id){
	    return chefDAO.getOrderItems(id);
	  }
	  
	  @Override
	  public void changeOrderStatus(String status, long id) {
	    chefDAO.changeOrderStatus(status, id);
	  }
	  
	  @Override
	  public Map<Long,Double> getRevenue(String day, long chefId) {
	    return chefDAO.getRevenue(day, chefId);
	  }
	  
	  @Override
	  public Map<Long,Double> getWeeksRevenue(long chefId){
	    return chefDAO.getWeeksRevenue(chefId);
	  }
	  
	  public List<Order> getOrdersByTime(String time, long chefId){
		return chefDAO.getOrdersByTime(time, chefId);
	  }
	
}
