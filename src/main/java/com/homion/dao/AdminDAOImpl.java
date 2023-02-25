package com.homion.dao;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.homion.model.Address;
import com.homion.model.Chef;
import com.homion.model.Order;
import com.homion.model.OrderItem;
import com.homion.model.User;

@Repository
public class AdminDAOImpl implements AdminDAO{
	@Autowired
	private SessionFactory sf;

	@Override
	@SuppressWarnings("unchecked")
	public List<Chef> getRequestedChefs() {
		List<Chef> requesteChefs = new ArrayList<Chef>();
		Session s = sf.getCurrentSession();
		Query q = s.createQuery("from Chef where status = 'Requested' order by id desc");
		requesteChefs = q.list();
		return requesteChefs;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Address> getRequestedChefsAddress() {
		Session s = sf.getCurrentSession();
		Query q = s.createQuery(" from Address where ownerId in (select id from Chef where status = 'Requested') order by ownerId desc");
		List<Address> chefAddress = q.list();
		return chefAddress;
	}

	// chefs having status: [Active] [Blocked]
	@SuppressWarnings("unchecked")
	@Override
	public List<Chef> getChefs() {
		List<Chef> requesteChefs = new ArrayList<Chef>();
		Session s = sf.getCurrentSession();
		Query q = s.createQuery("from Chef where status = 'Active' or status = 'Blocked' order by id desc");
		requesteChefs = q.list();
		return requesteChefs;
	}

	// chef's address  having status: [Active] [Blocked]	
	@Override
	@SuppressWarnings("unchecked")
	public List<Address> getChefAddress() {
		Session s = sf.getCurrentSession();
		Query q = s.createQuery(" from Address where ownerId in (select id from Chef where status = 'Active' or status = 'Blocked') order by ownerId desc");
		List<Address> chefAddress = q.list();
		return chefAddress;
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<User> getUsers() {
	    Session s = sf.getCurrentSession();
	    Query q = s.createQuery("from User order by id desc");
	    List<User> users = q.list();
	    return users;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Address> getUserAddress() {
	    Session s = sf.getCurrentSession();
	    Query q = s.createQuery(" from Address where ownerId in (select id from User) order by ownerId desc");
	    List<Address> userAddress = q.list();
	    return userAddress;
	}
	
	@Override
	public List<Order> getOrders() {
	    Session s = sf.getCurrentSession();
	    Query q = s.createQuery("from Order order by id desc");
	    List<Order> orders = q.list();
	    return orders;
	}

	@Override
	public List<OrderItem> getOrderItems() {
	    Session s = sf.getCurrentSession();
	    Query q = s.createQuery("from OrderItem order by orderId desc");
	    List<OrderItem> orderItems = q.list();
	    return orderItems;
	}
	
}
