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
 * @date 2019/12/11 22:54
 */
public class MyBatisSessionFactory {

	private static final String resource = "config/ocs_mybatis.xml";
	private static SqlSessionFactory sessionFactory = null;

	static {
		LogFactory.useLog4JLogging();
	}

	public MyBatisSessionFactory() {
	}

	public static SqlSession getSession() {
		if (sessionFactory == null) {
			synchronized(MyBatisSessionFactory.class) {
				InputStream is = MyBatisSessionFactory.class.getClassLoader().getResourceAsStream("config/ocs_mybatis.xml");
				sessionFactory = (new SqlSessionFactoryBuilder()).build(is);
			}
		}

		return sessionFactory.openSession();
	}

}
