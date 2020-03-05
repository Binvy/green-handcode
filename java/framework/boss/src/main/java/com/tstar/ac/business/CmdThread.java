package com.tstar.ac.business;

import com.tstar.ac.model.AcAction;
import com.tstar.ac.model.AcCommand;
import com.tstar.portal.model.SysWarnLog;
import com.tstar.res.model.ResDevice;
import com.tstar.util.DateUtil;
import com.tstar.util.UUID;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/12 22:00
 */
public class CmdThread extends Thread {

	private static final Logger logger = LogManager.getLogger(CmdThread.class);

	private static final long SLEEP_DURATION = 2000L;
	private boolean isLink = false;
	private String NEField = "";

	public CmdThread() {
	}

	private void suspend(long duration) {
		try {
			Thread.sleep(duration);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}

	}

	private INorth getExecutor(ResDevice device, String ctrlSetName) throws Exception {
		String className = "com.tstar.ac.business." + ctrlSetName;
		return (INorth)Class.forName(className).newInstance();
	}

	public void run() {
		AcBus bus = new AcBus();
		HashMap warns = new HashMap();

		while(true) {
			AcAction action;
			List cmds;
			int size;
			INorth executor;
			while(true) {
				ResDevice device;
				label186:
				while(true) {
					while(true) {
						do {
							this.suspend(2000L);
							action = bus.getTopRunnableAction();
						} while(action == null);

						logger.info("Top executing action got, id=" + action.getId() + ", businessKey=" + action.getBusinessKey() + ", ossKey=" + action.getOssKey());
						cmds = bus.getCmdsByAct(action.getId());
						if (cmds != null && cmds.size() != 0) {
							size = cmds.size();
							logger.info("Commands.count=" + size);
							device = bus.getDeviceByCode(((AcCommand)cmds.get(0)).getDeviceCode());
							executor = null;

							try {
								executor = this.getExecutor(device, ((AcCommand)cmds.get(0)).getCtrlSetName());
								break label186;
							} catch (Exception e) {
								logger.error("Unknown error: ", e);
							}
						} else {
							action.setStatus(91);
							bus.updateAction(action);
						}
					}
				}

				try {
					logger.info("Connecting " + device.getCtrlIp());
					if (executor.buildLink(device.getCtrlIp())) {
						this.isLink = true;
					}
					break;
				} catch (Exception var29) {
					action.setStatus(98);
					action.setRetry(1 + action.getRetry());
					bus.saveCmds(action, (List)null);
					String warnKey = DateUtil.formatDate(new Date()) + device.getCtrlIp();
					String warnMsg = (String)warns.get(warnKey);
					if (StringUtils.isEmpty(warnMsg)) {
						SysWarnLog warnLog = new SysWarnLog();
						warnLog.setId(UUID.get());
						warnLog.setWarnModule("自动控制");
						warnLog.setWarnLevel("ERROR");
						warnLog.setWarnMsg("无法连接服务器：" + device.getCtrlIp());
						warnLog.setWarnTime(new Date());
						warnLog.setStatus(0);
						bus.saveWarnLog(warnLog);
						warns.put(warnKey, warnLog.getWarnMsg());
					}

					logger.error("Fail to connect to " + device.getCtrlIp());
				}
			}

			try {
				boolean success = true;
				StringBuffer contend = new StringBuffer();
				contend.append("90000:1=").append("\"");
				contend.append("alarm").append("\"");
				contend.append(",2=").append("\"");
				contend.append("ab").append("\"");
				contend.append(";");
				System.out.println(contend.toString());
				if (!this.isLink) {
					System.out.println("与接口机链路不正常,请先连接接口机");
					return;
				}

				MsgHead msgHead = new MsgHead();
				byte[] neID = (byte[])null;
				byte[] mml = (byte[])null;

				try {
					for(int i = 0; i < size; ++i) {
						AcCommand cmd = (AcCommand)cmds.get(i);
						logger.info("Command: " + cmd.getCmd());
						String[] infos = cmd.getCmd().split(":");
						if (infos[0].equals("90000")) {
							this.NEField = "0";
						} else {
							this.NEField = "1";
						}

						neID = this.NEField.getBytes();
						mml = cmd.getCmd().getBytes("GB2312");
						System.arraycopy(neID, 0, msgHead.m_baNEID, 0, neID.length);
						msgHead.mml = mml;
						executor.sendMsg(msgHead.toArray());
						executor.readMsg();
					}
				} catch (Exception var30) {
				}

				if (success) {
					action.setStatus(9);
				} else {
					action.setStatus(99);
				}

				bus.saveCmds(action, cmds);
			} catch (Exception e) {
				action.setStatus(98);
				action.setRetry(1 + action.getRetry());
				bus.saveCmds(action, (List)null);
				logger.error(e.getMessage(), e);
			} finally {
				try {
					executor.closeSocekt();
				} catch (Exception e) {
				}

			}
		}
	}

}
