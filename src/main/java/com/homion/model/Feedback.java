package com.homion.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "feedback")
public class Feedback {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private long id;

	@Column(name = "foodRating", nullable = false)
	private int foodRating = 0;

	@Column(name = "chefRating", nullable = false)
	private int chefRating = 0;

	@Column(name = "comment", nullable = true)
	private String comment;
	
	//	private Order order;
	
	public Feedback() { }
	
	public Feedback(int foodRating, int chefRating, String comment) {
		this.foodRating = foodRating;
		this.chefRating = chefRating;
		this.comment = comment;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public int getFoodRating() {
		return foodRating;
	}

	public void setFoodRating(int foodRating) {
		this.foodRating = foodRating;
	}

	public int getChefRating() {
		return chefRating;
	}

	public void setChefRating(int chefRating) {
		this.chefRating = chefRating;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

}