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
	
	@RequestMapping(value="/order/getOrderList")
	public void getOrderList(PrintWriter out, @PathParam("userId") int userId){
		response.setContentType("text/html; charset=utf-8");
		out.print(userCenter.getOrderList(userId));
	}
	
	@RequestMapping(value="/register")
	public void register(PrintWriter out, @PathParam("phone") String phone, @PathParam("password") String password){
		response.setContentType("text/html; charset=utf-8");
		out.print(userCenter.register(phone, password));
	}
	
	@RequestMapping(value="/login")
	public void login(PrintWriter out,@PathParam("phone") String phone, @PathParam("password") String password){
		response.setContentType("text/html; charset=utf-8");
		out.print(userCenter.login(phone, password));
	}
}
