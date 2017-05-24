package com.cate.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.sf.json.JSONObject;

import com.cate.dao.FoodDao;
import com.cate.dao.OrderDao;
import com.cate.entity.Order;
import com.cate.model.Header;
import com.cate.model.OrderList;
import com.cate.service.User;
@Service
public class UserImpl implements User {
	@Autowired
	FoodDao foodDao;
	@Autowired
	OrderDao orderDao;
	@Autowired
	Header header;
	
	Map<String, Object> map = null;

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public JSONObject getOrderList(int userId) {
		map = new HashMap<String, Object>();
		List<Order> list = orderDao.queryByUserId(userId);
		List<OrderList> orderList = null;
		String imgUrl = null;
		if(list.size() > 0){
			orderList = new ArrayList();
			for(int i = 0; i < list.size(); i++){
				Order order = list.get(i);
				
				imgUrl = foodDao.getImgUrl(order.getFoodId());
				OrderList ol = new OrderList();
				ol.setFoodId(order.getFoodId());
				ol.setFoodName(order.getFoodName());
				ol.setImgUrl(imgUrl);
				ol.setOrderDate(order.getOrderDate());
				ol.setOrderId(order.getOrderId());
				ol.setPayment(order.getPayment());
				ol.setUserId(order.getUserId());
				ol.setState(order.getState());
				orderList.add(ol);
			}
			
			header.setSuccess(true);
			map.put("body", orderList);
		} else {
			header.setSuccess(false);
			header.setErrorInfo("订单列表数据为空");
		}
		map.put("header", header);
		
		return JSONObject.fromObject(map);
	}

}
