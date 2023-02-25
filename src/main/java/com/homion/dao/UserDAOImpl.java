package com.homion.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.homion.model.Address;
import com.homion.model.Chef;
import com.homion.model.Favourite;
import com.homion.model.Feedback;
import com.homion.model.Order;
import com.homion.model.OrderItem;
import com.homion.model.Product;

@Repository
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	private SessionFactory sf;
	
	@Override
	@SuppressWarnings("unchecked")
	public List<Chef> getChefsByPincode(String pincode) {
		Session session = this.sf.getCurrentSession();
		Query query = session.createQuery("from Chef where id in (select ownerId from Address where pincode = '"+pincode+"' and ownerId between 200000 and 300000) and status = 'Active'");
		return query.list();
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<Feedback> getFeedbacksByChefId(long id) {
		Session session = this.sf.getCurrentSession();
		Query query = session.createQuery("from Feedback where id in (select feedback from Order where chef = "+ id +") and comment != '' order by chefRating desc");
		return query.list();
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<OrderItem> getOrderItems(long id) {
		Session session = this.sf.getCurrentSession();
		Query query = session.createQuery("from OrderItem where orderId = " + id);
		return query.list();
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<Address> getAddressByPincode(long id, String pincode) {
		Session session = this.sf.getCurrentSession();
		Query query = session.createQuery("from Address where ownerId = " + id + " and pincode  = '" + pincode + "'");
		return query.list();
	}
	
	@Override
	public void changeUserIdToOrderId(long userId, long orderId) {
		Session session = this.sf.getCurrentSession();
		Query query = session.createQuery("update OrderItem set orderId = " + orderId + " where orderId = " + userId);
		query.executeUpdate();
	}
	
	@Override
	@SuppressWarnings("rawtypes")
	public Map<Long,Float> getRatingById(long id) {
		Session session = this.sf.getCurrentSession();
		Query query = session.createQuery("select chefRating, count(chefRating) from Feedback where id in (select feedback from Order where chef = "+ id +") group by chefRating");
		float totalRating = 0;
		Map<Long,Float> ratings = new HashMap<Long, Float>();
		for(long i = 1; i < 6; i++)
			ratings.put(i, (float)0);
		for(Iterator it=query.iterate();it.hasNext();) {
			Object[] row = (Object[])it.next();
			long key = (Integer)row[0];
			float value = (Long)row[1];
			totalRating += value;
			ratings.put(key, value);
		}
		ratings.put((long)0, totalRating);
		return ratings;
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<Product> getProductsByPincode(String pincode) {
	    Session session = this.sf.getCurrentSession();
	    Query query = session.createQuery("from Product p where chef in (select ownerId from Address where pincode = '"+pincode+"' and ownerId between 200000 and 300000) order by p.count desc, p.rating desc");
	    return query.list();
	}
	
	@Override
	@SuppressWarnings("rawtypes")
	public List<Product> getTrendingByPincode(String pincode) {
	    Session session = this.sf.getCurrentSession();
	    Query query = session.createQuery("select product, count(product_id) as c from OrderItem where orderId in (select id from Order where chef in (select ownerId from Address where pincode = '"+pincode+"' and ownerId between 200000 and 300000) order by id desc) group by product_id order by c desc");
	    List<Product> list = new ArrayList<Product>();
	    for(Iterator it=query.iterate();it.hasNext();) {
			Object[] row = (Object[])it.next();
			list.add((Product)row[0]);
		}
	    return list;
	}
	  
	  @Override
	  public String getUserPincode(long id) {
	    Session session = this.sf.getCurrentSession();
	    Query query = session.createQuery("select pincode from Address where type='Home' and ownerId = "+id);
	    return query.list().get(0).toString();
	  }

	  @Override
	  @SuppressWarnings("unchecked")
	  public List<Object> searchItems(String className, String value) {
	    Session session = this.sf.getCurrentSession();
	    Query query = null;
	    if(className.equals("Product")) {
	      query = session.createQuery("from Product where lower(name) like lower(?)");
	      query.setString(0, "%"+value+"%");
	    }
	    if(className.equals("Chef")){
	      query = session.createQuery("from Chef where lower(firstName) like lower(?) or lower(lastName) like lower(?)");
	      query.setString(0, "%"+value+"%");
	      query.setString(1, "%"+value+"%");
	    }
	    System.out.println(query.list().size());
	    return query.list();
	  }
	  
	  @Override
	  @SuppressWarnings("unchecked")
	  public List<Order> getOrdersOfUser(long id, String status) {
		  Session session = this.sf.getCurrentSession();
		  Query query = null;
		  if(status.equalsIgnoreCase("completed"))
			  query = session.createQuery("from Order where status = 'delivered' and user = " + id + " order by timestamp desc");
		  else if(status.equalsIgnoreCase("canceled"))
			  query = session.createQuery("from Order where status = 'canceled' or status = 'rejected' and user = " + id + " order by timestamp desc");
		  else if(status.equalsIgnoreCase("progress"))
			  query = session.createQuery("from Order where status = 'new' or status = 'ongoing' or status = 'ready' and user = " + id + " order by timestamp desc");
		  return query.list();
	  }
	  
	  @Override
	  public void save(OrderItem orderItem) {
		  Session session = this.sf.getCurrentSession();
		  session.save(orderItem);
	  }
	  
	  @SuppressWarnings("rawtypes")
	  @Override
	  public List favourites(String className, String type, long userId) {
	    Session session = this.sf.getCurrentSession();
	    Query query = session.createQuery("from " + className + " where id in (select typeId from Favourite where type = '"+ type +"' and user = " + userId + ")");
	    return query.list();
	  }

	  @Override
	  public void removeFavourite(long userId, long typeId) {
	    Session session = this.sf.getCurrentSession();
	    Query query = session.createQuery("delete from Favourite where user_id = " + userId + " and typeId = " + typeId);
	    query.executeUpdate();
	  }
	  
	  @Override
	  public boolean isFavourite(long userId, long chefId) {
	    Session session = this.sf.getCurrentSession();
	    Query query = session.createQuery("from Favourite where typeId = " + chefId + " and  user = " + userId);
	    @SuppressWarnings("unchecked")
	    List<Favourite> isFavourite = query.list();
	    return !isFavourite.isEmpty();
	  }
	
}
