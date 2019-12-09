package com.demo.action;

import com.demo.model.User;
import com.demo.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/11/30 10:58
 */
public class UserAction extends ActionSupport {
	
	private static final Logger logger = LogManager.getLogger(UserAction.class);

	@Autowired
	private UserService userService;

	public String execute() throws Exception {
		logger.info("user action execute");
		return SUCCESS;
	}

	public String add() throws Exception {
		logger.info("user action add");
		return SUCCESS;
	}

	public String delete() throws Exception {
		logger.info("user action delete");
		return SUCCESS;
	}

	public String update() throws Exception {
		logger.info("user action update");
		return SUCCESS;
	}

	public String select() throws Exception {
		logger.info("user action select");
		User user = userService.select("1");
		logger.info("user:{}", user);
		return SUCCESS;
	}

}
