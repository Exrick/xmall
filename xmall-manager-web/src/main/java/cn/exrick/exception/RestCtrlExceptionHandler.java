package cn.exrick.exception;

import cn.exrick.common.utils.Result;
import cn.exrick.common.utils.ResultUtil;
import org.springframework.http.HttpStatus;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import java.net.BindException;

/**
 * Created by Exrick on 2017/8/20.
 */
@ControllerAdvice
public class RestCtrlExceptionHandler {

    private static Logger log = LoggerFactory.getLogger(RestCtrlExceptionHandler.class);

    @ExceptionHandler(BindException.class)
    @ResponseStatus(value = HttpStatus.BAD_REQUEST)
    @ResponseBody
    public Result<Object> bindExceptionHandler(BindException e){
        String errorMsg="请求数据校验不合法: ";
        if(e!=null){
            errorMsg=e.getMessage();
            log.warn(errorMsg);
        }
        return new ResultUtil<>().setErrorMsg(errorMsg);
    }
}
