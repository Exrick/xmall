package cn.exrick.common.exception;

/**
 * @author Exrickx
 */
public class XmallUploadException extends RuntimeException {

    private String msg;

    public XmallUploadException(String msg){
        super(msg);
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
