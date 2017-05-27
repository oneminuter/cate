package com.cate.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
