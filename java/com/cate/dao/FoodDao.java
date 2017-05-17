package com.cate.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cate.entity.Food;
import com.cate.util.DateUtil;
import com.cate.util.HibernateUtil;

@Repository
@Transactional
public class FoodDao {
	//添加
	public boolean add(Food food){
		boolean result = false;
		Session session = HibernateUtil.getSession();
		Transaction transaction = session.beginTransaction();
		
		food.setScore((float) 5.0);
		food.setUpdateTime(DateUtil.getNowTime());
		try {
			session.save(food);
			transaction.commit();
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}
		return result;
	}
	
	//按分类查询
	@SuppressWarnings({ "unchecked", "deprecation" })
	public List<Food> queryByClassify(String classify){
		Session session = HibernateUtil.getSession();
		String hql = "from Food f where f.classify =:classify";
		Query<Food> q = session.createQuery(hql);
		q.setString("classify", classify);
		List<Food> list = q.list();
		session.close();
		return list;
	}
	
	//按id查询
	@SuppressWarnings({ "deprecation", "unchecked" })
	public Food queryById(int id){
		Session session = HibernateUtil.getSession();
		String hql ="from Food f where f.id =:id";
		Query<Food> q = session.createQuery(hql);
		q.setInteger("id", id);
		Food food = (Food) q.uniqueResult();
		return food;
	}
}
