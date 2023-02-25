package com.homion.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "product_Generator")
	@SequenceGenerator(name = "product_Generator",initialValue = 400000,allocationSize = 1,sequenceName = "product_Sequence")
	private long id;
	
	@Column(name = "name", nullable = false)
	private String name;
	
	@Column(name = "price", nullable = false)
	private float price;
	
	@Column(name = "unitValue", nullable = false)
	private int unitValue;
	
	@Column(name = "unit", nullable = false)
	private String unit;
	
	@Column(name = "preparationTime", nullable = false)
	private int preparationTime;
	
	@Column(name = "image", nullable = false)
	private String image = "NoImage";
	
	@Column(name = "jainAvailable", nullable = false)
	private boolean jainAvailable = false;
	
	@Column(name = "openForHome", nullable = false)
	private boolean openForHome = false;

	@Column(name = "status", nullable = false)
	private String status = "out-of-stock";
	
	@Column(name = "speciality", nullable = false)
	private boolean speciality;
	
	@Column(name = "rating", nullable = false)
	private float rating = 0;
	
	@Column(name = "count", nullable = false)
	private long count = 0;
	
	@ManyToOne
	private Category category;
	
	@ManyToOne
	private SubCategory subCategory;
	
	@ManyToOne
	private Chef chef;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getPreparationTime() {
		return preparationTime;
	}

	public void setPreparationTime(int preparationTime) {
		this.preparationTime = preparationTime;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public boolean isJainAvailable() {
		return jainAvailable;
	}

	public void setJainAvailable(boolean jainAvailable) {
		this.jainAvailable = jainAvailable;
	}

	public Chef getChef() {
		return chef;
	}

	public void setChef(Chef chef) {
		this.chef = chef;
	}

	public boolean isOpenForHome() {
		return openForHome;
	}

	public void setOpenForHome(boolean openForHome) {
		this.openForHome = openForHome;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public boolean isSpeciality() {
		return speciality;
	}

	public void setSpeciality(boolean speciality) {
		this.speciality = speciality;
	}

	public float getRating() {
		return rating;
	}

	public void setRating(float rating) {
		this.rating = rating;
	}

	public long getCount() {
		return count;
	}

	public void setCount(long count) {
		this.count = count;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public SubCategory getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(SubCategory subCategory) {
		this.subCategory = subCategory;
	}

	public int getUnitValue() {
		return unitValue;
	}

	public void setUnitValue(int unitValue) {
		this.unitValue = unitValue;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}
	
}