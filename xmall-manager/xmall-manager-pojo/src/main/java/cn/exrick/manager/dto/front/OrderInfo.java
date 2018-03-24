package cn.exrick.manager.dto.front;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

/**
 * @author Exrickx
 */
public class OrderInfo implements Serializable{

    private String userId;

    private Long addressId;

    private String tel;

    private String userName;

    private String streetName;

    private BigDecimal orderTotal;

    public BigDecimal getOrderTotal() {
        return orderTotal;
    }

    public void setOrderTotal(BigDecimal orderTotal) {
        this.orderTotal = orderTotal;
    }

    private List<CartProduct> goodsList;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Long getAddressId() {
        return addressId;
    }

    public void setAddressId(Long addressId) {
        this.addressId = addressId;
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
