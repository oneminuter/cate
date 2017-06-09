package com.cate.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cate.entity.Address;
import com.cate.entity.Order;
import com.cate.service.Index;

@Controller
@RequestMapping("/index")
public class IndexDispatcher {
	@Autowired
	private Index index;
	@Autowired
	HttpServletResponse response;
	@Autowired
	private Address address;
	@Autowired
	private Order order;
	
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
	
	@RequestMapping(value="/food/getFoodListByClassify")
	public void getFoodListByClassify(PrintWriter out, @PathParam("classify") String classify){
		response.setContentType("text/html;charset=utf-8");
		out.print(index.getFoodListByClassify(classify));
	}
	
	@RequestMapping(value="/food/getDetail")
	public void getDetail(PrintWriter out, @PathParam("id") int id ){
		response.setContentType("text/html; charset=utf-8");
		out.print(index.getDetail(id));
	}
	
	@RequestMapping(value="/food/getCheckInfo")
	public void getCheckInfo(PrintWriter out,@PathParam("foodId") int foodId, @PathParam("number") int number, @PathParam("userId")int userId){
		response.setContentType("text/html; charset=utf-8");
		out.print(index.getCheckInfo(foodId, number, userId));
	}
	
	@RequestMapping(value="/food/addReceiveAddress")
	public void addReceiveAddress(PrintWriter out,
			@PathParam("userId") int userId,
			@PathParam("receiverName") String receiverName,
			@PathParam("province") String province,
			@PathParam("detailAddress") String detailAddress,
			@PathParam("receiverGender") int receiverGender,
			@PathParam("phone") String phone ){
		
		response.setContentType("text/html; charset=utf-8");
		
		address.setUserId(userId);
		address.setReceiverName(receiverName);
		address.setProvince(province);
		address.setDetailAddress(detailAddress);
		address.setReceiverGender(receiverGender);
		address.setPhone(phone);
		
		out.print(index.addReceiveAddress(address));
	}
	
	@RequestMapping(value="/food/getAddressList")
	public void getAddressList(PrintWriter out, @PathParam("userId") int userId){
		response.setContentType("text/html; charset=utf-8");
		out.print(index.getAddressList(userId));
	}
	
	@RequestMapping(value="/food/submitCheck")
	private void submitCheck(PrintWriter out,
			@PathParam("orderId") String orderId,
			@PathParam("receiverAddress") String receiverAddress,
			@PathParam("payMethod") String payMethod,
			@PathParam("peopleNumber") int peopleNumber,
			@PathParam("other") String other){
		response.setContentType("text/html; charset=utf-8");
		
		order.setOrderId(orderId);
		order.setReceiverAddress(receiverAddress);
		order.setPayMethod(payMethod);
		order.setPeopleNumber(peopleNumber);
		order.setOther(other);
		out.print(index.submitCheck(order));
	}
	
	@RequestMapping(value="/food/confirmPay")
	private void confirmPay(PrintWriter out, @PathParam("orderId") int orderId){
		response.setContentType("text/html; charset=utf-8");
		out.print(index.confirmPay(orderId));
	}
	
}
