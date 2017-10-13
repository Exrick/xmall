package cn.exrick.sso.service;

import cn.exrick.manager.dto.front.Order;
import cn.exrick.manager.dto.front.OrderInfo;

import java.util.List;

public interface OrderService {

    List<Order> getOrderList(Long userId);

    Order getOrder(Long orderId);

    int cancelOrder(Long orderId);

    Long createOrder(OrderInfo orderInfo);

    int delOrder(Long orderId);
}
