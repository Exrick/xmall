package cn.exrick.manager.controller;

import cn.exrick.common.pojo.Result;
import cn.exrick.common.utils.ResultUtil;
import cn.exrick.content.service.ContentService;
import cn.exrick.manager.pojo.TbPanel;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author Exrickx
 */
@RestController
@Api(description = "缓存管理")
public class RedisController {

    @Autowired
    private ContentService contentService;

    @RequestMapping(value = "/redis/index/list",method = RequestMethod.GET)
    @ApiOperation(value = "获取首页缓存")
    public Result<Object> getIndexRedis(){

        String json = contentService.getIndexRedis();
        return new ResultUtil<Object>().setData(json);
    }

    @RequestMapping(value = "/redis/index/update",method = RequestMethod.GET)
    @ApiOperation(value = "刷新首页缓存")
    public Result<Object> updateIndexRedis(){

        contentService.updateIndexRedis();
        return new ResultUtil<Object>().setData(null);
    }

    @RequestMapping(value = "/redis/recommend/list",method = RequestMethod.GET)
    @ApiOperation(value = "获取推荐板块缓存")
    public Result<Object> getRecommendRedis(){

        String json = contentService.getRecommendRedis();
        return new ResultUtil<Object>().setData(json);
    }

    @RequestMapping(value = "/redis/recommend/update",method = RequestMethod.GET)
    @ApiOperation(value = "刷新推荐板块缓存")
    public Result<Object> updateRecommendRedis(){

        contentService.updateRecommendRedis();
        return new ResultUtil<Object>().setData(null);
    }

    @RequestMapping(value = "/redis/thank/list",method = RequestMethod.GET)
    @ApiOperation(value = "获取捐赠板块缓存")
    public Result<Object> getThankRedis(){

        String json = contentService.getThankRedis();
        return new ResultUtil<Object>().setData(json);
    }

    @RequestMapping(value = "/redis/thank/update",method = RequestMethod.GET)
    @ApiOperation(value = "刷新捐赠板块缓存")
    public Result<Object> updateThankRedis(){

        contentService.updateThankRedis();
        return new ResultUtil<Object>().setData(null);
    }
}
