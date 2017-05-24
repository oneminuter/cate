package com.cate.service;


import javax.servlet.http.HttpServletRequest;

import com.cate.entity.Address;
import com.cate.entity.Order;

import net.sf.json.JSONObject;

public interface Index {
	//获取的轮播数据
	public JSONObject getSlides(HttpServletRequest request);
	//获取美食列表
	public JSONObject getFoodList(String classify);
	//获取详情
	public JSONObject getDetail(int id);
	//获取订单信息
	public JSONObject getCheckInfo(int id, int number);
	//添加收货地址
	public JSONObject addReceiveAddress(Address address);
	//获取地址列表
	public JSONObject getAddressList(int userId);
	//提交订单
	public JSONObject submitCheck(Order order);
	//确认支付
	public JSONObject confirmPay(int id);
}
