package com.tstar.ac.business;

import com.tstar.sms.mapper.BroadMapper;
import com.tstar.util.MyBatisSessionFactory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/11 22:54
 */
public class AAA implements INorth {

	private String url = "";
	private static SqlSessionFactory sessionFactory = null;

	public AAA() {
	}

	private SqlSession getSession() {
		if (sessionFactory == null) {
			Class var1 = MyBatisSessionFactory.class;
			synchronized(MyBatisSessionFactory.class) {
				InputStream is = MyBatisSessionFactory.class.getClassLoader().getResourceAsStream(this.url);
				sessionFactory = (new SqlSessionFactoryBuilder()).build(is);
			}
		}

		return sessionFactory.openSession();
	}

	public void open(String url) throws Exception {
		this.url = url;
	}

	public void close() throws Exception {
	}

	public boolean connected() {
		return true;
	}

	public RetMsg execute(String cmd) throws Exception {
		SqlSession session = this.getSession();

		RetMsg var7;
		try {
			BroadMapper dao = (BroadMapper)session.getMapper(BroadMapper.class);
			String prefix = cmd.substring(0, 6).toLowerCase();
			Map<String, Object> map = new HashMap();
			map.put("sql", cmd);
			if ("select".equals(prefix)) {
				dao.select(map);
			} else {
				dao.execute(map);
			}

			var7 = new RetMsg("0", "执行成功");
			return var7;
		} catch (Exception var10) {
			var7 = new RetMsg("1", var10.getMessage().length() >= 500 ? var10.getMessage().substring(0, 499) : var10.getMessage());
		} finally {
			session.close();
		}

		return var7;
	}

	public RetMsg execute(String cmd, String prompt) throws Exception {
		return this.execute(cmd);
	}

	public boolean buildLink(String url) {
		return false;
	}

	public void sendMsg(byte[] msg) {
	}

	public void readMsg() {
	}

	public void doException(String msg) {
	}

	public void closeSocekt() {
	}

}
