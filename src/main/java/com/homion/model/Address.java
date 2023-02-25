package com.homion.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="address")
public class Address {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "address_Generator")
	@SequenceGenerator(name = "address_Generator",initialValue = 600000, allocationSize = 1,sequenceName = "address_Sequence")
	@Column(name="id")
	private long id;
	
	@Column(name = "homeNo", nullable = false)
	private Integer homeNo;
	
	@Column(name = "societyName", nullable = false)
	private String societyName;
	
	@Column(name = "landmark", nullable = false)
	private String landmark;
	
	@Column(name = "area", nullable = false)
	private String area;
	
	@Column(name = "pincode", nullable = false, length=6)
	private String pincode;

	@Column(name = "type", nullable = false)
	private String type = "Home";
	
	@Column(name = "ownerId", nullable = false)
	private long ownerId;
	
	public Address() { }
	
	public Address(long id) {
		this.id = id;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
	
	public Integer getHomeNo() {
		return homeNo;
	}

	public void setHomeNo(Integer homeNo) {
		this.homeNo = homeNo;
	}

	public String getSocietyName() {
		return societyName;
	}

	public void setSocietyName(String societyName) {
		this.societyName = societyName;
	}

	public String getLandmark() {
		return landmark;
	}

	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public long getOwnerId() {
		return ownerId;
	}

	public void setOwnerId(long ownerId) {
		this.ownerId = ownerId;
	}

}