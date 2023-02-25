package com.homion.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.homion.model.Order;
import com.homion.model.OrderItem;

@Repository
public class ChefDAOImpl implements ChefDAO {
	
	@Autowired
	private SessionFactory sf;

	@Override
	@SuppressWarnings("unchecked")
	public List<Order> getOrdersByChef(String type, long chefId){
		Session session = sf.getCurrentSession();
		Query query = session.createQuery("from Order where chef = " +chefId+ " and status = '" + type + "' order by timestamp desc");
		return query.list();
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<OrderItem> getOrderItems(long id){
		Session session = sf.getCurrentSession();
		Query query = session.createQuery("from OrderItem where orderId = "+id);
		return query.list();
	}
	
	@Override
	public void changeOrderStatus(String status, long id) {
		Session session = sf.getCurrentSession();
		Query query = session.createQuery("update Order set status = '"+ status +"' where id = "+id);
		query.executeUpdate();
	}
	
	@Override
	  public Map<Long, Double> getRevenue(String day, long chefId) {
	    Session session = sf.getCurrentSession();
	    Calendar cal = Calendar.getInstance();
	    cal.setTime(new Date());
	    String str = "select count(*),sum(ord.amount) from Order ord where day(ord.timestamp) = :date and month(ord.timestamp) = :month and year(ord.timestamp) = :year and status='delivered' and chef="
	        + chefId;
	    Query query = session.createQuery(str);
	    if (day.equals("today"))
	      query.setInteger("date", cal.get(Calendar.DATE));
	    else
	      query.setInteger("date", cal.get(Calendar.DATE) - 1);
	    query.setInteger("month", cal.get(Calendar.MONTH) + 1);
	    query.setInteger("year", cal.get(Calendar.YEAR));

	    Map<Long, Double> map = new HashMap<Long, Double>();
	    @SuppressWarnings("rawtypes")
	    Iterator it = query.iterate();
	    Object[] row = (Object[]) it.next();
	    Long key = (Long) row[0];
	    Double value = (Double) row[1];
	    map.put(key, value);

	    return map;
	  }

	  @Override
	  public Map<Long, Double> getWeeksRevenue(long chefId) {
	    Session session = sf.getCurrentSession();
	    
	    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
	    Calendar c = Calendar.getInstance();
	    c.setTime(new Date()); // Now use today date.
	    c.add(Calendar.DATE, -7);
	    Date fromDate = null, toDate = null;
	    String fromDateStr = formatter.format(c.getTime());
	    String toDateStr = formatter.format(new Date());
	    try {
	      fromDate = formatter.parse(fromDateStr);
	      toDate = formatter.parse(toDateStr);
	    } catch (ParseException e) {
	      e.printStackTrace();
	    }
	    
	    String str = "select count(*),sum(ord.amount) from Order ord where ord.timestamp BETWEEN :stDate and :edDate and status='delivered' and chef="+chefId; 
	    Query query = session.createQuery(str);
	    query.setParameter("stDate", fromDate);
	    query.setParameter("edDate", toDate);

	    Map<Long, Double> map = new HashMap<Long, Double>();
	  
	    @SuppressWarnings("rawtypes") 
	    Iterator it = query.iterate(); 
	    Object[] row = (Object[]) it.next(); 
	    Long key = (Long) row[0]; 
	    Double value = (Double)row[1]; 
	    map.put(key, value);

	    return map;
	  }
	  
	  @Override
	  @SuppressWarnings("unchecked")
	  public List<Order> getOrdersByTime(String time, long chefId){
	    Session session = sf.getCurrentSession();
	    Calendar cal = Calendar.getInstance();
	    cal.setTime(new Date());
	    String str;
	    Query query;
	    if (time.equals("day")) {
	      str = "from Order ord where day(ord.timestamp) = :date and month(ord.timestamp) = :month and year(ord.timestamp) = :year and chef="+ chefId + " order by timestamp desc";
	      query = session.createQuery(str);
	      query.setInteger("date", cal.get(Calendar.DATE));
	      query.setInteger("month", cal.get(Calendar.MONTH) + 1);
	      query.setInteger("year", cal.get(Calendar.YEAR));
	    }
	    else if (time.equals("week")) {
	      SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
	      Calendar c = Calendar.getInstance();
	      c.setTime(new Date()); // Now use today date.
	      c.add(Calendar.DATE, -7);
	      Date fromDate = null, toDate = null;
	      String fromDateStr = formatter.format(c.getTime());
	      String toDateStr = formatter.format(new Date());
	      try {
	        fromDate = formatter.parse(fromDateStr);
	        toDate = formatter.parse(toDateStr);
	      } catch (ParseException e) {
	        e.printStackTrace();
	      }
	      
	      str = "from Order ord where ord.timestamp BETWEEN :stDate and :edDate and chef="+chefId+" order by timestamp desc"; 
	      query = session.createQuery(str);
	      query.setParameter("stDate", fromDate);
	      query.setParameter("edDate", toDate);
	    }
	    else {
	      str = "from Order ord where month(ord.timestamp) = :month and year(ord.timestamp) = :year and chef="+ chefId + " order by timestamp desc";
	      query = session.createQuery(str);
	      query.setInteger("month", cal.get(Calendar.MONTH) + 1);
	      query.setInteger("year", cal.get(Calendar.YEAR));
	    }
	    return query.list();
	  }
	
}
