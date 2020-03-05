package com.tstar.crm.mapper;

import com.tstar.crm.model.CrmUser;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface CrmUserMapper {

	int deleteByPrimaryKey(String var1);

	int insert(CrmUser var1);

	int insertSelective(CrmUser var1);

	CrmUser selectByPrimaryKey(String var1);

	CrmUser selectByBusinessKey(String var1);

	CrmUser selectByBusinessKeyAndType(String var1, String var2);

	CrmUser selectByBusinessKeyAndType1(String var1, String var2);

	CrmUser selectByCentrix(String var1);

	CrmUser selectByLinkPhone(String var1, String var2);

	int updateByPrimaryKeySelective(CrmUser var1);

	int updateByPrimaryKey(CrmUser var1);

	int countByCriteria(Map<String, Object> var1);

	List<CrmUser> selectByPage(Map<String, Object> var1);

	List<CrmUser> selectAll();

	int countEffectiveByKey(String var1, String var2);

	int updateStatus(String var1, Integer var2);

	CrmUser selectByTime(String var1, String var2, Date var3);

	List<CrmUser> selectByBusinessType(String var1);

	List<Map<String, Object>> selectDebitUserKeys(String var1);

	int updateCreditorKey(String var1, String var2);

	List<CrmUser> selectDeletingUsers(Map<String, Object> var1);

	List<CrmUser> selectForPay(Map<String, Object> var1);

	List<CrmUser> selectByCustomerId(String var1);

	List<Map<String, Object>> selectRunningPrepaidBroadUsers(Map<String, Object> var1);

	List<CrmUser> selectByCustomerId(Map<String, Object> var1);

	int countByCustomerId(Map<String, Object> var1);

	List<CrmUser> findByCustomerId(Map<String, Object> var1);

	List<Map<String, Object>> selectCustomerUserInfo(String var1);

	List<Map<String, Object>> selectCustomerInfo(Map<String, String> var1);

	List<CrmUser> selectRelUser(String var1, String var2);

	int countByuserInfoCriteria(Map<String, Object> var1);

	List<CrmUser> selectByuserInfoPage(Map<String, Object> var1);

	int countByaccountInfoCriteria(Map<String, Object> var1);

	List<CrmUser> selectByaccountInfoPage(Map<String, Object> var1);

	Map<String, Object> findCustomerInfoById(String var1);

	CrmUser findByBusinessKey(String var1);

	CrmUser findBusinessKey(String var1);

	String selectbyUser(String var1);

	int findCustormUserCount(String var1);

	void updatePauserTime(String var1, Date var2);

	int countByCustomerIdBroad(Map<String, Object> var1);

	CrmUser selectByCustomerIdOne(String var1);

	CrmUser selectByUnabridged(String var1);

}
