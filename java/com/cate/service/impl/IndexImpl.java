package com.cate.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cate.dao.BannerDao;
import com.cate.dao.FoodDao;
import com.cate.dao.OrderDao;
import com.cate.entity.Banner;
import com.cate.entity.Food;
import com.cate.entity.Order;
import com.cate.model.Header;
import com.cate.service.Index;
import com.cate.util.DateUtil;

@Service
@Transactional
public class IndexImpl implements Index {
	@Autowired
	Header header;
	@Autowired
	BannerDao bannerDao;
	@Autowired
	FoodDao foodDao;
	@Autowired
	Order order;
	@Autowired
	OrderDao orderDao;
	
	Map<String, Object> map = new HashMap<String, Object>();

	@Override
	public JSONObject getSlides(HttpServletRequest request) {
//		List<Banner> list = new BannerDao().query();
		List<Banner> list = bannerDao.query();
		if( list.size() > 0 ) {
			header.setSuccess(true);
			map.put("header", header);
			map.put("body", list);
		} else {
			header.setErrorInfo("数据库中没有数据");
			header.setSuccess(false);
			map.put("header", header);
		}
		return JSONObject.fromObject(map);
	}

	@Override
	public JSONObject getFoodList(String classify) {
//		List<Food> foodList = new FoodDao().queryByClassify(classify);
		List<Food> foodList = foodDao.queryByClassify(classify);
		if(foodList.size() > 0){
			header.setSuccess(true);
		}else{
			header.setErrorInfo("数据库中没有数据");
			header.setSuccess(false);
		}
		map.put("header", header);
		map.put("body", foodList);
		return JSONObject.fromObject(map);
	}

	@Override
	public JSONObject getDetail(int id) {
//		Food food = new FoodDao().queryById(id);
		Food food = foodDao.queryById(id);
		if(food == null){
			header.setSuccess(false);
			header.setErrorInfo("查询错误，返回结果为空");
			map.put("header", header);
		}else{
			header.setSuccess(true);
			map.put("header", header);
			map.put("body", food);
		}
		return JSONObject.fromObject(map);
	}

	@Override
	public JSONObject getCheckInfo(int id, int number) {
		Food food = foodDao.queryById(id);
		String uid = UUID.randomUUID().toString();
		float cost = 0;
		
		order.setCash(2);
		order.setStoreName(food.getStoreName());
		order.setName(food.getName());
		order.setPackFee((float) 1.5);
		order.setFreight(5);
		order.setFavorablePrice(4);
		
		cost = food.getPrice() * number + order.getPackFee() + order.getFreight() - order.getCash() - order.getFavorablePrice();
		order.setCost(cost);
		order.setOrderId(uid);
		order.setFoodId(id);
		order.setBuyNumber(number);
		order.setPrice(food.getPrice());
		order.setOrderDate(DateUtil.getTimestamp());;
		order.setState(0);
		order.setPeopleNumber(1);
		order.setOther("");
		order.setStoreName("");
		
		orderDao.add(order);
		return JSONObject.fromObject(order);
	}
	
}
