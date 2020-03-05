package com.tstar.activiti.model;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/12 22:32
 */
public interface IBusinessEntity {

	String getId();

	void setId(String id);

	String getCreator();

	void setCreator(String creator);

	String getProcessName();

	void setProcessName(String processName);

	String getProcessInstanceId();

	void setProcessInstanceId(String processInstanceId);

}
