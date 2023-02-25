package com.homion.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homion.dao.GeneralDAO;
import com.homion.model.Address;
import com.homion.model.Login;
import com.homion.model.State;

@Service
@Transactional
public class GeneralServiceImpl implements GeneralService {
	
	@Autowired
	private GeneralDAO generalDAO;
	
	@Override
	@SuppressWarnings("rawtypes")
	public List getAllRows(String className) {
		return generalDAO.getAllRows(className);
	}
	
	@Override
	@SuppressWarnings("rawtypes")
	public List getAllRows(String className, long id) {
		return generalDAO.getAllRows(className, id);
	}
	
	@Override
	public Object findByEmail(String email) {
		return this.generalDAO.findByEmail(email);
	}
	
	@Override
	public List<State> getState() {
		return this.generalDAO.getState();
	}

	@Override
	public List<Address> getAddress(long id) {
		List<Address> address = generalDAO.getAddress(id);
		return address;
	}

	/*
	 * @param type : type of address [Home/Work/Other]
	 */
	@Override
	public void addAddress(Address address, long ownerId, String type) {
		address.setType(type);
		address.setOwnerId(ownerId);
		this.generalDAO.save(address);
	}

	@Override
	public State findStateById(int id) {
		return this.generalDAO.findStateById(id);
	}
	
	@Override
	public List<Object> getDetails(String className, long id) {
		return this.generalDAO.getDetails(className, id);
	}
	
	@Override
	public void save(Object object) {
		generalDAO.save(object);
	}
	
	@Override
	public Object verifyCredentials(Login login) {
		return generalDAO.verifyCredentials(login);
	}
	
	@Override
	public String getLastSequenceValue(String sequenceName) {
		return generalDAO.getLastSequenceValue(sequenceName);
	}
	
	@Override
	public Object getObjectById(String className, long id) {
		return generalDAO.getObjectById(className, id);
	}
	
}
