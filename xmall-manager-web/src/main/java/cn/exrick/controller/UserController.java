package cn.exrick.controller;

import cn.exrick.pojo.DataTablesResult;
import cn.exrick.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Exrick on 2017/8/11.
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/user/list")
    @ResponseBody
    public DataTablesResult getUserList(int draw, int start, int length, @RequestParam("search[value]") String search){
        DataTablesResult result=userService.getUserList(draw,start,length,search);
        return result;
    }
}
