package cn.exrick.common.utils;


import cn.exrick.common.pojo.Result;

/**
 * @author Exrick
 * @date 2018/03/24
 */
public class ResultUtil<T> {

    private Result<T> result;

    public ResultUtil(){
        result=new Result<>();
        result.setSuccess(true);
        result.setMessage("success");
        result.setCode(200);
    }

    public Result<T> setData(T t){
        this.result.setResult(t);
        this.result.setCode(200);
        return this.result;
    }

    public Result<T> setData(T t, String msg){
        this.result.setResult(t);
        this.result.setCode(200);
        this.result.setMessage(msg);
        return this.result;
    }

    public Result<T> setErrorMsg(String msg){
        this.result.setSuccess(false);
        this.result.setMessage(msg);
        this.result.setCode(500);
        return this.result;
    }

    public Result<T> setErrorMsg(Integer code, String msg){
        this.result.setSuccess(false);
        this.result.setMessage(msg);
        this.result.setCode(code);
        return this.result;
    }
}
