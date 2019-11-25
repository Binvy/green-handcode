package com.binvi.common;

import org.apache.logging.log4j.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.time.LocalDate;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/5/11 17:52
 */
public class Log4j2Test {

    private static final Logger logger = LogManager.getLogger(Log4j2Test.class);
    private static final Logger LOGGER = LogManager.getLogger(Log4j2Test.class.getName());
    private static final Logger log = LogManager.getLogger();

    public static void main(String[] args) {
        System.out.println("=================LogManager.getLogger(Log4j2Test.class)===================");
        log(logger);
        System.out.println("=================LogManager.getLogger(Log4j2Test.class.getName())====================");
        log(LOGGER);
        System.out.println("=================LogManager.getLogger()===================");
        log(log);
    }

    static void log(Logger log) {
        String name = "binvi";
        LocalDate now = LocalDate.now();

        logger.trace("Entering application.");
        logger.info("Entering application.");
        logger.debug("Entering application.");
        logger.warn("Entering application.");
        logger.error("Entering application.");
        logger.fatal("Entering application.");
        logger.printf(Level.INFO, "Logging in user %s at %s", name, now);
        logger.printf(Level.INFO, "Logging in user %1$s at %2$tm %2$te, %2$tY", name, now);

        if (logger.isInfoEnabled()) {
            logger.info("Log4j2 test. name: {}, date: {}", name, now);
        }
        logger.info("Integer.MAX_VALUE = {}", Integer.MAX_VALUE);
        logger.info("Logging in user {} at {}", name, now);
        logger.info("Log4j2 test: {}", () -> expensiveOperation());

    }

    static String expensiveOperation() {
        return "expensiveOperation";
    }

}
