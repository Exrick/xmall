package cn.exrick.manager.pojo;

import java.io.Serializable;

public class TbDict implements Serializable{
    private Integer id;

    private String dict;

    private Integer type;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDict() {
        return dict;
    }

    public void setDict(String dict) {
        this.dict = dict == null ? null : dict.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}