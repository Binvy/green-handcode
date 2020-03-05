package com.tstar.util;

import org.apache.ibatis.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/12 21:48
 */
public class BroadSessionFactory {

	private static final String resource = "config/broadMapConfig.xml";
	private static SqlSessionFactory sessionFactory = null;

	static {
		LogFactory.useLog4JLogging();
	}

	public BroadSessionFactory() {
	}

	public static SqlSession getSession() {
		if (sessionFactory == null) {
			Class var0 = MyBatisSessionFactory.class;
			synchronized(MyBatisSessionFactory.class) {
				InputStream is = MyBatisSessionFactory.class.getClassLoader().getResourceAsStream("config/broadMapConfig.xml");
				sessionFactory = (new SqlSessionFactoryBuilder()).build(is);
			}
		}

		return sessionFactory.openSession();
	}

}
