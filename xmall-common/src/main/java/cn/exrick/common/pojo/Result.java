package cn.exrick.common.pojo;


import java.io.Serializable;

/**
 * Created by Exrick on 2017/8/20.
 * 前后端交互数据标准
 */
public class Result<T> implements Serializable{

    //成功标志
    private boolean success;

    //失败消息
    private String message;

    //时间撮
    private long dateline=System.currentTimeMillis();

    //结果对象
    private T result;

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public long getDateline() {
        return dateline;
    }

    public void setDateline(long dateline) {
        this.dateline = dateline;
    }

    public T getResult() {
        return result;
    }

    public void setResult(T result) {
        this.result = result;
    }
}
