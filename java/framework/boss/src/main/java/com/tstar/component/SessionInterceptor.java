package com.tstar.component;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/16 21:52
 */
public class SessionInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		String url = ServletActionContext.getRequest().getRequestURL().toString();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Cache-Control", "no-store");
		response.setDateHeader("Expires", 0L);
		if (url.indexOf("login") == -1 && url.indexOf("logout") == -1 && url.indexOf("selectSysIp") == -1) {
			if (!ServletActionContext.getRequest().isRequestedSessionIdValid()) {
				return "loginPage";
			} else {
				Map<String, Object> session = ActionContext.getContext().getSession();
				return session != null && session.size() != 0 ? invocation.invoke() : "loginPage";
			}
		} else {
			return invocation.invoke();
		}
	}

}
