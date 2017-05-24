package com.cate.dao;


import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cate.entity.User;
import com.cate.util.HibernateUtil;

@Repository
@Transactional
public class UserDao {
	/**
	 * 注册-增加用户
	 * @return
	 */
	public boolean add(User user){
		Session session = HibernateUtil.getSession();
		Transaction transaction = session.beginTransaction();
		boolean result = false;
		try {
			session.save(user);
			transaction.commit();
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}
			
		return result;
	}
	
	@SuppressWarnings({ "rawtypes", "deprecation" })
	public User queryByPhone(String phone){
		Session session = HibernateUtil.getSession();
		String hql = "from User u where u.phone =:phone";
		Query q = session.createQuery(hql);
		q.setString("phone", phone);
		User user = (User) q.uniqueResult();
		session.close();
		return user;
	}
}
