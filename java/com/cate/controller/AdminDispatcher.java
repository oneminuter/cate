package com.cate.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
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
	
	@RequestMapping("")
	public String index(){
		return "admin";
	}
	
	@RequestMapping(value="/banner/submitBanner", method=RequestMethod.POST)
	public void getSlides(PrintWriter out, @PathParam("img")String img, @PathParam("linkUrl") String linkUrl, HttpServletRequest request){
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
	public void getSlides(PrintWriter out, @PathParam("classify")String classify, @PathParam("img")String img, @PathParam("name") String name, @PathParam("content") String content, HttpServletRequest request){
		
		food.setClassify(classify);
		food.setImgUrl(img);
		food.setName(name);
		food.setContent(content);
		out.print(admin.addFood(food, request));
	}
}