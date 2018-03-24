package cn.exrick.manager.task;

import cn.exrick.manager.service.OrderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * @author Exrickx
 */
@Component
public class CancelOrderJob {

    final static Logger log= LoggerFactory.getLogger(CancelOrderJob.class);

    @Autowired
    private OrderService orderService;

    /**
     * 每1个小时判断订单是否失效
     */
    @Scheduled(cron = "0 0 */1 * * ?")
    public void run() {

        log.info("执行了自动取消订单定时任务");
        orderService.cancelOrder();
    }
}
