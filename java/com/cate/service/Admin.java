package com.cate.service;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import com.cate.entity.Food;

import net.sf.json.JSONObject;

public interface Admin {
	//上传banner
	public JSONObject uploadBanner(String img, String link, HttpServletRequest request);
	//添加美食
	public JSONObject addFood(Food food, HttpServletRequest request);
	//获取幻灯banner列表
	public JSONObject getSlideList();
	//修改banner的链接url
	public JSONObject editUrlLink(int id, String url);
	//删除banner
	public JSONObject deleteBanner(int id);
	//删除食物
	public JSONObject deleteFoodById(int id);
	//修改食物信息
	public JSONObject modifyFoodInfo(int id, String key, String val);
	//获取所有食物列表
	public JSONObject getAllFoodList();
	//删除话题
	public JSONObject deleteTopic(int id);
	//获取所有订单列表
	public JSONObject getAllOrderList();
	//修改订单状态
	public JSONObject modifyOrderState(int id, int state);
	//获取用户列表
	public JSONObject getUserList();
	//保存用户信息
	public JSONObject saveEditUser(int id, Enumeration<String> paraNames, HttpServletRequest request);
	//删除用户
	public JSONObject deleteUser(int id);
	//上传用户头像
	public JSONObject uploadUserIcon(int id, String base64,HttpServletRequest request);
}
