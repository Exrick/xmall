package cn.exrick.controller;

import cn.exrick.pojo.DataTablesResult;
import cn.exrick.pojo.TbItem;
import cn.exrick.service.ItemService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * Created by Exrick on 2017/7/29.
 */
@RestController
@Api(description = "商品列表信息")
public class ItemController {

    @Autowired
    private ItemService itemService;

    @RequestMapping(value = "/item/{itemId}",method = RequestMethod.GET)
    @ApiOperation(value = "通过ID获取商品")
    public TbItem getItemById(@PathVariable Long itemId){
        TbItem tbItem=itemService.getItemById(itemId);
        return tbItem;
    }

    @RequestMapping(value = "/item/list",method = RequestMethod.GET)
    @ApiOperation(value = "分页搜索查询获取商品列表")
    public DataTablesResult getItemList(int draw, int start, int length,@RequestParam("search[value]") String search){
        DataTablesResult result=itemService.getItemList(draw,start,length,search);
        return result;
    }

    @RequestMapping(value = "/item/count",method = RequestMethod.GET)
    @ApiOperation(value = "获得商品总数目")
    public DataTablesResult getAllItemCount(){
        DataTablesResult result=itemService.getAllItemCount();
        return result;
    }
}
