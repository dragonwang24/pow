package com.pow.utils;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * Spring Bean帮助类
 * 
 * @author wanghl
 *
 */
public class SpringBeanUtils implements ApplicationContextAware {
	
	private static ApplicationContext applicationContext = null;
	
	@SuppressWarnings("unchecked")
	public static <T> T getBean(String beanID){
		return (T)applicationContext.getBean(beanID);
	}
	
	public static <T> T getBean(Class<T> cls){
		return applicationContext.getBean(cls);
	}

	public void setApplicationContext(ApplicationContext appContext) throws BeansException {
		applicationContext = appContext;
	}
	
}

