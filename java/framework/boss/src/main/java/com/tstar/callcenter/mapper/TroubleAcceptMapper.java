package com.tstar.callcenter.mapper;

import com.tstar.portal.model.ResultMap;

public interface TroubleAcceptMapper {

	void selectTrouUser(ResultMap var1);

	void selectTrouType(ResultMap var1);

	void selectTrouHist(ResultMap var1);

	void selectWorkFlow(ResultMap var1);

	void insertTrouble(ResultMap var1);

	void selectLoginUser(ResultMap var1);

	ResultMap checkDh(String var1);

	ResultMap checkBroad(String var1);

}
