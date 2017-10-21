package cn.exrick.manager.controller;

import cn.exrick.common.pojo.DataTablesResult;
import cn.exrick.common.pojo.Result;
import cn.exrick.common.utils.ResultUtil;
import cn.exrick.manager.service.OrderService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Exrickx
 */
@RestController
@Api(description= "订单管理")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "/order/list",method = RequestMethod.GET)
    @ApiOperation(value = "获取订单列表")
    public DataTablesResult getOrderList(){

        DataTablesResult result=orderService.getOrderList();
        return result;
    }

    @RequestMapping(value = "/order/count",method = RequestMethod.GET)
    @ApiOperation(value = "获取订单总数")
    public Result<Object> getOrderCount(){

        Long result=orderService.countOrder();
        return new ResultUtil<Object>().setData(result);
    }

    @RequestMapping(value = "/order/del/{id}",method = RequestMethod.DELETE)
    @ApiOperation(value = "删除订单")
    public Result<Object> getUserInfo(@PathVariable String id){

        orderService.deleteOrder(id);
        return new ResultUtil<Object>().setData(null);
    }
}
