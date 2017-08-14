package cn.exrick.controller;

import cn.exrick.pojo.DataTablesResult;
import cn.exrick.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * Created by Exrick on 2017/8/11.
 */
@Controller
public class MemberController {

    @Autowired
    private MemberService memberService;

    @RequestMapping("/member/list")
    @ResponseBody
    public DataTablesResult getMemberList(int draw, int start, int length, @RequestParam("search[value]") String search){
        DataTablesResult result=memberService.getMemberList(draw,start,length,search);
        return result;
    }

    @RequestMapping("member/count")
    @ResponseBody
    public DataTablesResult getMemberCount(){
        return memberService.getMemberCount();
    }
}
