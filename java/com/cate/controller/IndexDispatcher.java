package com.cate.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cate.service.Index;

@Controller
@RequestMapping("/index")
public class IndexDispatcher {
	@Autowired
	private Index index;
	@Autowired
	HttpServletResponse response;
	
	@RequestMapping("")
	public String index(){
		return "index";
	}
	/**
	 * 请求banner列表
	 * @param out
	 * @param request
	 */
	//value="/index",method=RequestMethod.GET
	@RequestMapping(value="/getSlides")
	public void getSlides(PrintWriter out, HttpServletRequest request){
		response.setContentType("text/html;charset=utf-8");
		out.print(index.getSlides(request));
	}
	
	@RequestMapping(value="/food/getFoodList")
	public void getFoodList(PrintWriter out, @PathParam("classify") String classify){
		response.setContentType("text/html;charset=utf-8");
		out.print(index.getFoodList(classify));
	}
	
	@RequestMapping(value="/food/getDetail")
	public void getDetail(PrintWriter out, @PathParam("id") int id ){
		response.setContentType("text/html; charset=utf-8");
		out.print(index.getDetail(id));
	}
	
	@RequestMapping(value="/food/getCheckInfo")
	public void getCheckInfo(PrintWriter out,@PathParam("id") int id, @PathParam("number") int number){
		response.setContentType("text/html; charset=utf-8");
		out.print(index.getCheckInfo(id, number));
	}
	
	
}
