package com.cate.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cate.entity.Collection;
import com.cate.entity.Comment;
import com.cate.entity.Community;
import com.cate.service.CommunityService;

@Controller
@RequestMapping(value="/community")
public class CommunityDispatcher {
	@Autowired
	HttpServletResponse response;
	@Autowired
	CommunityService communityService;
	
	
	
	@RequestMapping(value="")
	public String community(){
		return "community";
	}
	
	@RequestMapping(value="/getCommunityList")
	public void getCommunityList(PrintWriter out){
		response.setContentType("text/html; charset=utf-8");
		out.print(communityService.getCommunityList());
	}
	
	@RequestMapping(value="/getTopicDetail")
	public void getTopicDetail(PrintWriter out,@PathParam("topicId") int topicId){
		response.setContentType("text/html; charset=utf-8");
		out.print(communityService.getTopicDetail(topicId));
	}
	
	@RequestMapping(value="/addTopic")
	public void addTopic(PrintWriter out, 
			@PathParam("userId") int userId,
			@PathParam("classify") String classify,
			@PathParam("title") String title,
			@PathParam("content") String content){
		response.setContentType("text/html; charset=utf-8");
		Community c = new Community();
		c.setUserId(userId);
		c.setClassify(classify);
		c.setTitle(title);
		c.setContent(content);
		out.print(communityService.addTopic(c));
	}
	
	@RequestMapping(value="/detail/addComment")
	public void addComment(PrintWriter out,
			@PathParam("userId")int userId,
			@PathParam("topicId")int topicId,
			@PathParam("content")String content){
		response.setContentType("text/html; charset=utf-8");
		Comment c = new Comment();
		c.setUserId(userId);
		c.setTopicId(topicId);
		c.setContent(content);
		out.print(communityService.addComment(c));
	};
	
	@RequestMapping(value="/getTopicCommentList")
	public void getTopicComment(PrintWriter out, @PathParam("topicId")int topicId){
		response.setContentType("text/html; charset=utf-8");
		out.print(communityService.getTopicCommentList(topicId));
	}
	
	@RequestMapping(value="/addTopicCollect")
	public void addTipicCollect(PrintWriter out, @PathParam("userId")int userId, @PathParam("topicId")int topicId){
		response.setContentType("text/html; charset=utf-8");
		Collection c = new Collection();
		c.setUserId(userId);
		c.setCommunityId(topicId);
		out.print(communityService.addTopicCollect(c));
	}
}
