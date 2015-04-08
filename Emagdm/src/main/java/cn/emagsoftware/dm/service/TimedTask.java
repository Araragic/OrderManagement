package cn.emagsoftware.dm.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import cn.emagsoftware.dm.service.impl.JavaMailServiceImpl;

@Component
public class TimedTask {

	public  Logger log = Logger.getLogger(TimedTask.class);
	
	@Autowired
	private JavaMailServiceImpl javaMailServiceImpl = new JavaMailServiceImpl();
	
	
	@Scheduled(cron="0 * *  * * ? ") 
	public void sendEveryWeek() {
		// TODO Auto-generated catch block
//		javaMailServiceImpl.sendEveryWeek();
//		System.out.println("开始开始开始开始开始周周周周周周周周周周周周周周周");
	}
	@Scheduled(cron="0 * *  * * ? ") 
	public void sendEveryMonth(){
		// TODO Auto-generated catch block
//		javaMailServiceImpl.sendEveryMonth();
//	System.out.println("开始开始开始开始开始月月月月月月月月月月月月月月月");
	}

}
