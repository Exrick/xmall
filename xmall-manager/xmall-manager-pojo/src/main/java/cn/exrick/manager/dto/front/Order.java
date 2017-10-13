package cn.exrick.manager.dto.front;

import cn.exrick.manager.pojo.TbAddress;

import java.io.Serializable;
import java.util.List;

public class Order implements Serializable{

    private Long orderId;

    private Long orderTotal;

    private TbAddress addressInfo;

    private List<CartProduct> goodsList;

    private String orderStatus;

    private String createDate;

    private String closeDate;

    private String finishDate;

    public String getCloseDate() {
        return closeDate;
    }

    public void setCloseDate(String closeDate) {
        this.closeDate = closeDate;
    }

    public String getFinishDate() {
        return finishDate;
    }

    public void setFinishDate(String finishDate) {
        this.finishDate = finishDate;
    }

    public Long getOrderTotal() {
        return orderTotal;
    }

    public void setOrderTotal(Long orderTotal) {
        this.orderTotal = orderTotal;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public TbAddress getAddressInfo() {
        return addressInfo;
    }

    public void setAddressInfo(TbAddress addressInfo) {
        this.addressInfo = addressInfo;
    }

    public List<CartProduct> getGoodsList() {
        return goodsList;
    }

    public void setGoodsList(List<CartProduct> goodsList) {
        this.goodsList = goodsList;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }
}
