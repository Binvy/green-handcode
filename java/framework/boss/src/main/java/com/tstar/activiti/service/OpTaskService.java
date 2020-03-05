package com.tstar.activiti.service;

import java.util.List;
import java.util.Map;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/12 23:02
 */
public interface OpTaskService {

	int countAll(String var1);

	List<Map<String, Object>> findByPage(String var1, int var2, int var3);

	List<Map<String, Object>> getTaskFormProperties(String var1);

	String[] claim(Map<String, String> var1);

	String[] handle(String var1, Map<String, String> var2);

	int countRunning();

	List<Map<String, Object>> findRunningByPage(int var1, int var2);

	List<Map<String, Object>> findFinishedByPage(int var1, int var2);

	int countHistory();

}
