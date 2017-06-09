package com.cate.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.sf.json.JSONObject;

import com.cate.dao.CollectionDao;
import com.cate.dao.CommentDao;
import com.cate.dao.CommunityDao;
import com.cate.dao.UserDao;
import com.cate.entity.Collection;
import com.cate.entity.Comment;
import com.cate.entity.Community;
import com.cate.entity.User;
import com.cate.model.CommentList;
import com.cate.model.CommunityList;
import com.cate.model.Header;
import com.cate.service.CommunityService;
import com.cate.util.DateUtil;

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
	@Autowired
	CollectionDao cd;
	
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
				cl.setClassify(c.getClassify());
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
			cl.setClassify(c.getClassify());
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

	@Override
	public JSONObject addTopic(Community c) {
		map = new HashMap<String, Object>();
		String introduce = "";
		if(c.getContent().length() > 60){
			introduce = c.getContent().substring(0, 61);
		}else{
			introduce = c.getContent();
		}
		c.setIntroduce(introduce);
		c.setIsDelete(0);
		c.setPublishDate(DateUtil.getTimestamp());
		c.setView(0);
		
		int topicId = communityDao.addTopic(c);
		if( topicId == 0 ){
			header.setSuccess(false);
			header.setErrorInfo("增加话题失败");
		}else{
			header.setSuccess(true);
			CommunityList cl = new CommunityList();
			User user = userDao.queryById(c.getUserId());
			
			cl.setAuthor(user.getUsername());
			cl.setAuthorIcon(user.getIcon());
			cl.setClassify(c.getClassify());
			cl.setCommentNum(0);
			cl.setContent(c.getContent());
			cl.setId(topicId);
			cl.setIntroduce(introduce);
			cl.setIsDelete(c.getIsDelete());
			cl.setPublishDate(c.getPublishDate());
			cl.setTitle(c.getTitle());
			cl.setUserId(c.getUserId());
			cl.setView(c.getView());
			map.put("body", cl);
		}
		map.put("header", header);
		return JSONObject.fromObject(map);
	}

	@Override
	public JSONObject addComment(Comment comment) {
		map = new HashMap<String, Object>();
		comment.setTime(DateUtil.getNowTime());
		int commentId = commentDao.add(comment);
		if(commentId == -1){
			header.setSuccess(false);
			header.setErrorInfo("数据库操作错误，增加评论错误");
		}else{
			header.setSuccess(true);
			CommentList cl = new CommentList();
			User user = userDao.queryById(comment.getUserId());
			
			cl.setContent(comment.getContent());
			cl.setId(commentId);
			cl.setPhone(user.getPhone());
			cl.setTime(comment.getTime());
			cl.setTopicId(comment.getTopicId());
			cl.setUserIcon(user.getIcon());
			cl.setUserId(comment.getUserId());
			cl.setUsername(user.getUsername());
			map.put("body", cl);
		}
		map.put("header", header);
		return JSONObject.fromObject(map);
	}

	@Override
	public JSONObject getTopicCommentList(int topicId) {
		List<Comment> list = commentDao.getCommentList(topicId);
		List<CommentList> clist = new ArrayList<CommentList>();
		Comment c = null;
		CommentList cl =null;
		User user = null;
		if(list.size() == 0){
			header.setSuccess(false);
			header.setErrorInfo("评论列表为空");
		}else{
			header.setSuccess(true);
			
			for(int i = 0; i < list.size(); i++){
				c= list.get(i);
				cl = new CommentList();
				user = userDao.queryById(c.getUserId());
				
				cl.setContent(c.getContent());
				cl.setId(c.getId());
				cl.setPhone(user.getPhone());
				cl.setTime(c.getTime());
				cl.setTopicId(c.getTopicId());
				cl.setUserIcon(user.getIcon());
				cl.setUserId(user.getId());
				cl.setUsername(user.getUsername());
				
				clist.add(cl);
			}
			map.put("body", clist);
		}
		map.put("header", header);
		return JSONObject.fromObject(map);
	}

	@Override
	public JSONObject addTopicCollect(Collection collection) {
		map = new HashMap<String, Object>();
		int result = cd.addtopicCollect(collection);
		if(result == -1){
			header.setSuccess(false);
			header.setErrorInfo("数据库繁忙，收藏失败");
		}else if(result == 0){
			header.setSuccess(false);
			header.setErrorInfo("已收藏过了");
		}else{
			header.setSuccess(true);
		}
		map.put("header", header);
		return JSONObject.fromObject(map);
	}

}
