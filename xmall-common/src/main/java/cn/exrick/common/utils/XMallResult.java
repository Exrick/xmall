package cn.exrick.common.utils;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * Created by Exrick on 2017/8/5.
 * 自定义响应结构
 */
public class XMallResult {

    private static final ObjectMapper MAPPER=new ObjectMapper();

    //响应状态
    private Integer status;

    //响应消息
    private String msg;

    //响应数据
    private Object data;

    public static XMallResult build(Integer status, String msg, Object data){
        return new XMallResult(status,msg,data);
    }

    public static XMallResult ok(Object data){
        return new XMallResult(data);
    }

    public static XMallResult ok(){
        return new XMallResult(null);
    }

    public XMallResult(){

    }

    public static XMallResult build(Integer status, String msg) {
        return new XMallResult(status, msg, null);
    }

    public XMallResult(Integer status, String msg, Object data) {
        this.status = status;
        this.msg = msg;
        this.data = data;
    }

    public XMallResult(Object data) {
        this.status = 200;
        this.msg = "OK";
        this.data = data;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
