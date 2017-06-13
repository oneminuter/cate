package com.cate.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cate.entity.Collection;
import com.cate.util.HibernateUtil;

@Repository
@Transactional
public class CollectionDao {
	/**
	 * 收藏美食
	 * @param collection
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "unchecked"})
	public int addFoodCollect(Collection collection){
		int result = -1; //-1 表示数据库错做失败，0 表示已经收藏过了，1表示收藏成功
		Session session = HibernateUtil.getSession();
		Transaction transaction = session.beginTransaction();
		
		try {
			String hql = "from Collection c where foodId =:foodId";
			Query<Collection> q = session.createQuery(hql);
			q.setInteger("foodId", collection.getFoodId());
			List<Collection> resultList = q.list();
			if(resultList.size() > 0){
				result = 0;
			}else{
				session.save(collection);
				transaction.commit();
				result = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		} finally {
			session.close();
		}
		return result;
	}
	
	@SuppressWarnings({ "rawtypes", "deprecation", "unchecked" })
	public int addtopicCollect(Collection collection){
		int result = -1;
		Session session = HibernateUtil.getSession();
		Transaction transaction = session.beginTransaction();
		try {
			String hql = "from Collection c where c.communityId =:communityId";
			Query q = session.createQuery(hql);
			q.setInteger("communityId", collection.getCommunityId());
			List<Collection> resultList = q.list();
			if(resultList.size() > 0){
				result = 0;
			}else{
				session.save(collection);
				transaction.commit();
				result = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		} finally {
			session.close();
		}
		return result;
	}
	
	@SuppressWarnings({ "unchecked", "deprecation" })
	public List<Collection> queryByUserId(int userId){
		Session session = HibernateUtil.getSession();
		String hql = "from Collection c where c.userId =:userId";
		Query<Collection> q = session.createQuery(hql);
		q.setInteger("userId", userId);
		List<Collection> list = q.list();
		session.close();
		return list;
	}
}
