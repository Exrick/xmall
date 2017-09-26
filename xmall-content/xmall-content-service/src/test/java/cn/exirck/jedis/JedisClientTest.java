package cn.exirck.jedis;

import cn.exrick.common.jedis.JedisClient;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class JedisClientTest {

    private JedisClient jedisClient;

    @Before
    public void before(){
        ApplicationContext applicationContext=new ClassPathXmlApplicationContext("classpath:spring/applicationContext-redis.xml");
        jedisClient=applicationContext.getBean(JedisClient.class);
    }

    @Test
    public void testJedisClient() throws Exception{
        //从容器中获得JedisClient对象
        jedisClient.set("mytest", "jedisClient");
        String string = jedisClient.get("mytest");
        System.out.println(string);
    }
}
