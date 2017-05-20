package com.cate.dao;


import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cate.entity.Address;
import com.cate.util.HibernateUtil;

@SuppressWarnings("deprecation")
@Repository
@Transactional
public class AddressDao {
	/**
	 * 增加
	 * @param address
	 * @return
	 */
	public boolean add(Address address){
		boolean result = false;
		Session session = HibernateUtil.getSession();
		Transaction transation  = session.beginTransaction();
		
		try {
			session.save(address);
			transation.commit();
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return result;
	}
	
	@SuppressWarnings({ "unchecked" })
	public List<Address> queryAll(int userId){
		Session session = HibernateUtil.getSession();
		String hql = "from Address address where userId =:userId";
		Query<Address> q = session.createQuery(hql);
		q.setInteger("userId", userId);
		List<Address> list = q.list();
		session.close();
		return list;
	}
}
