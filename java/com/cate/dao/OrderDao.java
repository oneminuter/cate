package com.cate.dao;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
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
	
	/**
	 * 提交订单-修改订单相应字段
	 * @param order
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "deprecation" })
	public boolean update(Order order){
		Session session = HibernateUtil.getSession();
		Transaction transaction = session.beginTransaction();
		String hql = "update Order o set o.receiverAddress =:receiverAddress,o.payMethod =:payMethod, o.peopleNumber =:peopleNumber, o.other =:other where o.id =:id";
		Query<Order> q = session.createQuery(hql);
		q.setString("receiverAddress", order.getReceiverAddress());
		q.setString("payMethod", order.getPayMethod());
		q.setInteger("peopleNumber", order.getPeopleNumber());
		q.setString("other", order.getOther());
		q.setInteger("id", order.getId());
		
		int rs = 0;
		try {
			rs = q.executeUpdate();
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		if(rs > 0){
			return true;
		}else{
			return false;
		}
	}
	
	@SuppressWarnings({ "unchecked", "deprecation" })
	public Order queryById(int id){
		Session session = HibernateUtil.getSession();
		String hql = "from Order o where id =:id";
		Query<Order> q = session.createQuery(hql);
		q.setInteger("id", id);
		Order order = null;
		try {
			order = q.uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		if(order != null){
			return order;
		} else {
			return null;
		}
	}
	
	/**
	 * 更新订单状态
	 * @param id
	 * @return
	 */
	@SuppressWarnings({"deprecation", "unchecked" })
	public boolean updataOrderState(int id){
		Session session = HibernateUtil.getSession();
		Transaction transaction = session.beginTransaction();
		String hql = "update Order o set o.state = 1 where id =:id";
		Query<Order> q = session.createQuery(hql);
		q.setInteger("id", id);
		int rs = 0;
		try {
			rs = q.executeUpdate();
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		if(rs > 0){
			return true;
		}else{
			return false;
		}
	}
	
	@SuppressWarnings({ "deprecation", "unchecked" })
	public List<Order> queryByUserId(int userId){
		Session session = HibernateUtil.getSession();
		String hql = "from Order o where o.userId =:userId order by o.id desc";
		Query<Order> q = session.createQuery(hql);
		q.setInteger("userId", userId);
		List<Order> list = q.list();
		session.close();
		return list;
	}
}
