package com.homion.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homion.dao.AdminDAO;
import com.homion.dao.GeneralDAO;
import com.homion.model.Address;
import com.homion.model.Area;
import com.homion.model.Category;
import com.homion.model.Chef;
import com.homion.model.Order;
import com.homion.model.OrderItem;
import com.homion.model.SubCategory;
import com.homion.model.User;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO adminDAO;
	
	@Autowired
	private GeneralDAO generalDAO;
	
	@Override
	public void deleteArea(long id) {
		Area area = (Area)generalDAO.getDetails("Area", id).get(0);
		area.setStatus(false);
		generalDAO.save(area);
	}
	
	@Override
	public Area editArea(long id) {
		Area area = (Area)generalDAO.getDetails("Area", id).get(0);
		area.setId(id);
		return area;
	}

	@Override
	public void deleteCategory(long id) {
		Category category = (Category)generalDAO.getDetails("Category", id).get(0);
		category.setStatus(false);
		generalDAO.save(category);
	}

	@Override
	public Category editCategory(long id) {
		Category category = (Category)generalDAO.getDetails("Category", id).get(0);
		category.setId(id);
		return category;
	}
	
	@Override
	public void deleteSubCategory(long id) {
		SubCategory subcategory = (SubCategory)generalDAO.getDetails("SubCategory", id).get(0);
		subcategory.setStatus(false);
		generalDAO.save(subcategory);
	}

	@Override
	public SubCategory editSubCategory(long id) {
		SubCategory subcategory = (SubCategory)generalDAO.getDetails("SubCategory", id).get(0);
		subcategory.setId(id);
		return subcategory;
	}

	@Override
	public List<Chef> getRequestedChefs() {
		return this.adminDAO.getRequestedChefs();
	}

	@Override
	public List<Address> getRequestedChefsAddress() {
		return this.adminDAO.getRequestedChefsAddress();
	}

	@Override
	public Object updateStatus(long id, String action, String className) {
	    if (className.equals("Chef")){
	      Chef chef = (Chef) this.generalDAO.getObjectById("Chef", id);
	      chef.setStatus(action);
	      this.generalDAO.save(chef);
	      return chef;
	    }
	    else{
	      User user = (User) this.generalDAO.getObjectById("User", id);
	      if (action.equals("Blocked"))
	        user.setStatus("Blocked");
	      else
	        user.setStatus("Active");
	      
	      this.generalDAO.save(user);
	      return user;
	    }
	}

	@Override
	public List<Chef> getChefs() {
		return this.adminDAO.getChefs();
	}

	@Override
	public List<Address> getChefAddress() {
		return this.adminDAO.getChefAddress();
	}
	
	@Override
	public List<User> getUsers() {
	    return this.adminDAO.getUsers();
	}

	@Override
	public List<Address> getUserAddress() {
	    return this.adminDAO.getUserAddress();
	}
	
	@Override
	public List<Order> getOrders() {
	    return this.adminDAO.getOrders();
	}

	@Override
	public List<OrderItem> getOrderItems() {
	    return this.adminDAO.getOrderItems();
	}
	
}
