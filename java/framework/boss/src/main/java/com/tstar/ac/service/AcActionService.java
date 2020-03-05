package com.tstar.ac.service;

import com.tstar.ac.model.AcAction;
import com.tstar.ac.model.AcCommand;

import java.util.List;
import java.util.Map;

public interface AcActionService {

	int countByCriteria(Map<String, Object> map);

	List<AcAction> selectByPage(Map<String, Object> map);

	List<AcCommand> selectCmdsByActId(String actionId);

	String[] reset(String actionId);

	List<AcAction> findByUserId(Map<String, Object> map);

	int countByuserId(Map<String, Object> map);

	String[] rerun(String id);

	String[] updateCommand(AcCommand ac);

}
