package com.cate.dao;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.cate.util.HibernateUtil;

@Repository
public class CommentDao {
	/**
	 * 获取话题的评论总数
	 * @param topicId
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "deprecation" })
	public int countTopicNumber(int topicId){
		Session session = HibernateUtil.getSession();
		String hql = "select count(*) from Comment c where c.topicId =:topicId";
		Query q = session.createQuery(hql);
		q.setInteger("topicId", topicId);
		int num = ((Number) q.uniqueResult()).intValue();
		session.close();
		return num;
	}
	
}
