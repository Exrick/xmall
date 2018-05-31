package cn.exrick.manager.controller;

import cn.exrick.common.constant.CountConstant;
import cn.exrick.common.pojo.Result;
import cn.exrick.common.utils.ResultUtil;
import cn.exrick.manager.dto.ChartData;
import cn.exrick.manager.dto.OrderChartData;
import cn.exrick.manager.service.CountService;
import cn.hutool.core.date.DateUnit;
import cn.hutool.core.date.DateUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author Exrickx
 */
@RestController
@Api(description = "统计")
public class CountController {

    @Autowired
    private CountService countService;

    @RequestMapping(value = "/count/order",method = RequestMethod.GET)
    @ApiOperation(value = "通过panelId获得板块内容列表")
    public Result<Object> countOrder(@RequestParam int type,
                                     @RequestParam(required = false) String startTime,
                                     @RequestParam(required = false) String endTime,
                                     @RequestParam(required = false) int year){

        ChartData data = new ChartData();
        Date startDate = null, endDate = null;
        if(type == CountConstant.CUSTOM_DATE){
            startDate = DateUtil.beginOfDay(DateUtil.parse(startTime));
            endDate = DateUtil.endOfDay(DateUtil.parse(endTime));
            long betweenDay = DateUtil.between(startDate, endDate, DateUnit.DAY);
            if(betweenDay>31){
                return new ResultUtil<Object>().setErrorMsg("所选日期范围过长，最多不能超过31天");
            }
        }
        List<OrderChartData> list = countService.getOrderCountData(type, startDate, endDate, year);
        List<Object> xDatas = new ArrayList<>();
        List<Object> yDatas = new ArrayList<>();
        BigDecimal countAll = new BigDecimal("0");
        for(OrderChartData orderData : list){
            if(type==CountConstant.CUSTOM_YEAR){
                xDatas.add(DateUtil.format(orderData.getTime(),"yyyy-MM"));
            }else{
                xDatas.add(DateUtil.formatDate(orderData.getTime()));
            }
            yDatas.add(orderData.getMoney());
            countAll=countAll.add(orderData.getMoney());
        }
        data.setxDatas(xDatas);
        data.setyDatas(yDatas);
        data.setCountAll(countAll);
        return new ResultUtil<Object>().setData(data);
    }
}
