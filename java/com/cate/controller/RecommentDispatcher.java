package com.cate.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
