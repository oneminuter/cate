package com.cate.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name="orders")
public class Order {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO) //设置主键自动增长
	private int id;
	
	@Column(name="ORDER_ID", length=64)
	private String orderId;
	
	@Column(name="FOOD_ID", length=11)
	private int foodId; //食物id
	
	@Column(name="CASH", precision=4, scale=1)
	private float cash; //代金券
	
	@Column(name="STORE_NAME", length=20, columnDefinition="varchar(20) default ''")
	private String storeName; //店名
	
	@Column(name="FOOD_NAME", length=30)
	private String foodName; //食物名
	
	@Column(name="PRICE", precision=6, scale=1)
	private float price; //价格
	
	@Column(name="FOOD_COST", precision=6, scale=1)
	private float foodCost;
	
	@Column(name="BUY_NUMBER", length=2)
	private int buyNumber;
	
	@Column(name="PACK_FEE", precision=3, scale=1)
	private float packFee; //包装费
	
	@Column(name="FREIGHT", precision=3, scale=1)
	private float freight; //运费
	
	@Column(name="FAVORABLE_PRICE", precision=3, scale=1)
	private float favorablePrice; //满减优惠价
	
	@Column(name="TOTAL_COST",precision=7, scale=1)
	private float totalCost; //总花费，不算用代金券抵扣
	
	@Column(name="PAYMENT", precision=7, scale=1)
	private float payment; //待支付
	
	@Column(name="PEOPLE_NUMBER", length=2, columnDefinition="int(2) default 1")
	private int peopleNumber;
	
	@Column(name="OTHER", length=30, columnDefinition="varchar(30) default ''")
	private String other; //其他备注
	
	@Column(name="STATE", length=1)
	private int state; //订单状态
	
	@Column(name="ORDER_DATE", columnDefinition="DATETIME")
	private Date orderDate; //下单日期

	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public int getFoodId() {
		return foodId;
	}

	public void setFoodId(int foodId) {
		this.foodId = foodId;
	}

	public float getCash() {
		return cash;
	}

	public void setCash(float cash) {
		this.cash = cash;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getBuyNumber() {
		return buyNumber;
	}

	public void setBuyNumber(int buyNumber) {
		this.buyNumber = buyNumber;
	}

	public float getPackFee() {
		return packFee;
	}

	public void setPackFee(float packFee) {
		this.packFee = packFee;
	}

	public float getFreight() {
		return freight;
	}

	public void setFreight(float freight) {
		this.freight = freight;
	}

	public float getFavorablePrice() {
		return favorablePrice;
	}

	public void setFavorablePrice(float favorablePrice) {
		this.favorablePrice = favorablePrice;
	}

	public int getPeopleNumber() {
		return peopleNumber;
	}

	public void setPeopleNumber(int peopleNumber) {
		this.peopleNumber = peopleNumber;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public float getFoodCost() {
		return foodCost;
	}

	public void setFoodCost(float foodCost) {
		this.foodCost = foodCost;
	}

	public float getPayment() {
		return payment;
	}

	public void setPayment(float payment) {
		this.payment = payment;
	}

	public float getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(float totalCost) {
		this.totalCost = totalCost;
	}
	

	
	
	
}
