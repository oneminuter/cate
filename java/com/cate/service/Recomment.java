package com.cate.service;

import com.cate.entity.Collection;

import net.sf.json.JSONObject;

public interface Recomment {
	//获取所有推荐
	public JSONObject getRecommentList();
	//收藏美食
	public JSONObject addCollect(Collection collection);
}
