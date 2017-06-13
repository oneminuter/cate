package com.cate.dao;


import java.util.List;

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
			transaction.rollback();
			result = false;
		}finally{
			session.close();
		}
			
		return result;
	}
	
	/**
	 * 根据手机号查询用户信息
	 * @param phone
	 * @return
	 */
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
	
	
	/**
	 * 根据id查询用户信息
	 * @param id
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "deprecation" })
	public User queryById(int id){
		Session session = HibernateUtil.getSession();
		String hql = "from User u where u.id =:id";
		Query q = session.createQuery(hql);
		q.setInteger("id", id);
		User user = (User) q.uniqueResult();
		session.close();
		return user;
	}
	
	@SuppressWarnings("unchecked")
	public List<User> queryAllUser(){
		Session session = HibernateUtil.getSession();
		String hql = "from User u";
		List<User> list = session.createQuery(hql).list();
		session.close();
		return list;
	}
	
	/**
	 * 删除用户
	 * @param id
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "deprecation" })
	public boolean deleteUserById(int id){
		boolean result = false;
		Session session  = HibernateUtil.getSession();
		Transaction transaction = session.beginTransaction();
		String hql = "delete from User u where u.id =:id";
		Query<User> q = session.createQuery(hql);
		q.setInteger("id", id);
		try {
			if(q.executeUpdate() > 0){
				result = true;
				transaction.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			result = false;
		} finally {
			session.close();
		}
		return result;
	}
	
	/*
	 * 修改varchar类型
	 */
	@SuppressWarnings("unchecked")
	public boolean editUserInfo(int id, String key, String value){
		boolean result = false;
		Session session = HibernateUtil.getSession();
		Transaction transaction = session.beginTransaction();
		String hql = "update User u set u." + key + " = '" + value + "' where u.id = " + id ;
		Query<User> q = session.createQuery(hql);
		try {
			if(q.executeUpdate() > 0){
				transaction.commit();
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			result = false;
		} finally {
			session.close();
		}
		return result;
	}
	
	@SuppressWarnings({ "unchecked", "deprecation" })
	public boolean uploadUserIcon(int id, String iconUrl){
		boolean result = false;
		Session session = HibernateUtil.getSession();
		Transaction transaction = session.beginTransaction();
		String hql = "update User u set u.icon =:icon where u.id =:id";
		Query<User> q = session.createQuery(hql);
		q.setString("icon", iconUrl);
		q.setInteger("id", id);
		try {
			if(q.executeUpdate() > 0){
				transaction.commit();
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			result = false;
		} finally {
			session.close();
		}
		return result;
	}
}
