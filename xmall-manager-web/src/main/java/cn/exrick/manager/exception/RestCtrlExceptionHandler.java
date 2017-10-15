package cn.exrick.manager.exception;

import cn.exrick.common.exception.XmallException;
import cn.exrick.common.pojo.Result;
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

    @ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
    @ExceptionHandler(XmallException.class)
    @ResponseBody
    public Result<Object> handleXmallException(XmallException e) {
        String errorMsg="Xmall exception: ";
        if (e!=null){
            errorMsg=e.getLocalizedMessage();
            log.warn(e.getLocalizedMessage());
        }
        return new ResultUtil<>().setErrorMsg(errorMsg);
    }

    @ExceptionHandler(Exception.class)
    @ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
    @ResponseBody
    public Result<Object> handleException(Exception e) {
        String errorMsg="Exception: ";
        if (e!=null){
            log.warn(e.getMessage()+" exception getMessage");
            log.warn(e.getLocalizedMessage()+" exception getMessage");
            if(e.getLocalizedMessage()!=null&&e.getLocalizedMessage().contains("Maximum upload size")){
                errorMsg="上传文件大小超过5MB限制";
            }else{
                errorMsg=e.getLocalizedMessage();
            }
        }
        return new ResultUtil<>().setErrorMsg(errorMsg);
    }
}
