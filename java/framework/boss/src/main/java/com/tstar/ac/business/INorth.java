package com.tstar.ac.business;

public interface INorth {

	boolean buildLink(String url);

	void sendMsg(byte[] msg);

	void readMsg();

	void doException(String msg);

	void closeSocekt();

	void close() throws Exception;

	boolean connected();

	RetMsg execute(String cmd) throws Exception;

	RetMsg execute(String cmd, String prompt) throws Exception;

	void open(String url) throws Exception;

}
