package cn.exrick.service.impl;

import cn.exrick.common.pojo.ZTreeNode;
import cn.exrick.mapper.TbItemCatMapper;
import cn.exrick.pojo.TbItemCat;
import cn.exrick.pojo.TbItemCatExample;
import cn.exrick.service.ItemCatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Exrick on 2017/8/2.
 */
@Service
public class ItemCatServiceImpl implements ItemCatService {

    @Autowired
    private TbItemCatMapper tbItemCatMapper;

    @Override
    public List<ZTreeNode> getItemCatList(int parentId) {
        TbItemCatExample example=new TbItemCatExample();
        TbItemCatExample.Criteria criteria=example.createCriteria();
        //条件查询
        criteria.andParentIdEqualTo(new Long(parentId));
        List<TbItemCat> list = tbItemCatMapper.selectByExample(example);

        //转换成ZtreeNode
        List<ZTreeNode> resultList=new ArrayList<>();

        for(TbItemCat tbItemCat:list){

            ZTreeNode node=new ZTreeNode();

            node.setId(tbItemCat.getId().intValue());
            node.setName(tbItemCat.getName());
            node.setIsParent(tbItemCat.getIsParent()?true:false);
            node.setOpen(tbItemCat.getIsParent()?false:true);

            resultList.add(node);
        }

        return resultList;
    }
}
