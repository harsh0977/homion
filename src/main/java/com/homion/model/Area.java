package com.homion.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "area")
public class Area {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "area_Generator")
	@SequenceGenerator(name = "area_Generator", initialValue = 700000, allocationSize = 1, sequenceName = "area_Sequence")
	@Column(name = "id")
	private long id;

	@Column(name = "name", nullable = false)
	private String name;

	@Column(name = "pincode", nullable = false, length = 6)
	private String pincode;

	@Column(name = "status", nullable = false)
	private boolean status = true; // false : not available :: true : available

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

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

}