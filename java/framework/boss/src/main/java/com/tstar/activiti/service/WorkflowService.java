package com.tstar.activiti.service;

import com.tstar.activiti.model.IBusinessEntity;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;

import java.util.List;
import java.util.Map;

public interface WorkflowService {

	ProcessInstance start(IBusinessEntity var1, Map<String, Object> var2);

	List<Task> findTodoTasks(String var1);

	void convertToModel(String var1) throws Exception;

}
