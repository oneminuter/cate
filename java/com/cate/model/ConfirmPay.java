package com.cate.model;

public class ConfirmPay {
	private int orderId; //订单id
	private String storeName; //店铺名
	private float payMent; //待支付
	private String payMethod; //支付方式
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public float getPayMent() {
		return payMent;
	}
	public void setPayMent(float payMent) {
		this.payMent = payMent;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
}
