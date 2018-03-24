package cn.exrick.manager.service;

import cn.exrick.common.pojo.DataTablesResult;
import cn.exrick.manager.pojo.TbThanks;


/**
 * @author Exrickx
 */
public interface OrderService {

    /**
     * 获得订单列表
     * @return
     */
    DataTablesResult getOrderList();

    /**
     * 统计订单数
     * @return
     */
    Long countOrder();

    /**
     * 删除订单
     * @param id
     * @return
     */
    int deleteOrder(String id);

    /**
     * 定时取消订单
     */
    int cancelOrder();

    /**
     * 支付审核通过
     * @param tokenName
     * @param token
     * @param id
     * @return
     */
    int passPay(String tokenName,String token,String id);

    /**
     * 支付审核驳回
     * @param tokenName
     * @param token
     * @param id
     * @return
     */
    int backPay(String tokenName,String token,String id);

    /**
     * 支付审核通过不显示
     * @param tokenName
     * @param token
     * @param id
     * @return
     */
    int notShowPay(String tokenName,String token,String id);

    /**
     * 捐赠编辑
     * @param tokenName
     * @param token
     * @param tbThanks
     * @return
     */
    int editPay(String tokenName,String token,TbThanks tbThanks);

    /**
     * 捐赠删除
     * @param tokenName
     * @param token
     * @param id
     * @return
     */
    int payDel(String tokenName,String token,String id);
}
