package com.cate.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cate.entity.Banner;
import com.cate.util.DateUtil;
import com.cate.util.HibernateUtil;

@Repository
@Transactional
public class BannerDao {
	/**
	 * 获取所有
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Banner> query(){
		Session session = HibernateUtil.getSession();
		String hql = "from Banner banner where isOnShelve = 1 order by orderNumber asc";
		List<Banner> list = session.createQuery(hql).list();
		session.close();
		return list;
	}
	
	/**
	 * 添加
	 * @param banner
	 * @return
	 */
	public boolean add(Banner banner){
		boolean result = false;
		Session session = HibernateUtil.getSession();
		Transaction transaction = session.beginTransaction();
		
		banner.setIsOnShelve(1);
		banner.setOnShelveTime(DateUtil.getTimestamp());
		banner.setOrderNumber(0);
		try {
			session.save(banner);
			transaction.commit();
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}
		return result;
	}
	
}
