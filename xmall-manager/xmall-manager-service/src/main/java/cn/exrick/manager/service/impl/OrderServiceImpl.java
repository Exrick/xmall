package cn.exrick.manager.service.impl;

import cn.exrick.common.exception.XmallException;
import cn.exrick.common.jedis.JedisClient;
import cn.exrick.common.pojo.DataTablesResult;
import cn.exrick.manager.mapper.TbOrderItemMapper;
import cn.exrick.manager.mapper.TbOrderMapper;
import cn.exrick.manager.mapper.TbOrderShippingMapper;
import cn.exrick.manager.mapper.TbThanksMapper;
import cn.exrick.manager.pojo.*;
import cn.exrick.manager.service.OrderService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author Exrickx
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private TbOrderMapper tbOrderMapper;
    @Autowired
    private TbOrderItemMapper tbOrderItemMapper;
    @Autowired
    private TbOrderShippingMapper tbOrderShippingMapper;
    @Autowired
    private TbThanksMapper tbThanksMapper;

    @Autowired
    private JedisClient jedisClient;

    @Autowired
    private EmailUtil emailUtil;

    @Override
    public DataTablesResult getOrderList() {

        DataTablesResult result=new DataTablesResult();
        TbOrderExample example=new TbOrderExample();
        List<TbOrder> list=tbOrderMapper.selectByExample(example);
        if(list==null){
            throw new XmallException("获取订单列表失败");
        }
        result.setSuccess(true);
        result.setData(list);
        return result;
    }

    @Override
    public Long countOrder() {

        TbOrderExample example=new TbOrderExample();
        Long result=tbOrderMapper.countByExample(example);
        if(result==null){
            throw new XmallException("统计订单数目失败");
        }
        return result;
    }

    @Override
    public int deleteOrder(String id) {

        if(tbOrderMapper.deleteByPrimaryKey(id)!=1){
            throw new XmallException("删除订单数失败");
        }

        TbOrderItemExample example=new TbOrderItemExample();
        TbOrderItemExample.Criteria criteria= example.createCriteria();
        criteria.andOrderIdEqualTo(id);
        List<TbOrderItem> list =tbOrderItemMapper.selectByExample(example);
        for(TbOrderItem tbOrderItem:list){
            if(tbOrderItemMapper.deleteByPrimaryKey(tbOrderItem.getId())!=1){
                throw new XmallException("删除订单商品失败");
            }
        }

        if(tbOrderShippingMapper.deleteByPrimaryKey(id)!=1){
            throw new XmallException("删除物流失败");
        }
        return 1;
    }

    @Override
    public int cancelOrder() {

        TbOrderExample example=new TbOrderExample();
        List<TbOrder> list=tbOrderMapper.selectByExample(example);
        for(TbOrder tbOrder:list){
            judgeOrder(tbOrder);
        }
        return 1;
    }

    /**
     * 判断订单是否超时未支付
     */
    public String judgeOrder(TbOrder tbOrder){

        String result=null;
        if(tbOrder.getStatus()==0){
            //判断是否已超1天
            long diff=System.currentTimeMillis()-tbOrder.getCreateTime().getTime();
            long days = diff / (1000 * 60 * 60 * 24);
            if(days>=1){
                //设置失效
                tbOrder.setStatus(5);
                tbOrder.setCloseTime(new Date());
                if(tbOrderMapper.updateByPrimaryKey(tbOrder)!=1){
                    throw new XmallException("设置订单关闭失败");
                }
            }else {
                //返回到期时间
                long time=tbOrder.getCreateTime().getTime()+1000 * 60 * 60 * 24;
                result= String.valueOf(time);
            }
        }
        return result;
    }

    @Override
    public int passPay(String tokenName, String token, String id) {

        //验证token
        if(StringUtils.isBlank(tokenName)||StringUtils.isBlank(tokenName)||StringUtils.isBlank(id)){
            return -1;
        }
        String value=jedisClient.get(tokenName);
        if(!value.equals(token)){
            return -1;
        }
        //展示捐赠
        TbThanks tbThanks=tbThanksMapper.selectByPrimaryKey(Integer.valueOf(id));
        if(tbThanks==null){
            return 0;
        }
        tbThanks.setState(1);
        if(tbThanksMapper.updateByPrimaryKey(tbThanks)!=1){
            return 0;
        }
        //修改订单状态
        TbOrder tbOrder=tbOrderMapper.selectByPrimaryKey(tbThanks.getOrderId());
        if(tbOrder!=null){
            tbOrder.setStatus(4);
            tbOrder.setEndTime(new Date());
            tbOrder.setUpdateTime(new Date());
            if(tbOrderMapper.updateByPrimaryKey(tbOrder)!=1){
                return 0;
            }
        }
        //发送通知邮箱
        if(StringUtils.isNotBlank(tbThanks.getEmail())&&EmailUtil.checkEmail(tbThanks.getEmail())){
            String content="您的订单已支付成功，十分感谢您的捐赠！<br>您可以在捐赠名单中查看到您的数据：" +
                    "<a href='http://xmall.exrick.cn/#/thanks'>http://xmall.exrick.cn/#/thanks</a><br>Powered By XPay. Exrick Present.";
            emailUtil.sendEmailPayResult(tbThanks.getEmail(),"【XMall商城】支付捐赠成功通知",content);
        }
        return 1;
    }

    @Override
    public int backPay(String tokenName, String token, String id) {

        //验证token
        if(StringUtils.isBlank(tokenName)||StringUtils.isBlank(tokenName)||StringUtils.isBlank(id)){
            return -1;
        }
        String value=jedisClient.get(tokenName);
        if(!value.equals(token)){
            return -1;
        }
        //展示捐赠
        TbThanks tbThanks=tbThanksMapper.selectByPrimaryKey(Integer.valueOf(id));
        if(tbThanks==null){
            return 0;
        }
        tbThanks.setState(2);
        if(tbThanksMapper.updateByPrimaryKey(tbThanks)!=1){
            return 0;
        }
        //修改订单状态
        TbOrder tbOrder=tbOrderMapper.selectByPrimaryKey(tbThanks.getOrderId());
        if(tbOrder!=null){
            tbOrder.setStatus(6);
            tbOrder.setCloseTime(new Date());
            tbOrder.setUpdateTime(new Date());
            if(tbOrderMapper.updateByPrimaryKey(tbOrder)!=1){
                return 0;
            }
        }
        //发送通知邮箱
        if(StringUtils.isNotBlank(tbThanks.getEmail())&& EmailUtil.checkEmail(tbThanks.getEmail())){
            String content="抱歉，您的订单支付失败，请尝试重新支付！<br>Powered By XPay. Exrick Present.";
            emailUtil.sendEmailPayResult(tbThanks.getEmail(),"【XMall商城】支付失败通知",content);
        }
        return 1;
    }

    @Override
    public int notShowPay(String tokenName, String token, String id) {

        //验证token
        if(StringUtils.isBlank(tokenName)||StringUtils.isBlank(tokenName)||StringUtils.isBlank(id)){
            return -1;
        }
        String value=jedisClient.get(tokenName);
        if(!value.equals(token)){
            return -1;
        }
        //展示捐赠
        TbThanks tbThanks=tbThanksMapper.selectByPrimaryKey(Integer.valueOf(id));
        if(tbThanks==null){
            return 0;
        }
        tbThanks.setState(3);
        if(tbThanksMapper.updateByPrimaryKey(tbThanks)!=1){
            return 0;
        }
        //修改订单状态
        TbOrder tbOrder=tbOrderMapper.selectByPrimaryKey(tbThanks.getOrderId());
        if(tbOrder!=null){
            tbOrder.setStatus(4);
            tbOrder.setEndTime(new Date());
            tbOrder.setUpdateTime(new Date());
            if(tbOrderMapper.updateByPrimaryKey(tbOrder)!=1){
                return 0;
            }
        }
        //发送通知邮箱
        if(StringUtils.isNotBlank(tbThanks.getEmail())&&EmailUtil.checkEmail(tbThanks.getEmail())){
            String content="您的订单已支付成功，十分感谢您的捐赠！<br>但由于您的支付金额过低或其他原因，将不会在捐赠名单中显示，敬请谅解！" +
                    "<br>Powered By XPay. Exrick Present.";
            emailUtil.sendEmailPayResult(tbThanks.getEmail(),"【XMall商城】支付捐赠成功通知",content);
        }
        return 1;
    }

    @Override
    public int editPay(String tokenName, String token, TbThanks tbThanks) {

        //验证token
        if(StringUtils.isBlank(tokenName)||StringUtils.isBlank(tokenName)||StringUtils.isBlank(tbThanks.getId().toString())){
            return -1;
        }
        String value=jedisClient.get(tokenName);
        if(!value.equals(token)){
            return -1;
        }
        //保存
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            Date date=sdf.parse(tbThanks.getTime());
            tbThanks.setDate(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        if(tbThanksMapper.updateByPrimaryKey(tbThanks)!=1){
            return 0;
        }
        return 1;
    }

    @Override
    public int payDel(String tokenName, String token, String id) {

        //验证token
        if(StringUtils.isBlank(tokenName)||StringUtils.isBlank(tokenName)||StringUtils.isBlank(id)){
            return -1;
        }
        String value=jedisClient.get(tokenName);
        if(!value.equals(token)){
            return -1;
        }
        //获得捐赠
        TbThanks tbThanks=tbThanksMapper.selectByPrimaryKey(Integer.valueOf(id));
        if(tbThanks==null){
            return 0;
        }
        //删除捐赠
        if(tbThanksMapper.deleteByPrimaryKey(Integer.valueOf(id))!=1){
            return 0;
        }
        //修改订单状态
        TbOrder tbOrder=tbOrderMapper.selectByPrimaryKey(tbThanks.getOrderId());
        if(tbOrder!=null){
            tbOrder.setStatus(6);
            tbOrder.setCloseTime(new Date());
            tbOrder.setUpdateTime(new Date());
            if(tbOrderMapper.updateByPrimaryKey(tbOrder)!=1){
                return 0;
            }
        }
        //发送通知邮箱
        if(StringUtils.isNotBlank(tbThanks.getEmail())&& EmailUtil.checkEmail(tbThanks.getEmail())){
            String content="抱歉，您的订单支付失败，请尝试重新支付！<br>Powered By XPay. Exrick Present.";
            emailUtil.sendEmailPayResult(tbThanks.getEmail(),"【XMall商城】支付失败通知",content);
        }
        return 1;
    }


}
