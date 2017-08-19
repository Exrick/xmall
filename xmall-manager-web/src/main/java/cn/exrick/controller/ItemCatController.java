package cn.exrick.controller;

import cn.exrick.common.pojo.ZTreeNode;
import cn.exrick.service.ItemCatService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by Exrick on 2017/8/2.
 */
@RestController
@Api(description = "商品分类信息")
public class ItemCatController {

    @Autowired
    private ItemCatService itemCatService;

    @RequestMapping(value = "item/cat/list",method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "通过父ID获取分类列表")
    public List<ZTreeNode> getItemCatList
            (@RequestParam(name="id",defaultValue = "0") int parentId){
        List<ZTreeNode> list=itemCatService.getItemCatList(parentId);
        return list;
    }
}
