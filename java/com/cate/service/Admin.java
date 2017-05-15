package com.cate.service;

import javax.servlet.http.HttpServletRequest;

import com.cate.entity.Food;

import net.sf.json.JSONObject;

public interface Admin {
	//上传banner
	public JSONObject uploadBanner(String img, String link, HttpServletRequest request);
	//添加美食
	public JSONObject addFood(Food food, HttpServletRequest request);
}
