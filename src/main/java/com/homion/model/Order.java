package com.homion.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "orders")
public class Order {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "order_Generator")
	@SequenceGenerator(name = "order_Generator",initialValue = 300000, allocationSize = 1,sequenceName = "order_Sequence")
	@Column(name="id")
	private long id;
	
	@Column(name = "amount", nullable = false)
	private float amount;
	
	@Column(name = "timestamp")
	private Date timestamp = new Date();
	
	@Column(name = "status", nullable = false)
	private String status = "new";
	
	@Column(name = "paymentMode", nullable = false)
	private String paymentMode = "cash";
	
	@OneToOne
	private Address address;
	
	@OneToOne
	private User user;
	
	@OneToOne
	private Chef chef;
	
	@OneToOne
	private Feedback feedback;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public float getAmount() {
		return amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
	}

	public Date getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Date timestamp) {
		this.timestamp = timestamp;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPaymentMode() {
		return paymentMode;
	}

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Chef getChef() {
		return chef;
	}

	public void setChef(Chef chef) {
		this.chef = chef;
	}

	public Feedback getFeedback() {
		return feedback;
	}

	public void setFeedback(Feedback feedback) {
		this.feedback = feedback;
	}
	
}
