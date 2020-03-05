package com.tstar.ac.service.impl;

import com.tstar.ac.mapper.AcActionMapper;
import com.tstar.ac.mapper.AcCommandMapper;
import com.tstar.ac.model.AcAction;
import com.tstar.ac.model.AcCommand;
import com.tstar.ac.service.AcActionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/11 22:16
 */
@Service
public class AcActionServiceImpl implements AcActionService {

	@Resource
	private AcActionMapper daoAcAction;
	@Resource
	private AcCommandMapper daoAcCommand;

	public AcActionServiceImpl() {
	}

	public int countByCriteria(Map<String, Object> map) {
		return this.daoAcAction.countByCriteria(map);
	}

	public List<AcAction> selectByPage(Map<String, Object> map) {
		return this.daoAcAction.selectByPage(map);
	}

	public List<AcCommand> selectCmdsByActId(String actionId) {
		return this.daoAcCommand.selectByActionId(actionId);
	}

	public String[] reset(String actionId) {
		this.daoAcCommand.deleteByActionId(actionId);
		int res = this.daoAcAction.updateStatusByPrimaryKey(actionId);
		return res > 0 ? new String[]{"0", "重置成功"} : new String[]{"1", "重置失败"};
	}

	public List<AcAction> findByUserId(Map<String, Object> map) {
		return this.daoAcAction.findByUserId(map);
	}

	public int countByuserId(Map<String, Object> map) {
		return this.daoAcAction.countByuserId(map);
	}

	public String[] rerun(String id) {
		int res = this.daoAcAction.updateRerunStatusByPrimaryKey(id);
		return res > 0 ? new String[]{"0", "重新执行成功"} : new String[]{"1", "重新执行失败"};
	}

	public String[] updateCommand(AcCommand ac) {
		int res = this.daoAcCommand.updateByPrimaryKeySelective(ac);
		return res > 0 ? new String[]{"0", "修改成功"} : new String[]{"1", "修改失败"};
	}

}
