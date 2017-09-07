package cn.exirck.service.impl;

import cn.exrick.mapper.TbItemMapper;
import cn.exrick.mapper.TbMemberMapper;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class testServiceImpl {
    @Test
    public void testGetItemList(){
        //初始化spring容器
        ApplicationContext applicationContext=new
                ClassPathXmlApplicationContext("classpath:spring/applicationContext-dao.xml");
        TbItemMapper itemMapper=applicationContext.getBean(TbItemMapper.class);
        itemMapper.selectItemByCondition(650, "","created","desc");
    }
}
