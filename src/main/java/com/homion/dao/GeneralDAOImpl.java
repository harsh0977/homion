package com.homion.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.homion.model.Address;
import com.homion.model.Login;
import com.homion.model.State;

@Repository
public class GeneralDAOImpl implements GeneralDAO {

	@Autowired
	private SessionFactory sf;
	
	// for drop down area, category, sub-category 
	@Override
	@SuppressWarnings("rawtypes")
	public List getAllRows(String className) {
		Session session = this.sf.getCurrentSession();
		Query query;
		if(className.equals("Product"))
			query = session.createQuery("from " + className + " where status != 'deleted'  order by id desc");
		else
			query = session.createQuery("from " + className + " where status = true order by name");
		List list = query.list();
		return list;
	}
	
	// product list of particular chef
	@Override
	@SuppressWarnings("rawtypes")
	public List getAllRows(String className, long id) {
		Session session = this.sf.getCurrentSession();
		Query query = session.createQuery("from " + className + " where status != 'deleted' and chef = " + id + "order by rating desc");
		List list = query.list();
		return list;
	}
	
	@Override
	public Object findByEmail(String email) {
	    Session session = this.sf.getCurrentSession();
	    Query query = session.createQuery("from Login where email = '" + email + "'");
	    @SuppressWarnings("unchecked")
	    List<Object> list = query.list();
	    return list.size() > 0 ? list.get(0) : null;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<State> getState() {
		Session session = this.sf.getCurrentSession();
		Query query = session.createQuery("from State");
		List<State> states = query.list();
		return states;
	}
	
	@Override
	public State findStateById(int id) {
		Session session = this.sf.getCurrentSession();
		Query query = session.createQuery("from State where id = " + id);
		State state = (State)query.list().get(0);
		return state;
	}
	
	@Override
	public List<Address> getAddress(long id) {
		Session session = this.sf.getCurrentSession();
		Query query = session.createQuery("from Address where ownerId = " + id);
		@SuppressWarnings("unchecked")
		List<Address> address = query.list();
		return address;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Object> getDetails(String className,long id) {
	    List<Object> ls=new ArrayList<Object>();
	    try {
	      Session s=sf.getCurrentSession();
	      Query q=s.createQuery("from " + className + " where status=true and id="+id);
	      ls=q.list();
	    }
	    catch(Exception e) {
	      e.printStackTrace();
	    }
	    return ls;
	}
	
	@Override
	public void save(Object object) {
		Session session = this.sf.getCurrentSession();
		session.saveOrUpdate(object);
	}
	
	@Override
	public Object verifyCredentials(Login login) {
		Session session = this.sf.getCurrentSession();
		Criteria criteria = session.createCriteria(Login.class);
		criteria.add(Restrictions.eq("email",login.getEmail()))
				.add(Restrictions.eq("password", login.getPassword()))
				.add(Restrictions.eq("type", login.getType()));
		@SuppressWarnings("unchecked")
		List<Login> list = criteria.list();
		if(list.size() == 0) return null;
		login = list.get(0);
		Query query = session.createQuery("from "+ login.getType() +" where login = " + login.getId());
		return query.list().get(0);
	}
	
	@Override
	public String getLastSequenceValue(String sequenceName) {
		Session session = this.sf.getCurrentSession();
		Query query = session.createSQLQuery("SELECT last_value FROM " + sequenceName);
		return query.list().get(0).toString();
	}
	
	@Override
	public Object getObjectById(String className, long id) {
		Session session = this.sf.getCurrentSession();
		Query query = session.createQuery("from " + className + " where id = " + id);
		return query.list().get(0);
	}
	
}
