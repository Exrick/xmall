package cn.exrick.manager.dto.front;

import java.io.Serializable;

/**
 * @author Exrickx
 */
public class Cart implements Serializable {

    private Long userId;

    private Long productId;

    private String checked;

    private int productNum;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getChecked() {
        return checked;
    }

    public void setChecked(String checked) {
        this.checked = checked;
    }

    public int getProductNum() {
        return productNum;
    }

    public void setProductNum(int productNum) {
        this.productNum = productNum;
    }
}
