package com.cate.service;

import net.sf.json.JSONObject;

public interface User {
	//获取订单列表
	public JSONObject getOrderList(int userId);
}
