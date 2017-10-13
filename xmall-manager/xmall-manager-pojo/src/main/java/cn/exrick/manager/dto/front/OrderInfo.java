package cn.exrick.manager.dto.front;

import java.io.Serializable;
import java.util.List;

public class OrderInfo implements Serializable{

    private String userId;

    private Long address_id;

    private String tel;

    private String userName;

    private String streetName;

    private Long orderTotal;

    public Long getOrderTotal() {
        return orderTotal;
    }

    public void setOrderTotal(Long orderTotal) {
        this.orderTotal = orderTotal;
    }

    private List<CartProduct> goodsList;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Long getAddress_id() {
        return address_id;
    }

    public void setAddress_id(Long address_id) {
        this.address_id = address_id;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getStreetName() {
        return streetName;
    }

    public void setStreetName(String streetName) {
        this.streetName = streetName;
    }

    public List<CartProduct> getGoodsList() {
        return goodsList;
    }

    public void setGoodsList(List<CartProduct> goodsList) {
        this.goodsList = goodsList;
    }
}
