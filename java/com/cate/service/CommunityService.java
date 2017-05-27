package com.cate.service;

import net.sf.json.JSONObject;

public interface CommunityService {
	//获取社区话题列表
	public JSONObject getCommunityList();
	//获取话题详情
	public JSONObject getTopicDetail(int topicId);
}
