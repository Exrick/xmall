package cn.exrick.service;

import cn.exrick.common.pojo.Result;
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

    /**
     * 修改商品状态
     * @param id
     * @param state
     * @return
     */
    TbItem alertItemState(Long id,Integer state);

    /**
     * 彻底删除商品
     * @param id
     * @return
     */
    int deleteItem(Long id);
}
