package com.tstar.ac.action;

import com.tstar.ac.model.AcAction;
import com.tstar.ac.model.AcCommand;
import com.tstar.ac.service.AcActionService;
import com.tstar.util.BeanHelper;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.StringUtils;

import javax.annotation.Resource;
import java.util.*;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/11 22:15
 */
public class AcActionAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	@Resource
	private AcActionService service;
	private String id;
	private Map<String, String> obj;
	private List<Map<String, Object>> lst;
	private String resNum;
	private String res;
	private int start;
	private int length;
	private int recordsTotal;
	private int recordsFiltered;
	private AcCommand ac;
	private List<AcAction> aclst;

	public AcActionAction() {
	}

	public AcCommand getAc() {
		return this.ac;
	}

	public void setAc(AcCommand ac) {
		this.ac = ac;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getId() {
		return this.id;
	}

	public void setObj(Map<String, String> obj) {
		this.obj = obj;
	}

	public Map<String, String> getObj() {
		return this.obj;
	}

	public void setLst(List<Map<String, Object>> lst) {
		this.lst = lst;
	}

	public List<Map<String, Object>> getLst() {
		return this.lst;
	}

	public void setResNum(String resNum) {
		this.resNum = resNum;
	}

	public String getResNum() {
		return this.resNum;
	}

	public void setRes(String res) {
		this.res = res;
	}

	public String getRes() {
		return this.res;
	}

	public int getRecordsTotal() {
		return this.recordsTotal;
	}

	public int getRecordsFiltered() {
		return this.recordsFiltered;
	}

	public int getStart() {
		return this.start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getLength() {
		return this.length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	public String goToPage() {
		return "showHomePage";
	}

	public String findByPage() {
		Map<String, Object> map = new HashMap();
		if (this.obj != null) {
			if (!StringUtils.isEmpty((String)this.obj.get("status"))) {
				map.put("status", this.obj.get("status"));
			}

			if (!StringUtils.isEmpty((String)this.obj.get("ossKey"))) {
				map.put("ossKey", this.obj.get("ossKey"));
			}

			if (!StringUtils.isEmpty((String)this.obj.get("businessKey"))) {
				map.put("businessKey", Integer.parseInt((String)this.obj.get("businessKey")));
			}

			if (!StringUtils.isEmpty((String)this.obj.get("businessType"))) {
				map.put("businessType", this.obj.get("businessType"));
			}
		}

		this.recordsTotal = this.service.countByCriteria(map);
		this.recordsFiltered = this.recordsTotal;
		map.put("start", this.start);
		map.put("length", this.length);
		this.lst = new ArrayList();
		List<AcAction> items = this.service.selectByPage(map);
		HashMap mapAction;
		if (items != null && items.size() > 0) {
			for(Iterator var4 = items.iterator(); var4.hasNext(); this.lst.add(mapAction)) {
				AcAction item = (AcAction)var4.next();
				mapAction = new HashMap();

				try {
					BeanHelper.bean2map(item, mapAction);
				} catch (Exception var7) {
				}
			}
		}

		return "getRecords";
	}

	public String findCmdsByActId() {
		this.lst = new ArrayList();
		List<AcCommand> items = this.service.selectCmdsByActId(this.id);
		HashMap map;
		if (items != null && items.size() > 0) {
			for(Iterator var3 = items.iterator(); var3.hasNext(); this.lst.add(map)) {
				AcCommand item = (AcCommand)var3.next();
				map = new HashMap();

				try {
					BeanHelper.bean2map(item, map);
				} catch (Exception var6) {
				}

				String cmd = (String)map.get("cmd");
				if (!StringUtils.isEmpty(cmd) && cmd.startsWith("<")) {
					map.put("cmd", StringEscapeUtils.escapeHtml4(cmd));
				}
			}
		}

		return "getRecords";
	}

	public String reset() {
		String[] r = this.service.reset(this.id);
		this.resNum = r[0];
		this.res = r[1];
		return "getRecords";
	}

	public String rerun() {
		String[] r = this.service.rerun(this.id);
		this.resNum = r[0];
		this.res = r[1];
		return "getRecords";
	}

	public List<AcAction> getAclst() {
		return this.aclst;
	}

	public void setAclst(List<AcAction> aclst) {
		this.aclst = aclst;
	}

	public String findByUserId() {
		Map<String, Object> map = new HashMap();
		if (this.obj.get("id") != null && !"".equals(this.obj.get("id"))) {
			if (this.obj.get("id") != null && !"".equals(this.obj.get("id"))) {
				map.put("id", this.obj.get("id"));
			}

			this.recordsTotal = this.service.countByuserId(map);
			this.recordsFiltered = this.recordsTotal;
			map.put("start", this.start);
			map.put("length", this.length);
			this.aclst = this.service.findByUserId(map);
		} else {
			this.aclst = new ArrayList();
		}

		return "getRecords";
	}

	public String updateCommand() {
		String[] r = this.service.updateCommand(this.ac);
		this.resNum = r[0];
		this.res = r[1];
		return "getRecords";
	}

}
