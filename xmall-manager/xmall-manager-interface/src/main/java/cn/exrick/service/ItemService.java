package cn.exrick.service;

import cn.exrick.common.pojo.ZtreeNodeResult;
import cn.exrick.pojo.DataTablesResult;
import cn.exrick.pojo.TbItem;

/**
 * Created by Exrick on 2017/7/29.
 */
public interface ItemService {

    TbItem getItemById(long itemId);

    DataTablesResult getItemList(int draw,int start,int length,String search);

    DataTablesResult getAllItemCount();
}
