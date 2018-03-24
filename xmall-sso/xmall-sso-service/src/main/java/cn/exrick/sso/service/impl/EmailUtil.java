package cn.exrick.sso.service.impl;

import cn.exrick.manager.pojo.TbThanks;
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

    @Value("${SERVER_URL}")
    private String SERVER_URL;

    @Async
    public void sendEmailDealThank(String sendTo,String title,String tokenName,String token,TbThanks tbThanks){

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
            String content="尊敬的管理员Exrick您好，您收到了来自"+title+"确认订单，请您及时处理：<br>";
            content+="-------------------------------------<br>";
            content+="登录账号："+tbThanks.getUsername()+"<br>";
            content+="用户昵称："+tbThanks.getNickName()+"<br>";
            content+="捐赠金额："+tbThanks.getMoney()+"<br>";
            content+="支付方式："+tbThanks.getPayType()+"<br>";
            content+="留言："+tbThanks.getInfo()+"<br>";
            content+="通知邮箱："+tbThanks.getEmail()+"<br>";
            content+="订单ID："+tbThanks.getOrderId()+"<br>";
            content+="支付时间："+tbThanks.getTime()+"<br>";
            content+="-------------------------------------<br>";
            content+="请点击以下相应链接完成对应处理操作：<br><br>";

            String passUrl=SERVER_URL+"/pay/pass?tokenName="+tokenName+"&token="+token+"&id="+tbThanks.getId();
            content+="审核通过并展示捐赠数据：<br><a href='"+passUrl+"'>"+passUrl+"</a><br><br>";

            String backUrl=SERVER_URL+"/pay/back?tokenName="+tokenName+"&token="+token+"&id="+tbThanks.getId();
            content+="审核驳回：<br><a href='"+backUrl+"'>"+backUrl+"</a><br><br>";

            String notShowUrl=SERVER_URL+"/pay/passNotShow?tokenName="+tokenName+"&token="+token+"&id="+tbThanks.getId();
            content+="审核通过但不展示捐赠数据：<br><a href='"+notShowUrl+"'>"+notShowUrl+"</a><br><br>";

            String editUrl=SERVER_URL+"/pay-edit?tokenName="+tokenName+"&token="+token+"&id="+tbThanks.getId();
            content+="编辑捐赠数据：<br><a href='"+editUrl+"'>"+editUrl+"</a><br><br>";
            System.out.println(editUrl);

            String delUrl=SERVER_URL+"/pay/del?tokenName="+tokenName+"&token="+token+"&id="+tbThanks.getId();
            content+="删除该捐赠数据：<br><a href='"+delUrl+"'>"+delUrl+"</a><br><br>";

            messageHelper.setText(content, true);

        } catch (MessagingException e) {
            e.printStackTrace();
        }

        // 发送邮件
        senderImpl.send(mailMessage);

        log.info("用户："+tbThanks.getUsername()+" 支付:"+tbThanks.getMoney()+"元 待审核的邮件发送成功");
    }
}
