package com.cate.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class HibernateUtil {
	private final static StandardServiceRegistry registry = new StandardServiceRegistryBuilder().configure().build();
	private static SessionFactory sessionFactory;
	private static Session session;
	
	public static Session getSession(){
		if(session == null || !session.isOpen() ){
			if(sessionFactory == null){
				sessionFactory = new MetadataSources(registry).buildMetadata().buildSessionFactory();
			}
			session = sessionFactory.openSession();
		}
		
		return session;
	}
}
