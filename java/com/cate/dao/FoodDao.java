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
			transaction.rollback();
			result = false;
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
		session.close();
		return food;
	}
	
	@SuppressWarnings({ "deprecation", "rawtypes" })
	public String getImgUrl(int foodId){
		Session session = HibernateUtil.getSession();
		String hql = "select imgUrl from Food f where f.id =:id";
		Query q = session.createQuery(hql);
		q.setInteger("id", foodId);
		String imgUrl = (String) q.uniqueResult();
		session.close();
		return imgUrl;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked", "deprecation" })
	public List<Food> queryRecomment(){
		Session session = HibernateUtil.getSession();
		String hql = "from Food f where f.classify !=:classify order by f.id desc";
		Query q = session.createQuery(hql);
		q.setString("classify", "meishi");
		List<Food> list = q.list();
		session.close();
		return list;
	}
	
	/**
	 * 获取食物内容介绍
	 * @param id
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "deprecation" })
	public String queryContentByid(int id){
		Session session = HibernateUtil.getSession();
		String hql = "select f.content from Food f where f.id =:id";
		Query q = session.createQuery(hql);
		q.setInteger("id", id);
		String content = (String) q.uniqueResult();
		session.close();
		return content;
	}
	
	/**
	 * 删除食物
	 * @param id
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "deprecation" })
	public boolean deleteFoodById(int id){
		Session session = HibernateUtil.getSession();
		Transaction transaction = session.beginTransaction();
		String hql = "delete from Food f where f.id =:id";
		Query<Food> q = session.createQuery(hql);
		q.setInteger("id", id);
		boolean result = false;
		try {
			if(q.executeUpdate() > 0){
				result = true;
				transaction.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		} finally {
			session.close();
		}
		return result;
	}
	
	/**
	 * 修改食物信息
	 * @param id
	 * @param key
	 * @param val
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "deprecation" })
	public boolean modifyFoodById(int id, String key, String val){
		Session session = HibernateUtil.getSession();
		Transaction transaction = session.beginTransaction();
		String hql = "update Food f set f." + key + " =:val where f.id =:id";
		Query<Food> q = session.createQuery(hql);
		q.setString("val", val);
		q.setInteger("id", id);
		boolean result = false;
		try {
			if(q.executeUpdate() > 0){
				result = true;
				transaction.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		} finally {
			session.close();
		}
		return result;
	}
	
	/**
	 * 获取所有食物列表
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Food> queryAllFoodList(){
		Session session = HibernateUtil.getSession();
		String hql = "from Food f";
		Query<Food> q =  session.createQuery(hql);
		List<Food> list = q.list();
		session.close();
		return list;
	}
}
