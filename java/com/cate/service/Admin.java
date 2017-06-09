package com.cate.service;

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
}
