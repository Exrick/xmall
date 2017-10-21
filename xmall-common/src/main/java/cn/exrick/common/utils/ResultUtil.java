package cn.exrick.common.utils;


import cn.exrick.common.pojo.Result;

/**
 * @author Exrick
 * @date 2017/8/20
 */
public class ResultUtil<T> {

    private Result<T> result;

    public ResultUtil(){
        result=new Result<>();
        result.setSuccess(true);
        result.setMessage("success");
    }

    public Result<T> setData(T t){
        this.result.setResult(t);
        return this.result;
    }

    public Result<T> setErrorMsg(String msg){
        this.result.setSuccess(false);
        this.result.setMessage(msg);
        return this.result;
    }
}
