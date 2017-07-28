package cn.exrick.service.impl;

import cn.exrick.mapper.TbItemMapper;
import cn.exrick.pojo.TbItem;
import cn.exrick.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Exrick on 2017/7/29.
 */
@Service
public class ItemServiceImpl implements ItemService {

    @Autowired
    private TbItemMapper tbItemMapper;

    @Override
    public TbItem getItemById(long itemId) {
        //根据主键查询
        return tbItemMapper.selectByPrimaryKey(itemId);
    }
}
