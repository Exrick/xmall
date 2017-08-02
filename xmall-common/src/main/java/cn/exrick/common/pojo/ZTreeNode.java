package cn.exrick.common.pojo;

import java.io.Serializable;

/**
 * Created by Exrick on 2017/8/2.
 */
public class ZTreeNode implements Serializable {

    private int id;

    private int pId;

    private String name;

    private Boolean isParent;

    private Boolean open;

    public Boolean getIsParent() {
        return isParent;
    }

    public void setIsParent(Boolean isParent) {
        this.isParent = isParent;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getOpen() {
        return open;
    }

    public void setOpen(Boolean open) {
        this.open = open;
    }
}
