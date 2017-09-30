package cn.exrick.manager.controller;

import cn.exrick.common.pojo.Result;
import cn.exrick.common.pojo.ZTreeNode;
import cn.exrick.common.utils.ResultUtil;
import cn.exrick.content.service.ContentCatService;
import cn.exrick.manager.dto.ContentCatDto;
import cn.exrick.manager.dto.DtoUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@Api(description = "内容分类信息")
public class ContentCatController {

    private final static Logger log= LoggerFactory.getLogger(DtoUtil.class);

    @Autowired
    private ContentCatService contentCatService;

    @RequestMapping(value = "/content/cat/list",method = RequestMethod.GET)
    @ApiOperation(value = "获得分类列表")
    public List<ZTreeNode> getContentByCid(@RequestParam(name="id", defaultValue="0") Long parentId){

        List<ZTreeNode> list=contentCatService.getContentCatList(parentId);
        return list;
    }

    @RequestMapping(value = "/content/cat/add",method = RequestMethod.POST)
    @ApiOperation(value = "添加内容分类")
    public Result<Object> addContentCategory(@ModelAttribute ContentCatDto contentCatDto){

        contentCatService.addContentCat(contentCatDto);
        return new ResultUtil<Object>().setData(null);
    }

    @RequestMapping(value = "/content/cat/update",method = RequestMethod.POST)
    @ApiOperation(value = "编辑内容分类")
    public Result<Object> updateContentCategory(@ModelAttribute ContentCatDto contentCatDto){

        contentCatService.updateContentCat(contentCatDto);
        return new ResultUtil<Object>().setData(null);
    }

    @RequestMapping(value = "/content/cat/del/{id}",method = RequestMethod.DELETE)
    @ApiOperation(value = "删除内容分类")
    public Result<Object> deleteContentCategory(@PathVariable Long id){

        contentCatService.deleteContentCat(id);
        return new ResultUtil<Object>().setData(null);
    }
}
