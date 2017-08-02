package cn.exrick.controller;

import cn.exrick.pojo.DataTablesResult;
import cn.exrick.pojo.TbItem;
import cn.exrick.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Exrick on 2017/7/29.
 */
@Controller
public class ItemController {

    @Autowired
    private ItemService itemService;

    @RequestMapping("/item/{itemId}")
    @ResponseBody
    public TbItem getItemById(@PathVariable Long itemId){
        TbItem tbItem=itemService.getItemById(itemId);
        return tbItem;
    }

    @RequestMapping("/item/list")
    @ResponseBody
    public DataTablesResult getItemList(int draw, int start, int length,@RequestParam("search[value]") String search){
        DataTablesResult result=itemService.getItemList(draw,start,length,search);
        return result;
    }

    @RequestMapping("/item/count")
    @ResponseBody
    public DataTablesResult getAllItemCount(){
        DataTablesResult result=itemService.getAllItemCount();
        return result;
    }
}
