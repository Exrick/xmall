package cn.exrick.manager.dto.front;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

/**
 * @author Exrickx
 */
public class ProductDet implements Serializable {

    private Long productId;

    private BigDecimal salePrice;

    private String productName;

    private String subTitle;

    private Long limitNum;

    private String productImageBig;

    private String detail;

    private List<?> productImageSmall;

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public BigDecimal getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(BigDecimal salePrice) {
        this.salePrice = salePrice;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getSubTitle() {
        return subTitle;
    }

    public void setSubTitle(String subTitle) {
        this.subTitle = subTitle;
    }

    public Long getLimitNum() {
        return limitNum;
    }

    public void setLimitNum(Long limitNum) {
        this.limitNum = limitNum;
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
