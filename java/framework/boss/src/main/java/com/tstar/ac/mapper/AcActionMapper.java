package com.tstar.ac.mapper;

import com.tstar.ac.model.AcAction;

import java.util.List;
import java.util.Map;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/11 22:14
 */
public interface AcActionMapper {

	int deleteByPrimaryKey(String id);

	int insert(AcAction acAction);

	int insertSelective(AcAction acAction);

	AcAction selectByPrimaryKey(String id);

	int updateByPrimaryKeySelective(AcAction acAction);

	int updateByPrimaryKey(AcAction acAction);

	AcAction selectTopByStatus(Integer status);

	AcAction selectTopRunnable();

	int updateStatusByJobId(String jobId, Integer status);

	int updateStatusByPrimaryKey(String id);

	int countByCriteria(Map<String, Object> param);

	List<AcAction> selectByPage(Map<String, Object> param);

	List<AcAction> selectByInstanceId(String instanceId);

	int reset(String jobId);

	List<AcAction> findByUserId(Map<String, Object> param);

	int countByuserId(Map<String, Object> param);

	int updateRerunStatusByPrimaryKey(String id);

}
