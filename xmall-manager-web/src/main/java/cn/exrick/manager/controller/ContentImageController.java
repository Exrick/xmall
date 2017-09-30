package cn.exrick.manager.controller;

import cn.exrick.common.pojo.DataTablesResult;
import cn.exrick.common.pojo.Result;
import cn.exrick.common.utils.ResultUtil;
import cn.exrick.content.service.ContentImageService;
import cn.exrick.manager.pojo.TbImage;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@Api(description = "图片列表信息")
public class ContentImageController {

    @Autowired
    private ContentImageService contentImageService;

    @RequestMapping(value = "/image/list",method = RequestMethod.GET)
    @ApiOperation(value = "通过获得图片列表")
    public DataTablesResult getContentImage(){

        DataTablesResult result=contentImageService.getContentImage();
        return result;
    }

    @RequestMapping(value = "/image/update",method = RequestMethod.POST)
    @ApiOperation(value = "编辑图片")
    public Result<Object> updateContentImage(@ModelAttribute TbImage tbImage){

        contentImageService.updateContentImage(tbImage);
        return new ResultUtil<Object>().setData(null);
    }
}
