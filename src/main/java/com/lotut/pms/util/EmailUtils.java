package com.lotut.pms.util;

import java.util.Date;
import java.util.Properties;
import java.util.Random;

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
    public static void sendResetPasswordEmail(String toEmail,String newPassword) {  
        Session session = getSession();  
        MimeMessage message = new MimeMessage(session);  
        try {  
            message.setSubject("找回您的帐户与密码");  
            message.setSentDate(new Date());  
            message.setFrom(new InternetAddress(FROM));  
           // message.setRecipient(RecipientType.TO, new InternetAddress(user.getEmail()));
            message.setRecipient(RecipientType.TO, new InternetAddress(toEmail));
            message.setContent("新密码:"+newPassword,"text/html;charset=utf-8");  
            // 发送邮件  
            Transport.send(message);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    }  
    
    public static String roundPassword(int length){
    	String val = "";
    	  Random random = new Random();
    	  for (int i = 0; i < length; i++) {
    	   // 输出字母还是数字
    	   String charOrNum = random.nextInt(2) % 2 == 0 ? "char" : "num"; 
    	   // 字符串
    	   if ("char".equalsIgnoreCase(charOrNum)) {
    	    // 取得大写字母还是小写字母
    	    int choice = random.nextInt(2) % 2 == 0 ? 65 : 97; 
    	    val += (char) (choice + random.nextInt(26));
    	   } else if ("num".equalsIgnoreCase(charOrNum)) { // 数字
    	    val += String.valueOf(random.nextInt(10));
    	   }
    	  }
    	  return val;
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
//    public static void main(String[] args) {
//    	sendResetPasswordEmail("306203478@qq.com");
//	}
    
}