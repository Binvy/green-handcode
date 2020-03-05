package com.tstar.activiti.service.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.tstar.activiti.model.IBusinessEntity;
import com.tstar.activiti.service.WorkflowService;
import org.activiti.bpmn.converter.BpmnXMLConverter;
import org.activiti.bpmn.model.BpmnModel;
import org.activiti.editor.language.json.converter.BpmnJsonConverter;
import org.activiti.engine.*;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricProcessInstanceQuery;
import org.activiti.engine.repository.Model;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.runtime.ProcessInstanceQuery;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;
import java.util.Map;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/12 23:01
 */
@Service
public class WorkflowServiceImpl implements WorkflowService {

	@Resource
	IdentityService identityService;
	@Resource
	RepositoryService repositoryService;
	@Resource
	RuntimeService runtimeService;
	@Resource
	HistoryService historyService;
	@Resource
	TaskService taskService;

	public WorkflowServiceImpl() {
	}

	public ProcessInstance start(IBusinessEntity entity, Map<String, Object> variables) {
		String businessKey = entity.getId();
		ProcessInstance processInstance = null;

		try {
			this.identityService.setAuthenticatedUserId(entity.getCreator());
			processInstance = this.runtimeService.startProcessInstanceByKey(entity.getProcessName(), businessKey, variables);
			entity.setProcessInstanceId(processInstance.getId());
		} finally {
			this.identityService.setAuthenticatedUserId((String)null);
		}

		return processInstance;
	}

	public List<Task> findTodoTasks(String userId) {
		TaskQuery taskQuery = this.taskService.createTaskQuery().taskCandidateOrAssigned(userId);
		return taskQuery.list();
	}

	public List<ProcessInstance> findRunningProcessInstance(String processName) {
		ProcessInstanceQuery query = (ProcessInstanceQuery)this.runtimeService.createProcessInstanceQuery().processDefinitionKey(processName).active().orderByProcessInstanceId().desc();
		return query.list();
	}

	public List<HistoricProcessInstance> findFinishedProcessInstance(String processName) {
		HistoricProcessInstanceQuery query = (HistoricProcessInstanceQuery)this.historyService.createHistoricProcessInstanceQuery().processDefinitionKey(processName).finished().orderByProcessInstanceEndTime().desc();
		return query.list();
	}

	public void convertToModel(String processDefinitionId) throws Exception {
		ProcessDefinition processDefinition = (ProcessDefinition)this.repositoryService.createProcessDefinitionQuery().processDefinitionId(processDefinitionId).singleResult();
		InputStream bpmnStream = this.repositoryService.getResourceAsStream(processDefinition.getDeploymentId(), processDefinition.getResourceName());
		XMLInputFactory xif = XMLInputFactory.newInstance();
		InputStreamReader in = new InputStreamReader(bpmnStream, "UTF-8");
		XMLStreamReader xtr = xif.createXMLStreamReader(in);
		BpmnModel bpmnModel = (new BpmnXMLConverter()).convertToBpmnModel(xtr);
		BpmnJsonConverter converter = new BpmnJsonConverter();
		ObjectNode modelNode = converter.convertToJson(bpmnModel);
		Model modelData = this.repositoryService.newModel();
		modelData.setKey(processDefinition.getKey());
		modelData.setName(processDefinition.getResourceName());
		modelData.setCategory(processDefinition.getDeploymentId());
		ObjectNode modelObjectNode = (new ObjectMapper()).createObjectNode();
		modelObjectNode.put("name", processDefinition.getName());
		modelObjectNode.put("revision", 1);
		modelObjectNode.put("description", processDefinition.getDescription());
		modelData.setMetaInfo(modelObjectNode.toString());
		this.repositoryService.saveModel(modelData);
		this.repositoryService.addModelEditorSource(modelData.getId(), modelNode.toString().getBytes("utf-8"));
	}

}
