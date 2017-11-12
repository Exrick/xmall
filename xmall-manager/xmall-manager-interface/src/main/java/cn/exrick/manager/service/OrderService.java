package cn.exrick.manager.service;

import cn.exrick.common.pojo.DataTablesResult;


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
}
