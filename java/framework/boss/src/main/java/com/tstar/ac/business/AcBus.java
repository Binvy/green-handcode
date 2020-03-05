package com.tstar.ac.business;

import com.tstar.ac.mapper.AcActionMapper;
import com.tstar.ac.mapper.AcCommandMapper;
import com.tstar.ac.model.AcAction;
import com.tstar.ac.model.AcCommand;
import com.tstar.crm.mapper.CrmUserAdslMapper;
import com.tstar.crm.mapper.CrmUserBroadMapper;
import com.tstar.crm.mapper.CrmUserMapper;
import com.tstar.crm.mapper.CrmUserPhoneMapper;
import com.tstar.crm.model.CrmUser;
import com.tstar.crm.model.CrmUserAdsl;
import com.tstar.crm.model.CrmUserBroad;
import com.tstar.crm.model.CrmUserPhone;
import com.tstar.portal.mapper.SysWarnLogMapper;
import com.tstar.portal.model.SysWarnLog;
import com.tstar.res.mapper.ResDeviceMapper;
import com.tstar.res.mapper.ResOpticalPortMapper;
import com.tstar.res.mapper.ResUserPortMapper;
import com.tstar.res.model.ResDevice;
import com.tstar.res.model.ResOpticalPort;
import com.tstar.res.model.ResUserPort;
import com.tstar.util.BeanHelper;
import com.tstar.util.MyBatisSessionFactory;
import com.tstar.util.UUID;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;

import java.util.*;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/11 23:02
 */
public class AcBus {

	private static Map<String, ResDevice> devices = new HashMap();

	public AcBus() {
	}

	public AcAction getTopAction(int status) {
		SqlSession session = MyBatisSessionFactory.getSession();

		AcAction action;
		try {
			AcActionMapper dao = (AcActionMapper)session.getMapper(AcActionMapper.class);
			action = dao.selectTopByStatus(status);
		} finally {
			session.close();
		}

		return action;
	}

	public AcAction getTopRunnableAction() {
		SqlSession session = MyBatisSessionFactory.getSession();

		AcAction action;
		try {
			AcActionMapper dao = (AcActionMapper)session.getMapper(AcActionMapper.class);
			action = dao.selectTopRunnable();
		} finally {
			session.close();
		}

		return action;
	}

	public void exeAction(AcAction action) {
		SqlSession session = MyBatisSessionFactory.getSession();

		try {
			AcActionMapper dao = (AcActionMapper)session.getMapper(AcActionMapper.class);
			AcCommandMapper daoAcCommand = (AcCommandMapper)session.getMapper(AcCommandMapper.class);
			ResUserPortMapper daoResUserPort = (ResUserPortMapper)session.getMapper(ResUserPortMapper.class);
			ResDeviceMapper daoResDevice = (ResDeviceMapper)session.getMapper(ResDeviceMapper.class);
			ResOpticalPortMapper daoOpticalPort = (ResOpticalPortMapper)session.getMapper(ResOpticalPortMapper.class);
			CrmUserMapper daoCrmUser = (CrmUserMapper)session.getMapper(CrmUserMapper.class);
			CrmUserAdslMapper daoAdsl = (CrmUserAdslMapper)session.getMapper(CrmUserAdslMapper.class);
			CrmUserBroadMapper daoBroad = (CrmUserBroadMapper)session.getMapper(CrmUserBroadMapper.class);
			CrmUserPhoneMapper daoPhone = (CrmUserPhoneMapper)session.getMapper(CrmUserPhoneMapper.class);
			String userId = action.getUserId();
			CrmUser user = daoCrmUser.selectByPrimaryKey(userId);
			CrmUserAdsl adsl = null;
			CrmUserBroad broad = null;
			CrmUserPhone phone = null;
			if ("a".equals(user.getBusinessType())) {
				adsl = daoAdsl.selectByPrimaryKey(userId);
			} else if ("b".equals(user.getBusinessType())) {
				broad = daoBroad.selectByPrimaryKey(userId);
			} else if ("p".equals(user.getBusinessType())) {
				phone = daoPhone.selectByPrimaryKey(userId);
			}

			daoAcCommand.deleteByActionId(action.getId());
			int cmdCount = 0;
			List<ResUserPort> ports = daoResUserPort.selectByUserId(userId);
			Iterator portIterator = ports.iterator();

			while(true) {
				ResUserPort port;
				List cmds;
				do {
					do {
						do {
							if (!portIterator.hasNext()) {
								if (cmdCount > 0) {
									action.setStatus(2);
								} else {
									action.setStatus(91);
								}

								action.setUpdateTime(new Date());
								dao.updateByPrimaryKey(action);
								session.commit();
								return;
							}

							port = (ResUserPort)portIterator.next();
						} while(StringUtils.isEmpty(port.getCtrlSetName()));

						Map<String, Object> variables = new HashMap();
						ResDevice device = daoResDevice.selectByCode(port.getDeviceCode());

						try {
							BeanHelper.bean2map(device, variables);
						} catch (Exception e) {
						}

						ResOpticalPort opticalPort = daoOpticalPort.selectByKey(user.getBusinessKey());
						if (opticalPort != null) {
							try {
								BeanHelper.bean2map(opticalPort, variables);
							} catch (Exception e) {
							}
						}

						String parms = action.getParms();
						if (!StringUtils.isEmpty(parms)) {
							String[] ps = parms.split(",");
							String[] paramArray = ps;
							int length = ps.length;

							for(int i = 0; i < length; ++i) {
								String p = paramArray[i];
								int pos = p.indexOf(":");
								variables.put(p.substring(0, pos), p.substring(pos + 1));
							}
						}

						if (adsl != null) {
							try {
								BeanHelper.bean2map(adsl, variables);
							} catch (Exception e) {
							}
						}

						if (broad != null) {
							try {
								BeanHelper.bean2map(broad, variables);
							} catch (Exception e) {
							}
						}

						if (phone != null) {
							try {
								BeanHelper.bean2map(phone, variables);
							} catch (Exception e) {
							}
						}

						if (user != null) {
							try {
								BeanHelper.bean2map(user, variables);
							} catch (Exception e) {
							}
						}

						cmds = CmdProfile.getCmds(port.getCtrlSetName(), action.getOssKey(), variables);
					} while(cmds == null);
				} while(cmds.size() <= 0);

				cmdCount += cmds.size();
				Iterator cmdIterator = cmds.iterator();

				while(cmdIterator.hasNext()) {
					AcCommand cmd = (AcCommand)cmdIterator.next();
					cmd.setId(UUID.get());
					cmd.setActionId(action.getId());
					cmd.setDeviceCode(port.getDeviceCode());
					cmd.setCtrlSetName(port.getCtrlSetName());
					daoAcCommand.insert(cmd);
				}
			}
		} finally {
			session.close();
		}
	}

	public void updateAction(AcAction action) {
		SqlSession session = MyBatisSessionFactory.getSession();

		try {
			AcActionMapper dao = (AcActionMapper)session.getMapper(AcActionMapper.class);
			dao.updateByPrimaryKey(action);
			session.commit();
		} finally {
			session.close();
		}

	}

	public List<AcCommand> getCmdsByAct(String actionId) {
		SqlSession session = MyBatisSessionFactory.getSession();

		List commands;
		try {
			AcCommandMapper dao = (AcCommandMapper)session.getMapper(AcCommandMapper.class);
			commands = dao.selectByActionId(actionId);
		} finally {
			session.close();
		}

		return commands;
	}

	public void saveCmds(AcAction action, List<AcCommand> cmds) {
		SqlSession session = MyBatisSessionFactory.getSession();

		try {
			AcActionMapper daoAcAction = (AcActionMapper)session.getMapper(AcActionMapper.class);
			action.setUpdateTime(new Date());
			daoAcAction.updateByPrimaryKey(action);
			if (cmds != null && cmds.size() > 0) {
				AcCommandMapper dao = (AcCommandMapper)session.getMapper(AcCommandMapper.class);
				Iterator cmdIterator = cmds.iterator();

				while(cmdIterator.hasNext()) {
					AcCommand cmd = (AcCommand)cmdIterator.next();
					if (cmd.getRetCode() != null) {
						dao.updateByPrimaryKey(cmd);
					}
				}
			}

			session.commit();
		} finally {
			session.close();
		}

	}

	public void saveWarnLog(SysWarnLog log) {
		SqlSession session = MyBatisSessionFactory.getSession();

		try {
			SysWarnLogMapper dao = (SysWarnLogMapper)session.getMapper(SysWarnLogMapper.class);
			dao.insert(log);
			session.commit();
		} finally {
			session.close();
		}

	}

	public ResDevice getDeviceByCode(String deviceCode) {
		ResDevice device = (ResDevice)devices.get(deviceCode);
		if (device == null) {
			SqlSession session = MyBatisSessionFactory.getSession();

			try {
				ResDeviceMapper dao = (ResDeviceMapper)session.getMapper(ResDeviceMapper.class);
				device = dao.selectByCode(deviceCode);
				devices.put(deviceCode, device);
			} finally {
				session.close();
			}
		}

		return device;
	}

}
