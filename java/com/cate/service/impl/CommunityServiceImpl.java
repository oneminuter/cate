package com.cate.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.sf.json.JSONObject;

import com.cate.dao.CommentDao;
import com.cate.dao.CommunityDao;
import com.cate.dao.UserDao;
import com.cate.entity.Community;
import com.cate.entity.User;
import com.cate.model.CommunityList;
import com.cate.model.Header;
import com.cate.service.CommunityService;

@Service
public class CommunityServiceImpl implements CommunityService{
	@Autowired
	CommunityDao communityDao;
	@Autowired
	Header header;
	@Autowired
	UserDao userDao;
	@Autowired
	CommentDao commentDao;
	
	Map<String, Object> map = null;

	@Override
	public JSONObject getCommunityList() {
		map = new HashMap<String, Object>();
		List<Community> list = communityDao.queryAll();
		List<CommunityList> cList = null;
		com.cate.entity.Community c = null;
		CommunityList cl = null;
		if(list == null){
			header.setSuccess(false);
			header.setErrorInfo("数据为空");
		}else{
			cList = new ArrayList<CommunityList>();
			for(int i = 0; i < list.size(); i++){
				cl = new CommunityList();
				c = list.get(i);
				int commentNum = commentDao.countTopicNumber(c.getId());
				User user = userDao.queryById(c.getUserId());
				
				cl.setId(c.getId());
				cl.setUserId(c.getUserId());
				cl.setTopic(c.getTopic());
				cl.setTitle(c.getTitle());
				cl.setContent(c.getContent());
				cl.setIntroduce(c.getIntroduce());
				cl.setView(c.getView());
				cl.setPublishDate(c.getPublishDate());
				cl.setIsDelete(c.getIsDelete());
				cl.setCommentNum(commentNum);
				cl.setAuthorIcon(user.getIcon());
				
				cList.add(cl);
			}
			
			header.setSuccess(true);
			map.put("body", cList);
		}
		map.put("header", header);
		return JSONObject.fromObject(map);
	}

	@Override
	public JSONObject getTopicDetail(int topicId) {
		map = new HashMap<String, Object>();
		Community c = communityDao.queryById(topicId);
		CommunityList cl = null;
		if(c == null){
			header.setSuccess(false);
			header.setErrorInfo("数据为空");
		}else{
			cl = new CommunityList();
			User user = userDao.queryById(c.getUserId());
			int commentNum = commentDao.countTopicNumber(c.getId());
			
			cl.setId(c.getId());
			cl.setUserId(c.getUserId());
			cl.setTopic(c.getTopic());
			cl.setTitle(c.getTitle());
			cl.setContent(c.getContent());
			cl.setIntroduce(c.getIntroduce());
			cl.setView(c.getView());
			cl.setPublishDate(c.getPublishDate());
			cl.setIsDelete(c.getIsDelete());
			cl.setCommentNum(commentNum);
			cl.setAuthor(user.getUsername());
			cl.setAuthorIcon(user.getIcon());
			
			header.setSuccess(true);
			map.put("body", cl);
			communityDao.addTopicViewNum(c.getId());
		}
		map.put("header", header);
		return JSONObject.fromObject(map);
	}

}
