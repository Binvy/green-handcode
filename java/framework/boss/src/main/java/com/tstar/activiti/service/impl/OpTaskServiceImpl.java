package com.tstar.activiti.service.impl;

import com.tstar.activiti.service.OpTaskService;
import com.tstar.crm.mapper.JobOpInstanceMapper;
import com.tstar.crm.model.JobOpInstance;
import com.tstar.util.BeanHelper;
import com.tstar.util.ExceptionUtil;
import org.activiti.engine.*;
import org.activiti.engine.form.FormProperty;
import org.activiti.engine.form.TaskFormData;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricProcessInstanceQuery;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.runtime.ProcessInstanceQuery;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/12 23:03
 */
@Service
public class OpTaskServiceImpl implements OpTaskService {

	@Resource
	private TaskService taskService;
	@Resource
	private RuntimeService runtimeService;
	@Resource
	private HistoryService historyService;
	@Resource
	private RepositoryService repositoryService;
	@Resource
	private FormService formService;
	@Resource
	private JobOpInstanceMapper daoJobOpInstance;

	public OpTaskServiceImpl() {
	}

	public int countAll(String userId) {
		TaskQuery taskQuery = this.taskService.createTaskQuery().taskCandidateOrAssigned(userId);
		return (int)taskQuery.count();
	}

	public int countRunning() {
		ProcessInstanceQuery processInstanceQuery = this.runtimeService.createProcessInstanceQuery();
		return (int)processInstanceQuery.count();
	}

	public int countHistory() {
		HistoricProcessInstanceQuery historyInstanceQuery = this.historyService.createHistoricProcessInstanceQuery();
		return (int)historyInstanceQuery.count();
	}

	public List<Map<String, Object>> findByPage(String userId, int start, int length) {
		TaskQuery taskQuery = this.taskService.createTaskQuery().taskCandidateOrAssigned(userId);
		List<Task> taskList = taskQuery.list();
		System.out.println("taskList.size()=" + taskList.size());
		List<Map<String, Object>> lst = new ArrayList();

		HashMap map;
		for(Iterator iterator = taskList.iterator(); iterator.hasNext(); lst.add(map)) {
			Task task = (Task)iterator.next();
			map = new HashMap();
			map.put("id", task.getId());
			map.put("name", task.getName());
			map.put("assignee", task.getAssignee());
			map.put("createTime", task.getCreateTime());
			map.put("dueDate", task.getDueDate());
			map.put("processDefinitionId", task.getProcessDefinitionId());
			map.put("processInstanceId", task.getProcessInstanceId());
			ProcessInstance instance = (ProcessInstance)this.runtimeService.createProcessInstanceQuery().processInstanceId(task.getProcessInstanceId()).singleResult();
			map.put("businessKey", instance.getBusinessKey());
			if (!StringUtils.isEmpty(instance.getBusinessKey())) {
				JobOpInstance jobOpInstance = this.daoJobOpInstance.selectByPrimaryKey(instance.getBusinessKey());
				if (jobOpInstance != null) {
					try {
						BeanHelper.bean2map(jobOpInstance, map);
					} catch (Exception var15) {
					}
				}
			}

			String newUserId = (String)this.taskService.getVariable(task.getId(), "newUserId");
			if (!StringUtils.isEmpty(newUserId)) {
				map.put("newUserId", newUserId);
			}

			String newCustomerId = (String)this.taskService.getVariable(task.getId(), "newCustomerId");
			if (!StringUtils.isEmpty(newCustomerId)) {
				map.put("newCustomerId", newCustomerId);
			}

			String newBusinessKey = (String)this.taskService.getVariable(task.getId(), "newBusinessKey");
			if (!StringUtils.isEmpty(newBusinessKey)) {
				map.put("newBusinessKey", newBusinessKey);
			}

			TaskFormData taskFormData = this.formService.getTaskFormData(task.getId());
			if (taskFormData != null) {
				map.put("formKey", taskFormData.getFormKey());
			}
		}

		return lst;
	}

	public List<Map<String, Object>> getTaskFormProperties(String taskId) {
		TaskFormData taskFormData = this.formService.getTaskFormData(taskId);
		List<Map<String, Object>> lst = new ArrayList();
		if (taskFormData == null) {
			return lst;
		} else {
			List<FormProperty> properties = taskFormData.getFormProperties();
			if (properties != null && properties.size() != 0) {
				HashMap map;
				for(Iterator iterator = properties.iterator(); iterator.hasNext(); lst.add(map)) {
					FormProperty property = (FormProperty)iterator.next();
					map = new HashMap();
					map.put("id", property.getId());
					map.put("name", property.getName());
					map.put("type", property.getType());
					map.put("isRequired", property.isRequired());
					map.put("isReadable", property.isReadable());
					map.put("isWritable", property.isWritable());
					if ("enum".equals(property.getType().getName())) {
						map.put("information", property.getType().getInformation("values"));
					} else if ("date".equals(property.getType().getName())) {
						map.put("information", property.getType().getInformation("datePattern"));
					}

					Object value = this.taskService.getVariable(taskId, property.getId());
					if (value != null) {
						map.put("value", value);
					}
				}

				return lst;
			} else {
				return lst;
			}
		}
	}

	public String[] claim(Map<String, String> obj) {
		String taskId = (String)obj.get("taskId");
		String userId = (String)obj.get("userId");
		if (!StringUtils.isEmpty(taskId) && !StringUtils.isEmpty(userId)) {
			this.taskService.claim(taskId, userId);
			return new String[]{"0", "任务已签收，可以办理！"};
		} else {
			return new String[]{"1", "未知的错误：任务ID缺失或者未登录！"};
		}
	}

	public String[] handle(String taskId, Map<String, String> obj) {
		try {
			Map<String, Object> map = new HashMap();
			if (obj != null) {
				Iterator iterator = obj.keySet().iterator();

				while(iterator.hasNext()) {
					String key = (String)iterator.next();
					map.put(key, obj.get(key));
				}
			}

			this.taskService.complete(taskId, map);
			return new String[]{"0", "任务提交成功！"};
		} catch (Exception var6) {
			System.out.println(ExceptionUtil.getStackTrace(var6));
			return new String[]{"1", "任务提交失败：" + var6.getMessage()};
		}
	}

	public List<Map<String, Object>> findRunningByPage(int start, int length) {
		ProcessInstanceQuery processInstanceQuery = (ProcessInstanceQuery)this.runtimeService.createProcessInstanceQuery().orderByProcessInstanceId().desc();
		List<ProcessInstance> instances = processInstanceQuery.listPage(start, length);
		List<Map<String, Object>> lst = new ArrayList();
		if (instances != null && instances.size() != 0) {
			HashMap map;
			for(Iterator iterator = instances.iterator(); iterator.hasNext(); lst.add(map)) {
				ProcessInstance instance = (ProcessInstance)iterator.next();
				Task task = (Task)((TaskQuery)this.taskService.createTaskQuery().processInstanceId(instance.getProcessInstanceId())).singleResult();
				JobOpInstance jobOpInstance = this.daoJobOpInstance.selectByPrimaryKey(instance.getBusinessKey());
				map = new HashMap();
				map.put("processInstanceId", instance.getId());
				if (jobOpInstance != null) {
					map.put("businessOpName", jobOpInstance.getBusinessOpName());
					map.put("businessChName", jobOpInstance.getBusinessChName());
				}

				if (task != null) {
					map.put("taskId", task.getId());
					if (task.getName() == null) {
						map.put("taskName", "");
					} else {
						map.put("taskName", task.getName());
					}

					map.put("taskStartTime", task.getCreateTime());
					map.put("assignee", task.getAssignee());
				} else {
					map.put("taskName", "");
					map.put("taskStartTime", "");
					map.put("assignee", "");
				}

				if (jobOpInstance != null) {
					try {
						BeanHelper.bean2map(jobOpInstance, map);
					} catch (Exception var12) {
					}
				}
			}

			return lst;
		} else {
			return lst;
		}
	}

	public List<Map<String, Object>> findFinishedByPage(int start, int length) {
		HistoricProcessInstanceQuery query = (HistoricProcessInstanceQuery)this.historyService.createHistoricProcessInstanceQuery().finished().orderByProcessInstanceStartTime().desc();
		List<HistoricProcessInstance> instances = query.listPage(start, length);
		List<Map<String, Object>> lst = new ArrayList();
		if (instances != null && instances.size() != 0) {
			Iterator iterator = instances.iterator();

			while(iterator.hasNext()) {
				HistoricProcessInstance instance = (HistoricProcessInstance)iterator.next();
				Map<String, Object> map = new HashMap();
				ProcessDefinition processDefinition = (ProcessDefinition)this.repositoryService.createProcessDefinitionQuery().processDefinitionId(instance.getProcessDefinitionId()).singleResult();
				JobOpInstance jobOpInstance = this.daoJobOpInstance.selectByPrimaryKey(instance.getBusinessKey());
				if (jobOpInstance != null) {
					map.put("processInstanceId", instance.getId());
					if (jobOpInstance != null) {
						map.put("businessOpName", jobOpInstance.getBusinessOpName());
						map.put("businessChName", jobOpInstance.getBusinessChName());
					}

					map.put("instanceEndTime", instance.getEndTime());
					if (jobOpInstance != null) {
						try {
							BeanHelper.bean2map(jobOpInstance, map);
						} catch (Exception var12) {
						}
					}

					lst.add(map);
				}
			}

			return lst;
		} else {
			return lst;
		}
	}

}
