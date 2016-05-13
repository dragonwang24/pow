package com.pow.log;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 日志服务
 * 
 * @author wanghl
 */
public class LoggerService {
	
	public static Logger getTraceLogger(Class<?>clazz){
		return LoggerFactory.getLogger(clazz);
	}
}
