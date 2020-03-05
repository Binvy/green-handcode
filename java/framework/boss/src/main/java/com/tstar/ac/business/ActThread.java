package com.tstar.ac.business;

import com.tstar.ac.model.AcAction;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/11 23:02
 */
public class ActThread extends Thread {

	public static final Logger logger = LogManager.getLogger(ActThread.class);

	private static final long SLEEP_DURATION = 2000L;

	public ActThread() {
	}

	private void suspend(long duration) {
		try {
			Thread.sleep(duration);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}

	}

	public void run() {
		AcBus bus = new AcBus();

		while(true) {
			AcAction act = bus.getTopAction(1);
			if (act != null) {
				logger.info("Getting top action, act.id=" + act.getId());

				try {
					bus.exeAction(act);
				} catch (Exception e) {
					logger.error(e.getMessage(), e);
				}
			}

			this.suspend(2000L);
		}
	}

}
