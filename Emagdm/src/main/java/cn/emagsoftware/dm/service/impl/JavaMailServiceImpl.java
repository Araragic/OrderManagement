package cn.emagsoftware.dm.service.impl;

import java.io.IOException;
import java.security.SecureRandom;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Store;
import javax.net.ssl.KeyManager;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;


import cn.emagsoftware.dm.service.JavaMailService;

@Service

public class JavaMailServiceImpl  implements JavaMailService {


	Logger log=Logger.getLogger(JavaMailServiceImpl.class);

	private Session session = null;
	private Store store = null;
	private JavaMailSenderImpl mailSender;
	
	
	@Autowired
	private  UserServiceImpl userServiceImpl;
	
	public boolean run(String userName, String password){
		
		log.info("开始验证邮箱:"+userName+"@emagsoftware.cn");
		boolean isConnect = false;
		try {
			session = connect(userName, password);
			store = session.getStore("pop3");
			store.connect();
			isConnect = store.isConnected();
		} catch (Exception e) {
			log.error("密码错误");
		}
			log.info("邮箱验证正确");	
		return isConnect;
		
	}

	public  void setUserServiceImpl(UserServiceImpl userServiceImpl) {
		this.userServiceImpl = userServiceImpl;
	}

	public boolean checkMail(String userName, String password) {
		log.info("开始验证邮箱:"+userName+"@emagsoftware.cn");
		boolean isConnect = false;
		try {
			session = connect(userName, password);
			store = session.getStore("pop3");
			store.connect();
			isConnect = store.isConnected();
		} catch (Exception e) {
			log.error("密码错误");
		}
			log.info("邮箱验证正确");	
		return isConnect;
	}

	public void sendEveryWeek() {
		// TODO Auto-generated catch block 
		//按月 按周发送
//		log.info("调取到按周发送报表");
//		List<User> users = userServiceImpl.getUserList();
//		try {
//			mailSender = new JavaMailSenderImpl();
//			mailSender.setHost("mail.emagsoftware.cn");
//			Properties properties = new Properties();
//			properties.setProperty("mail.smtp.auth", "false");
//			properties.put("mail.smtp.localhost", "emagsoftware.cn");
//			mailSender.setJavaMailProperties(properties);
//			MimeMessage msg = mailSender.createMimeMessage();
//			MimeMessageHelper helper = new MimeMessageHelper(msg, true);
//			helper.setFrom("fuyingkuo@emagsoftware.cn");
//			for (User user : users) {
//				System.out.println(user.getUsername());
//				获取到用户 然后发送邮件
//				String addressTo = user.getUsername() + "@emagsoftware.cn";
//				helper.setTo(addressTo);
//				helper.setSubject("主题");
//				helper.setText("内容");
//				// 发送邮件
//				mailSender.send(msg);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		System.out.println("调取到了sendToAll 方法  结束了....");
	}
	
	
	public void sendEveryMonth(){
		//TODO
	}

	public Session connect(String userName, String password) {
		Properties p = new Properties();
		p.put("mail.pop3.host", "mail.emagsoftware.cn");
		p.put("mail.pop3.starttls.enable", "true");
		p.setProperty("mail.pop3.timeout", "3500");
		
		try {
			p.put("mail.pop3.socketFactory", getSSLContext().getSocketFactory());
		} catch (IOException e) {
			e.printStackTrace();
		}
		p.put("mail.pop3.auth", "true");
		Session session = Session.getInstance(p, new MyAuthenticator(userName,
				password));
		return session;
	}

	private static SSLContext getSSLContext() throws IOException {
		try {
			SSLContext ctx = SSLContext.getInstance("TLS");
			ctx.init(new KeyManager[0],
					new TrustManager[] { new DefaultTrustManager()},
					new SecureRandom());
			return ctx;
		} catch (Exception e) {
			throw new IOException(e);
		}
	}

	private static class DefaultTrustManager implements X509TrustManager {
		public X509Certificate[] getAcceptedIssuers() {
			return null;
		}

		public void checkClientTrusted(X509Certificate[] arg0, String arg1)
				throws CertificateException {
		}
		public void checkServerTrusted(X509Certificate[] arg0, String arg1)
				throws CertificateException {
		}

	}

	private static class MyAuthenticator extends Authenticator {
		String userName = null;
		String password = null;

		public MyAuthenticator(String username, String password) {
			this.userName = username;
			this.password = password;
		}

		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(userName, password);
		}
	}

}
