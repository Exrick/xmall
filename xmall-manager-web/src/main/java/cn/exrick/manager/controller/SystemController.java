package cn.exrick.manager.controller;

import cn.exrick.common.pojo.DataTablesResult;
import cn.exrick.common.pojo.Result;
import cn.exrick.common.utils.IPInfoUtil;
import cn.exrick.common.utils.ResultUtil;
import cn.exrick.manager.pojo.TbBase;
import cn.exrick.manager.pojo.TbOrderItem;
import cn.exrick.manager.pojo.TbShiroFilter;
import cn.exrick.manager.pojo.TbUser;
import cn.exrick.manager.service.SystemService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author Exrickx
 */
@RestController
@Api(description= "系统配置管理")
public class SystemController {

    @Autowired
    private SystemService systemService;

    @RequestMapping(value = "/sys/shiro/list",method = RequestMethod.GET)
    @ApiOperation(value = "获取shiro过滤链配置")
    public DataTablesResult getShiroList(@ModelAttribute TbUser tbUser){

        DataTablesResult result=new DataTablesResult();
        List<TbShiroFilter> list=systemService.getShiroFilter();
        result.setData(list);
        result.setSuccess(true);
        return result;
    }

    @RequestMapping(value = "/sys/shiro/count",method = RequestMethod.GET)
    @ApiOperation(value = "统计shiro过滤链数")
    public Result<Object> getUserCount(){

        Long result=systemService.countShiroFilter();
        return new ResultUtil<Object>().setData(result);
    }

    @RequestMapping(value = "/sys/shiro/add",method = RequestMethod.POST)
    @ApiOperation(value = "添加shiro过滤链")
    public Result<Object> addShiro(@ModelAttribute TbShiroFilter tbShiroFilter){

        systemService.addShiroFilter(tbShiroFilter);
        return new ResultUtil<Object>().setData(null);
    }

    @RequestMapping(value = "/sys/shiro/update",method = RequestMethod.POST)
    @ApiOperation(value = "更新shiro过滤链")
    public Result<Object> updateShiro(@ModelAttribute TbShiroFilter tbShiroFilter){

        systemService.updateShiroFilter(tbShiroFilter);
        return new ResultUtil<Object>().setData(null);
    }

    @RequestMapping(value = "/sys/shiro/del/{id}",method = RequestMethod.DELETE)
    @ApiOperation(value = "删除shiro过滤链")
    public Result<Object> delShiro(@PathVariable int id){

        systemService.deleteShiroFilter(id);
        return new ResultUtil<Object>().setData(null);
    }

    @RequestMapping(value = "/sys/base",method = RequestMethod.GET)
    @ApiOperation(value = "获取基本设置")
    public Result<TbBase> getBase(){

        TbBase tbBase=systemService.getBase();
        return new ResultUtil<TbBase>().setData(tbBase);
    }

    @RequestMapping(value = "/sys/base/update",method = RequestMethod.POST)
    @ApiOperation(value = "编辑基本设置")
    public Result<Object> updateBase(@ModelAttribute TbBase tbBase){

        systemService.updateBase(tbBase);
        return new ResultUtil<Object>().setData(null);
    }

    @RequestMapping(value = "/sys/weekHot",method = RequestMethod.GET)
    @ApiOperation(value = "获取本周热销商品数据")
    public Result<TbOrderItem> getWeekHot(){

        TbOrderItem tbOrderItem=systemService.getWeekHot();
        return new ResultUtil<TbOrderItem>().setData(tbOrderItem);
    }

    @RequestMapping(value = "/sys/weather",method = RequestMethod.GET)
    @ApiOperation(value = "获取天气信息")
    public Result<Object> getWeather(HttpServletRequest request){

        String result= IPInfoUtil.getIpInfo(IPInfoUtil.getIpAddr(request));
        return new ResultUtil<Object>().setData(result);
    }

    @RequestMapping(value = "/sys/log",method = RequestMethod.GET)
    @ApiOperation(value = "获取系统日志")
    public DataTablesResult getLog(){

        DataTablesResult result= systemService.getLogList();
        return result;
    }

    @RequestMapping(value = "/sys/log/count",method = RequestMethod.GET)
    @ApiOperation(value = "获取系统日志总数")
    public Result<Object> countLog(){

        Long result=systemService.countLog();
        return new ResultUtil<Object>().setData(result);
    }

    @RequestMapping(value = "/sys/log/del/{id}",method = RequestMethod.DELETE)
    @ApiOperation(value = "删除系统日志")
    public Result<Object> delLog(@PathVariable int id){

        systemService.deleteLog(id);
        return new ResultUtil<Object>().setData(null);
    }
}
