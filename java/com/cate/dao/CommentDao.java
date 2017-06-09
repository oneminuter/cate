package com.cate.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.cate.entity.Comment;
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
	
	/**
	 * 添加评论
	 * @param comment
	 * @return
	 */
	public int add(Comment comment){
		Session session = HibernateUtil.getSession();
		Transaction transaction = session.beginTransaction();
		int commentId = -1;
		try {
			session.save(comment);
			transaction.commit();
			commentId = comment.getId();
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		} finally {
			session.close();
		}
		return commentId;
	}
	
	@SuppressWarnings({ "deprecation", "unchecked" })
	public List<Comment> getCommentList(int topicId){
		Session session = HibernateUtil.getSession();
		String hql = "from Comment c where c.topicId =:topicId order by c.id asc";
		Query<Comment> q = session.createQuery(hql);
		q.setInteger("topicId", topicId);
		List<Comment> list = q.list();
		session.close();
		return list;
	}
	
}
