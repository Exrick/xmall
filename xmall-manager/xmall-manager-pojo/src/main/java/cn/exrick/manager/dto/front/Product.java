package cn.exrick.manager.dto.front;

import java.io.Serializable;

public class Product implements Serializable {

    private Long productId;

    private Long salePrice;

    private String productName;

    private String sub_title;

    private String productImageBig;

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public Long getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(Long salePrice) {
        this.salePrice = salePrice;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getSub_title() {
        return sub_title;
    }

    public void setSub_title(String sub_title) {
        this.sub_title = sub_title;
    }

    public String getProductImageBig() {
        return productImageBig;
    }

    public void setProductImageBig(String productImageBig) {
        this.productImageBig = productImageBig;
    }
}
