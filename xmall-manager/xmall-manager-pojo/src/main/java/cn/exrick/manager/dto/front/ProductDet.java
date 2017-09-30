package cn.exrick.manager.dto.front;

import java.io.Serializable;
import java.util.List;

public class ProductDet implements Serializable {

    private Long productId;

    private Long salePrice;

    private String productName;

    private String sub_title;

    private Long limit_num;

    private String productImageBig;

    private String detail;

    private List<?> productImageSmall;

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

    public Long getLimit_num() {
        return limit_num;
    }

    public void setLimit_num(Long limit_num) {
        this.limit_num = limit_num;
    }

    public String getProductImageBig() {
        return productImageBig;
    }

    public void setProductImageBig(String productImageBig) {
        this.productImageBig = productImageBig;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public List<?> getProductImageSmall() {
        return productImageSmall;
    }

    public void setProductImageSmall(List<?> productImageSmall) {
        this.productImageSmall = productImageSmall;
    }
}
