package org.jgs1905.utils;

import java.util.Date;
import java.util.Properties;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * 	java发送电子邮件工具类
 * @author junki
 * @date 2020年6月23日
 */
public class MailUtil {

	// 发件人地址
	private static String senderAddress = "3225724560@qq.com";
	// 发件人账户名
	private static String senderAccount = "3225724560@qq.com";
	// 发件人smtp服务器授权码
	private static String senderPassword = "svuhototbkqzchii";

	public static void send(String recipientAddress, String title, String content) throws Exception {
		// 1、连接邮件服务器的参数配置
		Properties props = new Properties();
		// 设置用户的认证方式
		props.setProperty("mail.smtp.auth", "true");
		// 设置传输协议
		props.setProperty("mail.transport.protocol", "smtp");
		// 设置发件人的SMTP服务器地址
		props.setProperty("mail.smtp.host", "smtp.qq.com");
		
		// 2、获取一个邮件会话实例
		Session session = Session.getInstance(props);
		// 设置调试信息在控制台打印出来
		session.setDebug(true);
		
		// 3、创建邮件的实例对象
		// 创建一封邮件的实例对象
		MimeMessage msg = new MimeMessage(session);
		
		// 设置发件人地址
		msg.setFrom(new InternetAddress(senderAddress));
		
		/*
		  * 设置收件人地址（可以增加多个收件人、抄送、密送），即下面这一行代码书写多行 
		 * MimeMessage.RecipientType.TO：发送
		 * MimeMessage.RecipientType.CC：抄送 
		 * MimeMessage.RecipientType.BCC：密送
		 */
		msg.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(recipientAddress));
		
		// 设置邮件主题
		msg.setSubject(title, "UTF-8");
		// 设置邮件正文
		msg.setContent(content, "text/html;charset=UTF-8");
		// 设置邮件的发送时间,默认立即发送
		msg.setSentDate(new Date());
		
		// 4、根据session对象获取邮件传输对象Transport
		Transport transport = session.getTransport();
		// 设置发件人的账户名和密码
		transport.connect(senderAccount, senderPassword);
		// 发送邮件，并发送到所有收件人地址，message.getAllRecipients() 获取到的是在创建邮件对象时添加的所有收件人, 抄送人, 密送人
		transport.sendMessage(msg, msg.getAllRecipients());

		// 5、关闭邮件连接
		transport.close();
	}

}
