package com.demo.action;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/11/30 11:01
 */
public class OrderAction extends ActionSupport {

	public String execute() throws Exception {
		System.out.println("order action execute");
		return SUCCESS;
	}

	public String add() throws Exception {
		System.out.println("order action add");
		return SUCCESS;
	}

	public String delete() throws Exception {
		System.out.println("order action delete");
		return SUCCESS;
	}

	public String update() throws Exception {
		System.out.println("order action update");
		return SUCCESS;
	}

	public String select() throws Exception {
		System.out.println("order action select");
		return SUCCESS;
	}

}
