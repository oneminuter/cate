package com.cate.dao;


import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cate.entity.Order;
import com.cate.util.HibernateUtil;

@Repository
@Transactional
public class OrderDao {
	//添加
	public boolean add(Order order){
		boolean result = false;
		Session session = HibernateUtil.getSession();
		Transaction transation = session.beginTransaction();
		
		System.out.println(order.getBuyNumber());
		System.out.println(order.getCash());
		System.out.println(order.getCost());
		System.out.println(order.getOrderDate());
		System.out.println(order.getFavorablePrice());
		System.out.println(order.getFoodId());
		System.out.println(order.getFreight());
		System.out.println(order.getName());
		System.out.println(order.getOrderId());
		System.out.println(order.getOther());
		System.out.println(order.getPackFee());
		System.out.println(order.getPeopleNumber());
		System.out.println(order.getPrice());
		System.out.println(order.getState());
		System.out.println(order.getStoreName());
		System.out.println(order.getId());
		
		try{
			session.save(order);
			transation.commit();
			result = true;
		} catch (Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return result;
	}
}
