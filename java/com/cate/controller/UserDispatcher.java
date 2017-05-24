package com.cate.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cate.service.User;

@Controller
@RequestMapping("/user")
public class UserDispatcher {
	@Autowired
	HttpServletResponse response;
	@Autowired
	User user;
	@RequestMapping("")
	public String user(){
		return "user";
	}
	
	@RequestMapping(value="/order/getOrderList")
	public void getOrderList(PrintWriter out, @PathParam("userId") int userId){
		response.setContentType("text/html; charset=utf-8");
		out.print(user.getOrderList(userId));
	}
}
