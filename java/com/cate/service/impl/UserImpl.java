package com.cate.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.sf.json.JSONObject;

import com.cate.dao.CollectionDao;
import com.cate.dao.CommunityDao;
import com.cate.dao.FoodDao;
import com.cate.dao.OrderDao;
import com.cate.dao.UserDao;
import com.cate.entity.Collection;
import com.cate.entity.Community;
import com.cate.entity.Food;
import com.cate.entity.Order;
import com.cate.entity.User;
import com.cate.model.CollectionList;
import com.cate.model.Header;
import com.cate.model.UserInfo;
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
	@Autowired
	CollectionDao collectionDao;
	@Autowired
	CommunityDao communityDao;
	
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
				
				UserInfo userInfo = new UserInfo();
				userInfo.setCash(user.getCash());
				userInfo.setDefaultAddressId(user.getDefaultAddressId());
				userInfo.setId(user.getId());
				userInfo.setPhone(user.getPhone());
				userInfo.setUsername(user.getUsername());
				userInfo.setBalance(user.getBalance());
				
				map.put("body", userInfo);
			}
		}
		map.put("header", header);
		return JSONObject.fromObject(map);
	}

	@Override
	public JSONObject getUserInfo(String phone) {
		map = new HashMap<String, Object>();
		user = userDao.queryByPhone(phone);
		
		if(user == null){
			header.setSuccess(false);
			header.setErrorInfo("用户信息为空");
		}else{
			header.setSuccess(true);
			
			UserInfo userInfo = new UserInfo();
			userInfo.setId(user.getId());
			userInfo.setPhone(user.getPhone());
			userInfo.setUsername(user.getUsername());
			userInfo.setCash(user.getCash());
			userInfo.setDefaultAddressId(user.getDefaultAddressId());
			userInfo.setBalance(user.getBalance());
			userInfo.setIcon(user.getIcon());
			userInfo.setIntegral(user.getIntegral());
			
			map.put("body", userInfo);
		}
		map.put("header", header);
		return JSONObject.fromObject(map);
	}

	@Override
	public JSONObject getCollectionList(int userId) {
		Map<String, Object> map = new HashMap<String,Object>();
		List<Collection> list = collectionDao.queryByUserId(userId);
		List<CollectionList> lcl = new ArrayList<CollectionList>();
		if(list.size() > 0){
			Collection c = null;
			CollectionList cl = null;
			
			header.setSuccess(true);
			for(int i = 0; i < list.size(); i++){
				c = new Collection();
				cl = new CollectionList();
				String introduce = null;
				String title = null;
				
				c = list.get(i);
				
				if(c.getCommunityId() != 0){
					cl.setRelationId(c.getCommunityId());
					cl.setClassify("community");
					Community community = communityDao.queryById(c.getCommunityId());
					introduce = community.getContent();
					title = community.getTitle();
				}else if(c.getFoodId() != 0){
					cl.setRelationId(c.getFoodId());
					cl.setClassify("food");
					Food food = foodDao.queryById(c.getFoodId());
					introduce = food.getContent();
					title = food.getName();
				}else if(c.getRecommentId() == 0){
					cl.setRelationId(c.getRecommentId());
					cl.setClassify("recomment");
					introduce = "推荐内容还在努力开发中";
					title = "推荐标题";
				}else{
					header.setSuccess(false);
					header.setErrorInfo("我的收藏数据有错误");
				}
				cl.setId(c.getId());
				cl.setIntroduce(introduce);
				cl.setTitle(title);
				lcl.add(cl);
			}
			map.put("body", lcl);
		}else{
			header.setSuccess(false);
			header.setErrorInfo("数据库为空");
		}
		map.put("header", header);
		return JSONObject.fromObject(map);
	}
}
