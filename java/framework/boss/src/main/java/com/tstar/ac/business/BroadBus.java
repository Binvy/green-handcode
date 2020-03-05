package com.tstar.ac.business;

import com.tstar.sms.mapper.BroadMapper;
import com.tstar.util.BroadSessionFactory;
import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.HashMap;
import java.util.Map;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/12 21:48
 */
public class BroadBus {

	private static final Logger logger = LogManager.getLogger(BroadBus.class);

	public BroadBus() {
	}

	public static int getUserCount() {
		SqlSession session = BroadSessionFactory.getSession();

		try {
			BroadMapper dao = (BroadMapper)session.getMapper(BroadMapper.class);
			Map<String, Object> map = new HashMap();
			String sql = "insert into t_user(USER_ID,USER_NAME) values('4','4')";
			map.put("sql", sql);
			String prefix = sql.substring(0, 6).toLowerCase();
			if (prefix.equals("select")) {
				int var7 = dao.select(map);
				return var7;
			}

			try {
				dao.execute(map);
				return 1;
			} catch (Exception var11) {
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return -1;
		} finally {
			session.close();
		}

		return -1;
	}

}
