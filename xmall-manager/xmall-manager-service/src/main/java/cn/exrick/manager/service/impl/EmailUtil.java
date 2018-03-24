package cn.exrick.manager.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author Exrickx
 */
@Component
public class EmailUtil {

    private final static Logger log= LoggerFactory.getLogger(EmailUtil.class);

    @Value("${EMAIL_HOST}")
    private String EMAIL_HOST;

    @Value("${EMAIL_USERNAME}")
    private String EMAIL_USERNAME;

    @Value("${EMAIL_PASSWORD}")
    private String EMAIL_PASSWORD;

    @Value("${EMAIL_SENDER}")
    private String EMAIL_SENDER;

    @Async
    public void sendEmailPayResult(String sendTo,String title,String content){

        JavaMailSenderImpl senderImpl = new JavaMailSenderImpl();

        //设定邮箱服务器配置
        senderImpl.setHost(EMAIL_HOST);
        senderImpl.setUsername(EMAIL_USERNAME);
        senderImpl.setPassword(EMAIL_PASSWORD);
        Properties prop = new Properties();
        //服务器进行认证
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.timeout", "20000");
        //qq邮箱需开启
        prop.put("mail.smtp.ssl.enable", "true");
        senderImpl.setJavaMailProperties(prop);

        //发送html邮件
        MimeMessage mailMessage = senderImpl.createMimeMessage();
        MimeMessageHelper messageHelper = null;
        //设置邮件内容
        try {
            messageHelper = new MimeMessageHelper(mailMessage,true,"utf-8");

            messageHelper.setTo(sendTo);
            messageHelper.setFrom(EMAIL_SENDER);
            messageHelper.setSubject(title);
            // true表示HTML格式的邮件
            messageHelper.setText(content, true);

        } catch (MessagingException e) {
            e.printStackTrace();
        }

        // 发送邮件
        senderImpl.send(mailMessage);

        log.info("给 "+sendTo+" 的审核结果邮件发送成功");
    }

    /**
     * 验证邮箱
     *
     * @param email
     * @return
     */
    public static boolean checkEmail(String email) {
        boolean flag = false;
        try {
            String check = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
            Pattern regex = Pattern.compile(check);
            Matcher matcher = regex.matcher(email);
            flag = matcher.matches();
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }
}
