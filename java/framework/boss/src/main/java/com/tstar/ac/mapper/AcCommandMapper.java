package com.tstar.ac.mapper;

import com.tstar.ac.model.AcCommand;

import java.util.List;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/11 22:14
 */
public interface AcCommandMapper {

	int deleteByPrimaryKey(String id);

	int insert(AcCommand acCommand);

	int insertSelective(AcCommand acCommand);

	AcCommand selectByPrimaryKey(String id);

	int updateByPrimaryKeySelective(AcCommand acCommand);

	int updateByPrimaryKey(AcCommand acCommand);

	List<AcCommand> selectByActionId(String actionId);

	int deleteByActionId(String actionId);

}
