package cn.exrick.manager.dto.front;

import java.io.Serializable;
import java.util.List;

public class ProductHome implements Serializable {

    private List<?> home_hot;

    private List<?> home_floors;

    public List<?> getHome_hot() {
        return home_hot;
    }

    public void setHome_hot(List<?> home_hot) {
        this.home_hot = home_hot;
    }

    public List<?> getHome_floors() {
        return home_floors;
    }

    public void setHome_floors(List<?> home_floors) {
        this.home_floors = home_floors;
    }

}
