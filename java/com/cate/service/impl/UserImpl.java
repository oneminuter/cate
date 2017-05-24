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
import com.cate.dao.UserDao;
import com.cate.entity.Order;
import com.cate.entity.User;
import com.cate.model.Header;
import com.cate.model.Login;
import com.cate.model.OrderList;
import com.cate.service.UserCenter;
@Service
public class UserImpl implements UserCenter {
	@Autowired
	FoodDao foodDao;
	@Autowired
	OrderDao orderDao;
	@Autowired
	Header header;
	@Autowired
	UserDao userDao;
	@Autowired
	User user;
	
	Map<String, Object> map = null;

	@SuppressWarnings({ "rawtypes", "unchecked" })
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
	
	public JSONObject register(String phone, String password) {
		map = new HashMap<String, Object>();
		user.setPhone(phone);
		user.setPassword(password);
		if(userDao.queryByPhone(phone) != null){
			header.setSuccess(false);
			header.setErrorInfo("该账号已注册");
		}else{
			if( !userDao.add(user) ){
				header.setSuccess(false);
				header.setErrorInfo("注册失败");
			}else{
				header.setSuccess(true);
			}
		}
		map.put("header", header);
		return JSONObject.fromObject(map);
	}

	@Override
	public JSONObject login(String phone, String password) {
		map = new HashMap<String, Object>();
		user = userDao.queryByPhone(phone);
		if(user == null){
			header.setSuccess(false);
			header.setErrorInfo("用户不存在");
		}else{
			if( !password.equals( user.getPassword() ) ){
				header.setSuccess(false);
				header.setErrorInfo("密码错误");
			}else{
				header.setSuccess(true);
				
				Login login = new Login();
				login.setCash(user.getCash());
				login.setDefaultAddressId(user.getDefaultAddressId());
				login.setId(user.getId());
				login.setPhone(user.getPhone());
				login.setUsername(user.getUsername());
				
				map.put("body", login);
			}
		}
		map.put("header", header);
		return JSONObject.fromObject(map);
	}

}
