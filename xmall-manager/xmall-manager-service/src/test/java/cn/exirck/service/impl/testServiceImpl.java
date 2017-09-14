package cn.exirck.service.impl;

import cn.exrick.mapper.TbItemDescMapper;
import cn.exrick.mapper.TbItemMapper;
import cn.exrick.mapper.TbMemberMapper;
import cn.exrick.pojo.TbItemDesc;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Date;

public class testServiceImpl {
    private ApplicationContext applicationContext;
    @Before
    public void init(){
        applicationContext=new
                ClassPathXmlApplicationContext("classpath:spring/applicationContext-dao.xml");
    }
    @Test
    public void testGetItemList(){
        TbItemMapper itemMapper=applicationContext.getBean(TbItemMapper.class);
        itemMapper.selectItemByCondition(650, "","created","desc");
    }

    @Test
    public void testAddItem(){
        TbItemDescMapper tbItemDescMapper=applicationContext.getBean(TbItemDescMapper.class);
        TbItemDesc tbItemDesc=new TbItemDesc();
        tbItemDesc.setItemId((long) 123456);
        tbItemDesc.setItemDesc("test");
        tbItemDesc.setCreated(new Date());
        tbItemDesc.setUpdated(new Date());
        tbItemDescMapper.insert(tbItemDesc);
    }
}
