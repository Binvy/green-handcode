package com.demo.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

/**
 * @author binvi
 * @version 1.0
 * @Description: session登录拦截器
 * @date 2019/11/30 21:23
 */
public class SessionInterceptor implements Interceptor {


	@Override
	public void destroy() {

	}

	@Override
	public void init() {

	}

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		return null;
	}
}
