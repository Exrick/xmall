package cn.exrick.manager.controller;

import cn.exrick.common.pojo.Result;
import cn.exrick.common.utils.ResultUtil;
import cn.exrick.manager.pojo.TbUser;
import cn.exrick.manager.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.*;

@RestController
@Api(description= "管理员管理")
public class UserController {

    final static Logger log= LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/user/login",method = RequestMethod.POST)
    @ApiOperation(value = "用户登录")
    public Result<Object> login(String username, String password){

        Subject subject = SecurityUtils.getSubject() ;
        //MD5加密
        String md5Pass = DigestUtils.md5DigestAsHex(password.getBytes());
        UsernamePasswordToken token = new UsernamePasswordToken(username,md5Pass);
        try {
            subject.login(token);
            log.info("验证成功");
            return new ResultUtil<Object>().setData(null);
        }catch (Exception e){
            log.info("验证失败");
            return new ResultUtil<Object>().setErrorMsg("用户名或密码错误");
        }
    }

    @RequestMapping(value = "/user/logout",method = RequestMethod.GET)
    @ApiOperation(value = "退出登录")
    public Result<Object> logout(){

        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return new ResultUtil<Object>().setData(null);
    }

    @RequestMapping(value = "/user/userInfo",method = RequestMethod.GET)
    @ApiOperation(value = "获得登录用户信息")
    public Result<TbUser> getUserInfo(){

        String username= SecurityUtils.getSubject().getPrincipal().toString();
        TbUser tbUser=userService.getUserByUsername(username);
        tbUser.setPassword(null);
        return new ResultUtil<TbUser>().setData(tbUser);
    }
}
