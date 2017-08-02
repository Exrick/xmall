package cn.exrick.common.pojo;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Exrick on 2017/8/2.
 */
public class ZtreeNodeResult implements Serializable{

    private List<?> nodes;

    public List<?> getNodes() {
        return nodes;
    }

    public void setNodes(List<?> nodes) {
        this.nodes = nodes;
    }
}
