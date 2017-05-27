package com.cate.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cate.entity.Community;
import com.cate.util.HibernateUtil;

@Repository
@Transactional
public class CommunityDao {
	/**
	 * 查询所有的话题列表
	 * @return
	 */
	@SuppressWarnings({ "unchecked" })
	public List<Community> queryAll(){
		Session session = HibernateUtil.getSession();
		String hql = "from Community c";
		Query<Community> q = session.createQuery(hql);
		List<Community> list = q.list();
		session.close();
		return list;
	}
	
	@SuppressWarnings({ "rawtypes", "deprecation" })
	public Community queryById(int id){
		Session session = HibernateUtil.getSession();
		String hql = "from Community c where c.id =:id";
		Query q = session.createQuery(hql);
		q.setInteger("id", id);
		Community community = (Community) q.uniqueResult();
		session.close();
		return community;
	}
	
	@SuppressWarnings({ "rawtypes", "deprecation" })
	public boolean addTopicViewNum(int topicId){
		Session session = HibernateUtil.getSession();
		Transaction transaction = session.beginTransaction();
		String hql = "update Community c set c.view = c.view + 1 where c.id =:topicId";
		Query q = session.createQuery(hql);
		q.setInteger("topicId", topicId);
		int rs = q.executeUpdate();
		transaction.commit();
		session.close();
		if(rs > 0){
			return true;
		}else{
			return false;
		}
		
	}
}
