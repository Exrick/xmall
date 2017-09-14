package cn.exrick.service;

import cn.exrick.dto.ItemDto;
import cn.exrick.pojo.DataTablesResult;
import cn.exrick.pojo.TbItem;


/**
 * Created by Exrick on 2017/7/29.
 */
public interface ItemService {

    /**
     * 通过ID获取商品
     * @param itemId
     * @return
     */
    ItemDto getItemById(Long itemId);

    /**
     * 
     * @param id
     * @return
     */
    TbItem getNormalItemById(Long id);

    /**
     * 分页搜索排序获取商品列表
     * @param draw
     * @param start
     * @param length
     * @param search
     * @param orderCol
     * @return
     */
    DataTablesResult getItemList(int draw,int start,int length,int cid,
                                 String search,String orderCol,String orderDir);

    /**
     * 多条件查询获取商品列表
     * @param draw
     * @param start
     * @param length
     * @param search
     * @param minDate
     * @param maxDate
     * @param orderCol
     * @param orderDir
     * @return
     */
    DataTablesResult getItemSearchList(int draw,int start,int length,int cid,
                                       String search,String minDate,String maxDate,
                                       String orderCol,String orderDir);

    /**
     * 获取商品总数
     * @return
     */
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

    /**
     * 添加商品
     * @param itemDto
     * @return
     */
    TbItem addItem(ItemDto itemDto);

    /**
     * 更新商品
     * @param itemDto
     * @return
     */
    TbItem updateItem(Long id,ItemDto itemDto);
}
