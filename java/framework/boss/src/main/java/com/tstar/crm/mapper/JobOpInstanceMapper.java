package com.tstar.crm.mapper;

import com.tstar.crm.model.JobOpInstance;

import java.util.List;
import java.util.Map;

public interface JobOpInstanceMapper {

	int deleteByPrimaryKey(String var1);

	int insert(JobOpInstance var1);

	int insertSelective(JobOpInstance var1);

	JobOpInstance selectByPrimaryKey(String var1);

	JobOpInstance selectDebitUserKeys(String var1);

	int updateByPrimaryKeySelective(JobOpInstance var1);

	int updateByPrimaryKey(JobOpInstance var1);

	int countByUserId(String var1);

	int countByJobOpCriteria(Map<String, Object> var1);

	List<JobOpInstance> selectByJobOpInfoPage(Map<String, Object> var1);

	int findByUserId(String var1);

	List<JobOpInstance> YwUserInfo(String var1);

}
