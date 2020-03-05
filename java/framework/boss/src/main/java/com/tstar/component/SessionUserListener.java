package com.tstar.component;

import com.tstar.callcenter.model.UserEmplInfo;
import com.tstar.callcenter.model.UserSession;
import com.tstar.portal.model.SysUser;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/16 22:25
 */
public class SessionUserListener implements HttpSessionListener {

	private static Map<String, HttpSession> sessionMap = new ConcurrentHashMap(500);

	public SessionUserListener() {
	}

	public void sessionCreated(HttpSessionEvent se) {
	}

	public void sessionDestroyed(HttpSessionEvent se) {
		getSessionMap().remove(se.getSession().getId());
	}

	public static List<HttpSession> getUserSessions() {
		List<HttpSession> list = new ArrayList();
		Iterator iterator = getSessionMapKeySetIt();

		while(iterator.hasNext()) {
			String key = (String)iterator.next();
			HttpSession session = (HttpSession)getSessionMap().get(key);
			list.add(session);
		}

		return list;
	}

	public static Map<String, String> getUserSessionMap() {
		Map<String, String> map = new HashMap();
		Iterator iter = getSessionMapKeySetIt();

		while(iter.hasNext()) {
			String sessionId = (String)iter.next();
			HttpSession session = (HttpSession)getSessionMap().get(sessionId);
			UserEmplInfo user = (UserEmplInfo)session.getAttribute("userInfo");
			if (user != null) {
				map.put(String.valueOf(user.getUserId()), sessionId);
			}
		}

		return map;
	}

	public static synchronized void removeUserSession(String userId) {
		Map<String, String> userSessionMap = getUserSessionMap();
		if (userSessionMap.containsKey(userId)) {
			String sessionId = (String)userSessionMap.get(userId);
			((HttpSession)getSessionMap().get(sessionId)).invalidate();
			getSessionMap().remove(sessionId);
		}

	}

	public static void addUserSession(HttpSession session) {
		getSessionMap().put(session.getId(), session);
	}

	public static void removeSession(String sessionID) {
		getSessionMap().remove(sessionID);
	}

	public static boolean containsKey(String key) {
		return getSessionMap().containsKey(key);
	}

	public static synchronized boolean checkIfHasLogin(UserEmplInfo user) {
		Iterator iter = getSessionMapKeySetIt();

		UserSession sessionuser;
		do {
			if (!iter.hasNext()) {
				return false;
			}

			String sessionId = (String)iter.next();
			HttpSession session = (HttpSession)getSessionMap().get(sessionId);
			sessionuser = (UserSession)session.getAttribute("userInfo");
		} while(sessionuser == null || !sessionuser.getUserId().equals(String.valueOf(user.getUserId())));

		return true;
	}

	public static synchronized  boolean checkIfHasLogin(SysUser user) {
		Iterator iter = getSessionMapKeySetIt();

		UserSession sessionuser;
		do {
			if (!iter.hasNext()) {
				return false;
			}
			String sessionId = (String)iter.next();
			HttpSession session = (HttpSession)getSessionMap().get(sessionId);
			sessionuser = (UserSession)session.getAttribute("userInfo");
		} while(sessionuser == null || !sessionuser.getUserId().equals(String.valueOf(user.getId())));
		return true;
	}

	public static Map<String, HttpSession> getSessionMap() {
		return sessionMap;
	}

	public static Iterator<String> getSessionMapKeySetIt() {
		return getSessionMap().keySet().iterator();
	}

}
