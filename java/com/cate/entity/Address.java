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
@Table(name="address")
public class Address {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@Column(name="USER_ID")
	private int userId;
	
	@Column(name="PROVINCE", length=30)
	private String province;
	
	@Column(name="DETAIL_ADDRESS", length=30)
	private String detailAddress;
	
	@Column(name="RECEIVER_NAME", length=10)
	private String receiverName;
	
	@Column(name="RECEIVER_GENDER", length=1)
	private int receiverGender;
	
	@Column(name="PHONE")
	private String phone;

	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public int getReceiverGender() {
		return receiverGender;
	}

	public void setReceiverGender(int receiverGender) {
		this.receiverGender = receiverGender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
}
