package cn.exrick.common.pojo;

import java.io.Serializable;

public class SearchItem implements Serializable {

    private Long productId;

    private Long salePrice;

    private String productName;

    private String sub_title;

    private String productImageBig;

    private String category_name;

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

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

    @Override
    public String toString() {
        return "SearchItem{" +
                "productId=" + productId +
                ", salePrice=" + salePrice +
                ", productName='" + productName + '\'' +
                ", sub_title='" + sub_title + '\'' +
                ", productImageBig='" + productImageBig + '\'' +
                ", category_name='" + category_name + '\'' +
                '}';
    }
}
