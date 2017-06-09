package com.cate.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cate.service.UserCenter;

@Controller
@RequestMapping("/user")
public class UserDispatcher {
	@Autowired
	HttpServletResponse response;
	@Autowired
	UserCenter userCenter;
	
	
	@RequestMapping("")
	public String user(){
		return "user";
	}
	
	@RequestMapping("/login")
	public String login(){
		return "login";
	}
	
	@RequestMapping(value="/order/getOrderList")
	public void getOrderList(PrintWriter out, @PathParam("userId") int userId){
		response.setContentType("text/html; charset=utf-8");
		out.print(userCenter.getOrderList(userId));
	}
	
	@RequestMapping(value="/doregister")
	public void doregister(PrintWriter out, @PathParam("phone") String phone, @PathParam("password") String password){
		response.setContentType("text/html; charset=utf-8");
		out.print(userCenter.register(phone, password));
	}
	
	@RequestMapping(value="/dologin")
	public void dologin(PrintWriter out, @PathParam("phone") String phone, @PathParam("password") String password){
		response.setContentType("application/json; charset=utf-8");
		out.print(userCenter.login(phone, password));
	}
	
	@RequestMapping(value="/getUserInfo")
	public void getUserInfo(PrintWriter out, @PathParam("phone") String phone){
		response.setContentType("application/json; charset=utf-8");
		out.print(userCenter.getUserInfo(phone));
	}
	
	@RequestMapping(value="/getCollectionList")
	public void getCollectionList(PrintWriter out, @PathParam("userId")int userId){
		response.setContentType("application/json; charset=utf-8");
		out.print(userCenter.getCollectionList(userId));
	}
}
