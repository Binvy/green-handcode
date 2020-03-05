package com.tstar.ac.business;

import com.tstar.ac.model.AcCommand;

import java.util.Comparator;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/11 23:43
 */
public class SortCmd implements Comparator {
	public SortCmd() {
	}

	public int compare(Object o1, Object o2) {
		AcCommand cmd1 = (AcCommand)o1;
		AcCommand cmd2 = (AcCommand)o2;
		if (cmd1.getCmdOrder() == cmd2.getCmdOrder()) {
			return 0;
		} else {
			return cmd1.getCmdOrder() > cmd2.getCmdOrder() ? 1 : -1;
		}
	}
}