package cn.exrick.manager.dto;

import java.io.Serializable;

/**
 * @author Exrickx
 */
public class EsInfo implements Serializable{

    private String cluster_name;

    private String status;

    private String number_of_nodes;

    private Integer count;

    public String getCluster_name() {
        return cluster_name;
    }

    public void setCluster_name(String cluster_name) {
        this.cluster_name = cluster_name;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getNumber_of_nodes() {
        return number_of_nodes;
    }

    public void setNumber_of_nodes(String number_of_nodes) {
        this.number_of_nodes = number_of_nodes;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
}
