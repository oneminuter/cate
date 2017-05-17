package com.cate.service;


import javax.servlet.http.HttpServletRequest;

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
}
