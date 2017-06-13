package com.cate.controller;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cate.entity.Food;
import com.cate.service.Admin;

@Controller
@RequestMapping("/admin")
public class AdminDispatcher {
	@Autowired
	private Admin admin;
	@Autowired
	private Food food;
	@Autowired
	HttpServletResponse response;
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("")
	public String index(){
		return "admin";
	}
	
	@RequestMapping(value="/banner/submitBanner", method=RequestMethod.POST)
	public void getSlides(PrintWriter out, 
			@PathParam("img")String img, 
			@PathParam("linkUrl") String linkUrl){
		
		response.setContentType("text/html;charset=utf-8");
		out.print(admin.uploadBanner(img, linkUrl, request));
	}
	
	@RequestMapping(value="/food/addFoodSubmit", method=RequestMethod.POST)
	public void getSlides(PrintWriter out, HttpServletRequest request,
			@PathParam("classify")String classify, 
			@PathParam("address") String address, 
			@PathParam("detailAddress") String detailAddress, 
			@PathParam("img") String img, 
			@PathParam("name") String name, 
			@PathParam("price") float price, 
			@PathParam("reachPrice") float reachPrice, 
			@PathParam("favorablePrice") float favorablePrice, 
			@PathParam("otherFavorable") String otherFavorable){
		
		response.setContentType("text/html;charset=utf-8");
		food.setClassify(classify);
		food.setAddress(address);
		food.setDetailAddress(detailAddress);
		food.setImgUrl(img);
		food.setName(name);
		food.setPrice(price);
		food.setReachPrice(reachPrice);
		food.setFavorablePrice(favorablePrice);
		food.setOtherFavorable(otherFavorable);
		
		out.print(admin.addFood(food, request));
	}
	
	@RequestMapping(value="/food/addFoodShicaiOrShipuOrOtherSubmit", method=RequestMethod.POST)
	public void getSlides(PrintWriter out, 
			@PathParam("classify")String classify, 
			@PathParam("img")String img, 
			@PathParam("name") String name, 
			@PathParam("content") String content){
		
		response.setContentType("text/html;charset=utf-8");
		food.setClassify(classify);
		food.setImgUrl(img);
		food.setName(name);
		food.setContent(content);
		out.print(admin.addFood(food, request));
	}
	
	@RequestMapping(value="/slide/getSlideList", method=RequestMethod.POST)
	public void getSlideList(PrintWriter out){
		response.setContentType("text/html;charset=utf-8");
		out.print(admin.getSlideList());
	}
	
	@RequestMapping(value="/slide/editUrlLink", method=RequestMethod.POST)
	public void editUrlLink(PrintWriter out, @PathParam("a") String a, @PathParam("id") int id){
		response.setContentType("text/html;charset=utf-8");
		//此处比价诡异的是当接收参数为newUrl,url是，值都为null
//		System.out.println("admindispatcher.java "+id);
//		System.out.println("admindispatcher.java "+a);
		out.print(admin.editUrlLink(id, a));
	}
	
	@RequestMapping(value="/slide/delete", method=RequestMethod.POST)
	public void deleteBaner(PrintWriter out, @PathParam("id")int id){
		response.setContentType("text/html;charset=utf-8");
		out.print(admin.deleteBanner(id));
	}
	
	@RequestMapping(value="/food/deleteFood", method=RequestMethod.POST)
	public void deleteFood(PrintWriter out, @PathParam("id")int id){
		response.setContentType("text/html;charset=utf-8");
		out.print(admin.deleteFoodById(id));
	}
	
	@RequestMapping(value="/food/modifyFoodInfo", method=RequestMethod.POST)
	public void modifyFoodInfo(PrintWriter out, @PathParam("id")int id, @PathParam("key")String key, @PathParam("val")String val){
		response.setContentType("text/html;charset=utf-8");
		out.print(admin.modifyFoodInfo(id, key, val));
	}
	
	@RequestMapping(value="/food/getAllFoodList", method=RequestMethod.POST)
	public void getAllFoodList(PrintWriter out){
		response.setContentType("text/html;charset=utf-8");
		out.print(admin.getAllFoodList());
	}
	
	@RequestMapping(value="/community/deleteTopic",method=RequestMethod.POST)
	public void deleteTopic(PrintWriter out,@PathParam("id")int id){
		response.setContentType("text/html;charset=utf-8");
		out.print(admin.deleteTopic(id));
	}
	
	@RequestMapping(value="/order/getAllOrderList",method=RequestMethod.POST)
	public void getAllOrderList(PrintWriter out){
		response.setContentType("text/html;charset=utf-8");
		out.print(admin.getAllOrderList());
	}
	
	@RequestMapping(value="/order/modifyOrderState",method=RequestMethod.POST)
	public void modifyOrderState(PrintWriter out, @PathParam("id")int id, @PathParam("state")int state){
		response.setContentType("text/html;charset=utf-8");
		out.print(admin.modifyOrderState(id, state));
	}
	
	@RequestMapping(value="/user/getUserList", method=RequestMethod.POST)
	public void getUserList(PrintWriter out){
		response.setContentType("text/html; charset=utf-8");
		out.print(admin.getUserList());
	}
	@RequestMapping(value="/user/saveEditUserInfo", method=RequestMethod.POST)
	public void saveEditUserInfo(PrintWriter out, @PathParam("id")int id){
		response.setContentType("text/html; charset=utf-8");
		
		Enumeration<String> paraNames=request.getParameterNames();
		out.print(admin.saveEditUser(id, paraNames, request));
	}
	
	@RequestMapping(value="/user/deleteUser", method=RequestMethod.POST)
	public void deleteUser(PrintWriter out, @PathParam("id")int id){
		response.setContentType("text/html; charset=utf-8");
		out.print(admin.deleteUser(id));
	}
	
	@RequestMapping(value="/user/uploadUserIcon", method=RequestMethod.POST)
	public void uploadUserIcon(PrintWriter out, @PathParam("id")int id, @PathParam("imgBase64")String imgBase64){
		response.setContentType("text/html; charset=utf-8");
		out.print(admin.uploadUserIcon(id, imgBase64, request));
	}
	
}