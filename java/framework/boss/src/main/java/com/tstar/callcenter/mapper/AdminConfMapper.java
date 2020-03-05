package com.tstar.callcenter.mapper;

import com.tstar.annotation.DataSource;
import com.tstar.portal.model.ResultMap;

import java.util.List;

public interface AdminConfMapper {

	@DataSource("postgre")
	List<ResultMap> selectEmplByPage(ResultMap var1);

	int selectEmplByCount(ResultMap var1);

	List<Long> selectSkillIdByEmplId(long var1);

	List<ResultMap> selectSkillTreeChild();

	List<ResultMap> selectSkillGroups();

	List<ResultMap> selectDeptByPage(ResultMap var1);

	int selectDeptByCount(ResultMap var1);

	List<ResultMap> deptSelectList();

	List<ResultMap> selectSkillByPage(ResultMap var1);

	int selectSkillByCount(ResultMap var1);

	List<ResultMap> select114ByPage(ResultMap var1);

	int select114ByCount(ResultMap var1);

	int selectDeptChildByCount(ResultMap var1);

	int selectEmplCountByDept(ResultMap var1);

	@DataSource("oracle")
	int selectoral();

	int insertRecord(ResultMap var1);

	List<ResultMap> selectRecordByPage(ResultMap var1);

	int selectAllRecordCount(ResultMap var1);

	List<ResultMap> selectEmplNameByEmplNo(ResultMap var1);

	List<ResultMap> selectEmplByLog(ResultMap var1);

	int insertLoginLog(ResultMap var1);

	List<ResultMap> selectSysConf();

	int updateSysConf(ResultMap var1);

	List<ResultMap> selectSystemIp();

}
