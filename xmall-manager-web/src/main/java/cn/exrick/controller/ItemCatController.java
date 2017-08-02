package cn.exrick.controller;

import cn.exrick.common.pojo.ZTreeNode;
import cn.exrick.service.ItemCatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by Exrick on 2017/8/2.
 */
@Controller
public class ItemCatController {

    @Autowired
    private ItemCatService itemCatService;

    @RequestMapping("item/cat/list")
    @ResponseBody
    public List<ZTreeNode> getItemCatList
            (@RequestParam(name="id",defaultValue = "0") int parentId){
        List<ZTreeNode> list=itemCatService.getItemCatList(parentId);
        return list;
    }
}
