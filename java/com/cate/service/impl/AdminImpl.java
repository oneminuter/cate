package com.cate.service.impl;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.sf.json.JSONObject;

import com.cate.dao.BannerDao;
import com.cate.dao.CommunityDao;
import com.cate.dao.FoodDao;
import com.cate.dao.OrderDao;
import com.cate.dao.UserDao;
import com.cate.entity.Banner;
import com.cate.entity.Food;
import com.cate.entity.Order;
import com.cate.entity.User;
import com.cate.model.Header;
import com.cate.model.OrderList;
import com.cate.model.UserInfo;
import com.cate.service.Admin;
import com.cate.util.FileUtil;
@Service
public class AdminImpl implements Admin {
	@Autowired
	private Header header;
	Map<String, Object> map = null;
	@Autowired
	private Banner banner;
	@Autowired
	private BannerDao bannerDao;
	@Autowired
	private FoodDao foodDao;
	@Autowired
	private CommunityDao communityDao;
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private UserDao userDao;
	
	/**
	 * 添加banner
	 */
	@Override
	public JSONObject uploadBanner(String img, String link, HttpServletRequest request) {
		FileUtil fileUtil = new FileUtil();
		banner.setImgUrl(fileUtil.saveBase64ToFile(img, request));
		banner.setLinkUrl(link);
		
		map = new HashMap<String, Object>();
		if(bannerDao.add(banner)){
			header.setSuccess(true);
		}else{
			header.setErrorInfo("数据库插入失败");
			header.setSuccess(false);
		}
		map.put("header", header);
		return JSONObject.fromObject(map);
	}

	/**
	 * 添加美食
	 */
	@Override
	public JSONObject addFood(Food food, HttpServletRequest request) {
		FileUtil fileUtil = new FileUtil();
		food.setImgUrl(fileUtil.saveBase64ToFile(food.getImgUrl(), request));
		
		map = new HashMap<String, Object>();
		if(foodDao.add(food)){
			header.setSuccess(true);
		}else{
			header.setErrorInfo("数据库插入失败");
			header.setSuccess(false);
		}
		map.put("header", header);
		return JSONObject.fromObject(map);
	}

	@Override
	public JSONObject getSlideList() {
		map = new HashMap<String, Object>();
		List<Banner> list = bannerDao.query();
		if(list.size() > 0){
			header.setSuccess(true);
			map.put("body", list);
		}else{
			header.setSuccess(false);
			header.setErrorInfo("数据库为空");
		}
		map.put("header", header);
		return JSONObject.fromObject(map);
	}

	@Override
	public JSONObject editUrlLink(int id, String url) {
		map = new HashMap<String, Object>();
		if( !bannerDao.editLinkUrlById(id, url) ){
			header.setSuccess(false);
			header.setErrorInfo("修改链接失败");
		}else{
			header.setSuccess(true);
		}
		map.put("header", header);
		return JSONObject.fromObject(map);
	}

	@Override
	public JSONObject deleteBanner(int id) {
		if( !bannerDao.deleteBannerById(id) ){
			header.setSuccess(false);
			header.setErrorInfo("删除banner失败");
		}else{
			header.setSuccess(true);
		}
		map = new HashMap<String,Object>();
		map.put("header", header);
		return JSONObject.fromObject(map);
	}

	@Override
	public JSONObject deleteFoodById(int id) {
		if( !foodDao.deleteFoodById(id) ){
			header.setSuccess(false);
			header.setErrorInfo("删除失败");
		}else{
			header.setSuccess(true);
		}
		map = new HashMap<String,Object>();
		map.put("header", header);
		return JSONObject.fromObject(map);
	}

	@Override
	public JSONObject modifyFoodInfo(int id, String key, String val) {
		if( !foodDao.modifyFoodById(id, key, val) ){
			header.setSuccess(false);
			header.setErrorInfo("修改失败");
		}else{
			header.setSuccess(true);
		}
		map = new HashMap<String,Object>();
		map.put("header", header);
		return JSONObject.fromObject(map);
	}

	@Override
	public JSONObject getAllFoodList() {
		List<Food> list = foodDao.queryAllFoodList();
		map = new HashMap<String, Object>();
		if(list.size() > 0){
			header.setSuccess(true);
			map.put("body", list);
		}else{
			header.setSuccess(false);
			header.setErrorInfo("数据库为空");
		}
		map.put("header", header);
		return JSONObject.fromObject(map);
	}

	@Override
	public JSONObject deleteTopic(int id) {
		map = new HashMap<String, Object>();
		if(!communityDao.deleteTopicById(id)){
			header.setSuccess(false);
			header.setErrorInfo("删除失败");
		}else{
			header.setSuccess(true);
		}
		map.put("header", header);
		return JSONObject.fromObject(map);
	}

	@Override
	public JSONObject getAllOrderList() {
		List<Order> list = orderDao.queryAllOrder();
		map = new HashMap<String, Object>();
		if(list.size() > 0){
			header.setSuccess(true);
			List<OrderList> lol = new ArrayList<OrderList>();
			Order o = null;
			User user = null;
			OrderList ol = null;
			for (int i = 0; i < list.size(); i++) {
				o = list.get(i);
				user = new User();
				user = userDao.queryById(o.getUserId());
				ol = new OrderList();

				ol.setId(o.getId());
				ol.setOrderId(o.getOrderId());
				ol.setFoodName(o.getFoodName());
				ol.setPayment(o.getPayment());
				ol.setOrderDate(o.getOrderDate());
				ol.setPayMethod(o.getPayMethod());
				ol.setState(o.getState());
				ol.setPhone(user.getPhone());
				ol.setUsername(user.getUsername());
				
				ol.setFoodId(o.getFoodId());
				ol.setImgUrl(null);
				ol.setUserId(user.getId());
				
				lol.add(ol);
			}
			map.put("body", lol);
		}else{
			header.setSuccess(false);
			header.setErrorInfo("数据库为空");
		}
		map.put("header", header);
		return JSONObject.fromObject(map);
	}

	@Override
	public JSONObject modifyOrderState(int id, int state) {
		map = new HashMap<String, Object>();
		if( !orderDao.modifyOrderState(id, state) ){
			header.setErrorInfo("修改订单状态失败");
			header.setSuccess(false);
		}else{
			header.setSuccess(true);
		}
		map.put("header", header);
		return JSONObject.fromObject(map);
	}

	@Override
	public JSONObject getUserList() {
		map = new HashMap<String, Object>();
		List<User> list = userDao.queryAllUser();
		if(list.size() > 0 ){
			header.setSuccess(true);
			List<UserInfo> luI = new ArrayList<UserInfo>();
			User u = null;
			UserInfo userInfo = null;
			for(int i = 0; i < list.size(); i++){
				u = new User();
				u = list.get(i);
				userInfo = new UserInfo();
				
				userInfo.setBalance(u.getBalance());
				userInfo.setCash(u.getCash());
				userInfo.setDefaultAddressId(u.getDefaultAddressId());
				userInfo.setGender(u.getGender());
				userInfo.setIcon(u.getIcon());
				userInfo.setId(u.getId());
				userInfo.setIntegral(u.getIntegral());
				userInfo.setIsAdmin(u.getIsAdmin());
				userInfo.setPhone(u.getPhone());
				userInfo.setUsername(u.getUsername());
				
				luI.add(userInfo);
			}
			map.put("body", luI);
		}else{
			header.setErrorInfo("数据库为空");
			header.setSuccess(false);
		}
		map.put("header", header);
		return JSONObject.fromObject(map);
	}
	
	@Override
	public JSONObject saveEditUser(int id, Enumeration<String> paraNames, HttpServletRequest request) {
		map = new HashMap<String,Object>();
		header.setSuccess(true);
		for(Enumeration<String> e = paraNames; e.hasMoreElements();){
			String thisKey = e.nextElement().toString();
			String thisValue = request.getParameter(thisKey);
			//System.out.println("key:"+thisKey+"------value:"+thisValue);
			if(!thisKey.equals("id")){
				if( !userDao.editUserInfo(id, thisKey, thisValue) ){
					header.setSuccess(false);
					header.setErrorInfo("修改" + thisKey + "失败");
					break;
				}
			}
		}
		map.put("header", header);
		return JSONObject.fromObject(map);
	}
	
	@Override
	public JSONObject deleteUser(int id) {
		map = new HashMap<String, Object>();
		if( !userDao.deleteUserById(id) ){
			header.setSuccess(false);
			header.setErrorInfo("删除失败");
		}else{
			header.setSuccess(true);
		}
		map.put("header", header);
		return JSONObject.fromObject(map);
	}

	@Override
	public JSONObject uploadUserIcon(int id, String base64, HttpServletRequest request) {
		map = new HashMap<String, Object>();
		FileUtil fileUtil = new FileUtil();
		String icon = fileUtil.saveBase64ToFile(base64, request);
		if( !userDao.uploadUserIcon(id, icon) ){
			header.setSuccess(false);
			header.setErrorInfo("修改头像失败");
		}else{
			header.setSuccess(true);
		}
		map.put("header", header);
		return JSONObject.fromObject(map);
	}

}
