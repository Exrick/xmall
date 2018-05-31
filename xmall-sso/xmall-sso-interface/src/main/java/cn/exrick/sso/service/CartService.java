package cn.exrick.sso.service;



import cn.exrick.manager.dto.front.CartProduct;

import java.util.List;

/**
 * @author Exrickx
 */
public interface CartService {

    /**
     * 添加
     * @param userId
     * @param itemId
     * @param num
     * @return
     */
    int addCart(long userId, long itemId, int num);

    /**
     * 获取
     * @param userId
     * @return
     */
    List<CartProduct> getCartList(long userId);

    /**
     * 更新
     * @param userId
     * @param itemId
     * @param num
     * @param checked
     * @return
     */
    int updateCartNum(long userId, long itemId, int num,String checked);

    /**
     * 删除单个
     * @param userId
     * @param itemId
     * @return
     */
    int deleteCartItem(long userId, long itemId);

    /**
     * 全选反选
     * @param userId
     * @param checked
     * @return
     */
    int checkAll(long userId,String checked);

    /**
     * 删除全部勾选的
     * @param userId
     * @return
     */
    int delChecked(long userId);
}
