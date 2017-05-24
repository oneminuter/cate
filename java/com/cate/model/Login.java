package com.cate.model;

public class Login {
	private int id;
	private float cash;
	private int defaultAddressId;
	private String phone;
	private String username;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public float getCash() {
		return cash;
	}
	public void setCash(float cash) {
		this.cash = cash;
	}
	public int getDefaultAddressId() {
		return defaultAddressId;
	}
	public void setDefaultAddressId(int defaultAddressId) {
		this.defaultAddressId = defaultAddressId;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
}
