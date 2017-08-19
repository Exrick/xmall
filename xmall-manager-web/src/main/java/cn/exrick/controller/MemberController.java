package cn.exrick.controller;

import cn.exrick.common.utils.XMallResult;
import cn.exrick.pojo.DataTablesResult;
import cn.exrick.pojo.TbMember;
import cn.exrick.service.MemberService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


/**
 * Created by Exrick on 2017/8/11.
 */
@RestController
@Api(description= "会员列表信息")
public class MemberController {

    @Autowired
    private MemberService memberService;

    /**
     * 分页搜索查询会员
     * @param draw
     * @param start
     * @param length
     * @param search
     * @return
     */
    @RequestMapping(value = "/member/list",method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "分页搜索获取会员列表")
    public DataTablesResult getMemberList(int draw, int start, int length, @RequestParam("search[value]") String search){
        DataTablesResult result=memberService.getMemberList(draw,start,length,search);
        return result;
    }

    /**
     * 获得总会员数目
     * @return
     */
    @RequestMapping(value = "/member/count",method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "获得总会员数目")
    public DataTablesResult getMemberCount(){
        return memberService.getMemberCount();
    }

    /**
     * 添加会员
     * @param tbMember
     * @return
     */
    @RequestMapping(value = "/member/add",method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value = "添加会员")
    public XMallResult createMember(@RequestBody TbMember tbMember){
        System.out.println("收到请求");

        return null;
    }
}
