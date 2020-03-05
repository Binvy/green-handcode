package com.tstar.sms.mapper;

import java.util.Map;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/11 22:56
 */
public interface BroadMapper {

	int select(Map<String, Object> map);

	void execute(Map<String, Object> map);

}
