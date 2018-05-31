package cn.exrick.manager.dto;


import cn.exrick.manager.pojo.TbOrder;
import cn.exrick.manager.pojo.TbOrderItem;
import cn.exrick.manager.pojo.TbOrderShipping;

import java.io.Serializable;
import java.util.List;

/**
 * @author Exrickx
 */
public class OrderDetail implements Serializable {

    private TbOrder tbOrder;

    private List<TbOrderItem> tbOrderItem;

    private TbOrderShipping tbOrderShipping;

    public List<TbOrderItem> getTbOrderItem() {
        return tbOrderItem;
    }

    public void setTbOrderItem(List<TbOrderItem> tbOrderItem) {
        this.tbOrderItem = tbOrderItem;
    }

    public TbOrder getTbOrder() {
        return tbOrder;
    }

    public void setTbOrder(TbOrder tbOrder) {
        this.tbOrder = tbOrder;
    }

    public TbOrderShipping getTbOrderShipping() {
        return tbOrderShipping;
    }

    public void setTbOrderShipping(TbOrderShipping tbOrderShipping) {
        this.tbOrderShipping = tbOrderShipping;
    }
}
