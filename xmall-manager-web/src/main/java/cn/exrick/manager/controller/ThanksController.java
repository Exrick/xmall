package cn.exrick.manager.controller;

import cn.exrick.common.pojo.DataTablesResult;
import cn.exrick.common.pojo.Result;
import cn.exrick.common.utils.ResultUtil;
import cn.exrick.manager.pojo.TbThanks;
import cn.exrick.manager.service.ThanksService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author Exrickx
 */
@RestController
@Api(description= "捐赠管理")
public class ThanksController {

    @Autowired
    private ThanksService thanksService;

    @RequestMapping(value = "/thanks/list",method = RequestMethod.GET)
    @ApiOperation(value = "获取捐赠列表")
    public DataTablesResult getThanksList(){

        DataTablesResult result=thanksService.getThanksList();
        return result;
    }

    @RequestMapping(value = "/thanks/count",method = RequestMethod.GET)
    @ApiOperation(value = "获取捐赠列表总数")
    public Result<Object> getThanksCount(){

        Long result=thanksService.countThanks();
        return new ResultUtil<Object>().setData(result);
    }

    @RequestMapping(value = "/thanks/add",method = RequestMethod.POST)
    @ApiOperation(value = "添加捐赠")
    public Result<Object> addThanks(@ModelAttribute TbThanks tbThanks){

        thanksService.addThanks(tbThanks);
        return new ResultUtil<Object>().setData(null);
    }

    @RequestMapping(value = "/thanks/update",method = RequestMethod.POST)
    @ApiOperation(value = "编辑捐赠")
    public Result<Object> updateThanks(@ModelAttribute TbThanks tbThanks){

        thanksService.updateThanks(tbThanks);
        return new ResultUtil<Object>().setData(null);
    }

    @RequestMapping(value = "/thanks/del/{id}",method = RequestMethod.DELETE)
    @ApiOperation(value = "删除捐赠")
    public Result<Object> delThanks(@PathVariable int id){

        thanksService.deleteThanks(id);
        return new ResultUtil<Object>().setData(null);
    }
}
