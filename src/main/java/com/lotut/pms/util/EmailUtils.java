package com.lotut.pms.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

public class EmailUtils {  
    
    private static final String FROM = "lotut123@163.com";  
  
    /** 
     * 发送重设密码链接的邮件 
     */  
    public static void sendResetPasswordEmail() {  
        Session session = getSession();  
        MimeMessage message = new MimeMessage(session);  
        try {  
            message.setSubject("找回您的帐户与密码");  
            message.setSentDate(new Date());  
            message.setFrom(new InternetAddress(FROM));  
           // message.setRecipient(RecipientType.TO, new InternetAddress(user.getEmail()));
            message.setRecipient(RecipientType.TO, new InternetAddress("306203478@qq.com"));
            message.setContent("新密码asdf","text/html;charset=utf-8");  
            // 发送邮件  
            Transport.send(message);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    }  
      
    public static Session getSession() {  
        Properties props = new Properties();  
        props.setProperty("mail.transport.protocol", "smtp");  
        props.setProperty("mail.smtp.host", "smtp.163.com");  
        props.setProperty("mail.smtp.port", "25");  
        props.setProperty("mail.smtp.auth", "true");  
        Session session = Session.getInstance(props, new Authenticator() {  
            @Override  
            protected PasswordAuthentication getPasswordAuthentication() {  
                String password = "lotut123";  
            
                return new PasswordAuthentication(FROM, password);  
            }  
              
        });  
        return session;  
    }  
    public static void main(String[] args) {
    	sendResetPasswordEmail();
	}
    
}