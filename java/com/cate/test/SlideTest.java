package com.cate.test;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cate.entity.Banner;
import com.cate.util.DateUtil;
import com.cate.util.HibernateUtil;

public class SlideTest {
	public static void main(String[] args) {
		Session session = HibernateUtil.getSession();
		Transaction transaction = session.beginTransaction();
		
		Banner s = new Banner();
		s.setOrderNumber(3);
		s.setImgUrl("img/banner3.jpg");
		s.setLinkUrl("test.html");
		s.setIsOnShelve(1);
		s.setOnShelveTime(DateUtil.getTimestamp());
//		s.setOffShelveTime(DateUtil.getTimestamp());  //不参与插入操作
		session.save(s);
		transaction.commit();
		session.close();
		
	}
}
