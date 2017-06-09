package com.cate.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cate.entity.Collection;
import com.cate.service.Recomment;

@Controller
@RequestMapping(value="/recomment")
public class RecommentDispatcher {
	@Autowired
	Recomment recomment;
	@Autowired
	HttpServletResponse response;
	
	@RequestMapping(value="")
	public String recomment(){
		return "recomment";
	}
	
	@RequestMapping("/getRecommentList")
	public void getRecommentList(PrintWriter out){
		response.setContentType("text/html; charset=utf-8");
		out.print(recomment.getRecommentList());
	}
	
	@RequestMapping("/addCollect")
	public void addCollect(PrintWriter out, @PathParam("userId")int userId, @PathParam("foodId")int foodId){
		response.setContentType("text/html; charset=utf-8");
		Collection c = new Collection();
		c.setUserId(userId);
		c.setFoodId(foodId);
		out.print(recomment.addCollect(c));
	}
}
