package com.homion.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "chef")
public class Chef {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "chef_Generator")
	@SequenceGenerator(name = "chef_Generator",initialValue = 200000,allocationSize = 1,sequenceName = "chef_Sequence")
	private long id;
	
	@Column(name = "userName", nullable = false, unique = true)
	private String userName;
	
	@Column(name = "firstName", nullable = false)
	private String firstName;
	
	@Column(name = "lastName", nullable = false)
	private String lastName;
	
	@Column(name = "mobileNo", nullable = false, length = 10)
	private String mobileNo;
	
	@Column(name = "panNo", nullable = false, length = 10)
	private String panNo;
	
	@Column(name = "startTime", nullable = true)
	private String startTime;
	
	@Column(name = "endTime", nullable = true)
	private String endTime;
	
	@Column(name = "about", nullable = true)
	private String about;
	
	@Column(name = "status")
	private String status = "Requested";
	
	@Column(name = "image")
	private String image = "NoImage";
	
	@Column(name = "rating", nullable = false)
	private float rating = 0;
	
	@Column(name = "count", nullable = false)
	private long count = 0;
	
	@OneToOne
	private Login login;
	
	public Chef() { }
	
	public Chef(long id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Chef [id=" + id + ", userName=" + userName + ", firstName=" + firstName + ", lastName=" + lastName
				+ ", mobileNo=" + mobileNo + ", panNo=" + panNo + ", startTime=" + startTime + ", endTime=" + endTime
				+ ", about=" + about + ", status=" + status + ", image=" + image + ", rating=" + rating + ", count="
				+ count + ", login=" + login + "]";
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getPanNo() {
		return panNo;
	}

	public void setPanNo(String panNo) {
		this.panNo = panNo;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
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

	public Login getLogin() {
		return login;
	}

	public void setLogin(Login login) {
		this.login = login;
	}
	
}
