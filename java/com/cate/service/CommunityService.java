package com.cate.service;

import com.cate.entity.Collection;
import com.cate.entity.Comment;
import com.cate.entity.Community;

import net.sf.json.JSONObject;

public interface CommunityService {
	//获取社区话题列表
	public JSONObject getCommunityList();
	//获取话题详情
	public JSONObject getTopicDetail(int topicId);
	//添加社区话题,发表话题
	public JSONObject addTopic(Community c);
	//添加评论
	public JSONObject addComment(Comment comment);
	//获取话题的评论列表
	public JSONObject getTopicCommentList(int topicId);
	//收藏话题
	public JSONObject addTopicCollect(Collection collection);
}
