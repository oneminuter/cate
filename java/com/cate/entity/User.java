package com.cate.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name="user")
public class User {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@Column(name="PHONE",length=11)
	private String phone;
	
	@Column(name="PASSWORD", length=32)
	private String password;
	
	@Column(name="UERNAME", length=15)
	private String username;
	
	@Column(name="CASH",precision=4, scale=1)
	private float cash;
	
	@Column(name="GENDER")
	private int gender;
	
	@Column(name="DEFAULT_ADDRESS_ID", length=11)
	private int defaultAddressId;
	
	@Column(name="BALANCE",precision=5, scale=2)
	private float balance;
	
	@Column(name="ICON", length=255)
	private String icon;
	
	@Column(name="INTEGRAL")
	private int integral;
	
	@Column(name="IS_ADMIN",columnDefinition="TINYINT")
	private int isAdmin;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public float getCash() {
		return cash;
	}

	public void setCash(float cash) {
		this.cash = cash;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public int getDefaultAddressId() {
		return defaultAddressId;
	}

	public void setDefaultAddressId(int defaultAddressId) {
		this.defaultAddressId = defaultAddressId;
	}

	public float getBalance() {
		return balance;
	}

	public void setBalance(float balance) {
		this.balance = balance;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public int getIntegral() {
		return integral;
	}

	public void setIntegral(int integral) {
		this.integral = integral;
	}

	public int getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}
}
