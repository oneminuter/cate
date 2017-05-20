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
