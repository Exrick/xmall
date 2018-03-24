package cn.exrick.manager.dto.front;

import java.io.Serializable;
import java.util.List;

/**
 * @author Exrickx
 */
public class ProductHome implements Serializable {

    private List<?> homeHot;

    private List<?> homeFloors;

    public List<?> getHomeHot() {
        return homeHot;
    }

    public void setHomeHot(List<?> homeHot) {
        this.homeHot = homeHot;
    }

    public List<?> getHomeFloors() {
        return homeFloors;
    }

    public void setHomeFloors(List<?> homeFloors) {
        this.homeFloors = homeFloors;
    }
}
