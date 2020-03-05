package com.tstar.ac.business;

import com.tstar.ac.model.AcCommand;
import com.tstar.util.ExceptionUtil;
import com.tstar.util.FileHelper;
import com.tstar.util.RegExp;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import java.io.File;
import java.io.FileInputStream;
import java.util.*;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/11 23:27
 */
public class CmdProfile {

	private static final String CONFIG_PATH = "config/commands.xml";
	private static final String FILE_FLAG = "file:";
	private static final String NODE_CTRL_SET = "ctrl-set";
	private static final String NODE_COMMANDS = "commands";
	private static final String NODE_COMMAND = "command";
	private static final String ATTR_ID = "id";
	private static final String ATTR_PROMPT = "prompt";
	private static final String ATTR_INDEX = "index";
	private static final String ATTR_KEY = "key";
	private static final String CMD_LOGIN = "login";
	private static final String CMD_LOGOUT = "logout";
	private static Map<String, Map<String, List<AcCommand>>> ctrlSets = null;

	public CmdProfile() {
	}

	private static void load() throws Exception {
		File file = new File("config/commands.xml");
		if (!file.exists()) {
			throw new Exception("config/commands.xml does not exists.");
		} else {
			ctrlSets = new HashMap();
			FileInputStream fis = new FileInputStream(file);
			SAXReader saxReader = new SAXReader();
			Document document = saxReader.read(fis);
			Element root = document.getRootElement();
			List<Element> ctrlSetNodes = root.elements("ctrl-set");
			Iterator ctrlSetIterator = ctrlSetNodes.iterator();

			while(ctrlSetIterator.hasNext()) {
				Element ctrlSetNode = (Element)ctrlSetIterator.next();
				String setId = ctrlSetNode.attributeValue("id");
				Map<String, List<AcCommand>> ctrlSet = new HashMap();
				ctrlSets.put(setId, ctrlSet);
				List<Element> cmdsNodes = ctrlSetNode.elements("commands");
				Iterator cmdsNodeIterator = cmdsNodes.iterator();

				while(cmdsNodeIterator.hasNext()) {
					Element cmdsNode = (Element)cmdsNodeIterator.next();
					String cmdsId = cmdsNode.attributeValue("id");
					List<AcCommand> cmds = new ArrayList();
					ctrlSet.put(cmdsId, cmds);
					List<Element> cmdNodes = cmdsNode.elements("command");

					AcCommand cmd;
					for(Iterator cmdNodeIterator = cmdNodes.iterator(); cmdNodeIterator.hasNext(); cmds.add(cmd)) {
						Element cmdNode = (Element)cmdNodeIterator.next();
						cmd = new AcCommand();

						try {
							cmd.setCmdOrder(Integer.parseInt(cmdNode.attributeValue("index")));
						} catch (Exception e) {
							cmd.setCmdOrder(1);
						}

						try {
							cmd.setKeyFlag(Integer.parseInt(cmdNode.attributeValue("key")));
						} catch (Exception e) {
							cmd.setKeyFlag(1);
						}

						try {
							cmd.setCmdPrompt(cmdNode.attributeValue("prompt"));
						} catch (Exception e) {
							cmd.setCmdPrompt("");
						}

						String text = cmdNode.getText().trim();
						if (text.startsWith("file:")) {
							String fileName = "config/" + text.substring("file:".length());
							String content = FileHelper.readTxtFile(fileName);
							cmd.setCmd(content);
						} else {
							cmd.setCmd(text);
						}
					}

					Collections.sort(cmds, new SortCmd());
				}
			}

		}
	}

	public static List<AcCommand> getCmds(String ctrlSetId, String cmdsId, Map<String, Object> variables) {
		if (ctrlSets == null) {
			try {
				load();
				if (ctrlSets == null) {
					return null;
				}
			} catch (Exception e) {
				System.out.println(ExceptionUtil.getStackTrace(e));
			}
		}

		Map<String, List<AcCommand>> ctrlSet = (Map)ctrlSets.get(ctrlSetId);
		if (ctrlSet == null) {
			return null;
		} else {
			List<AcCommand> cmds = (List)ctrlSet.get(cmdsId);
			if (cmds != null && cmds.size() != 0) {
				List<AcCommand> loginCmds = (List)ctrlSet.get("login");
				List<AcCommand> logoutCmds = (List)ctrlSet.get("logout");
				List<AcCommand> allCmds = new ArrayList();
				if (loginCmds != null && loginCmds.size() > 0) {
					allCmds.addAll(loginCmds);
				}

				allCmds.addAll(cmds);
				if (logoutCmds != null && logoutCmds.size() > 0) {
					allCmds.addAll(logoutCmds);
				}

				List<AcCommand> resCmds = new ArrayList();
				Iterator allCmdIterator = allCmds.iterator();

				while(allCmdIterator.hasNext()) {
					AcCommand cmd = (AcCommand)allCmdIterator.next();
					AcCommand resCmd = new AcCommand();
					resCmd.setCmdOrder(cmd.getCmdOrder());
					resCmd.setKeyFlag(cmd.getKeyFlag());
					resCmd.setCmdPrompt(cmd.getCmdPrompt());
					String text = cmd.getCmd();
					if (variables != null) {
						String[] variableNames = RegExp.findVariables(text);
						if (variableNames != null && variableNames.length > 0) {
							String[] variableNamesTmp = variableNames;
							int length = variableNames.length;

							for(int i = 0; i < length; ++i) {
								String name = variableNamesTmp[i];
								String value = "seq".equals(name) ? "" + (int)(1.0D + Math.random() * 100000.0D) : (variables.get(name) == null ? "" : variables.get(name).toString());
								if (value != null) {
									text = text.replace("#{" + name + "}", value);
								}
							}
						}
					}

					resCmd.setCmd(text);
					resCmds.add(resCmd);
				}

				return resCmds;
			} else {
				return null;
			}
		}
	}

	public static void main(String[] args) throws Exception {
		Map<String, Object> variables = new HashMap();
		variables.put("businessKey", "24190");
		variables.put("name", "bss");
		variables.put("password", "123456");
		List<AcCommand> lst = getCmds("ZTE", "login", variables);
		Iterator iterator = lst.iterator();

		while(iterator.hasNext()) {
			AcCommand cmd = (AcCommand)iterator.next();
			System.out.println(cmd.getCmd());
		}

	}

}
