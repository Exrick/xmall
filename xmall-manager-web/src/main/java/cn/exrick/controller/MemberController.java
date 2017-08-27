package cn.exrick.controller;

import cn.exrick.common.pojo.Result;
import cn.exrick.common.utils.ResultUtil;
import cn.exrick.dto.MemberDto;
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
    @ApiOperation(value = "分页搜索获取会员列表")
    public DataTablesResult getMemberList(int draw, int start, int length, @RequestParam("search[value]") String search){
        DataTablesResult result=memberService.getMemberList(draw,start,length,search);
        return result;
    }

    @RequestMapping(value = "/member/list/del",method = RequestMethod.GET)
    @ApiOperation(value = "分页搜索获取已删除会员列表")
    public DataTablesResult getDelMemberList(int draw, int start, int length, @RequestParam("search[value]") String search){
        DataTablesResult result=memberService.getRemoveMemberList(draw,start,length,search);
        return result;
    }

    /**
     * 获得总会员数目
     * @return
     */
    @RequestMapping(value = "/member/count",method = RequestMethod.GET)
    @ApiOperation(value = "获得总会员数目")
    public DataTablesResult getMemberCount(){
        return memberService.getMemberCount();
    }

    /**
     * 获得已移除总会员数目
     * @return
     */
    @RequestMapping(value = "/member/count/remove",method = RequestMethod.GET)
    @ApiOperation(value = "获得总会员数目")
    public DataTablesResult getRemoveMemberCount(){
        return memberService.getRemoveMemberCount();
    }

    /**
     * 添加会员
     * @param memberDto
     * @return
     */
    @RequestMapping(value = "/member/add",method = RequestMethod.POST)
    @ApiOperation(value = "添加会员")
    public Result<TbMember> createMember(@ModelAttribute MemberDto memberDto){
        TbMember newTbMember = memberService.addMember(memberDto);
        return new ResultUtil<TbMember>().setData(newTbMember);
    }

    @RequestMapping(value = "/member/stop/{id}",method = RequestMethod.PUT)
    @ApiOperation(value = "停用会员")
    public Result<TbMember> stopMember(@PathVariable Long id){
        TbMember newTbMember = memberService.alertMemberState(id,0);
        return new ResultUtil<TbMember>().setData(newTbMember);
    }

    @RequestMapping(value = "/member/start/{id}",method = RequestMethod.PUT)
    @ApiOperation(value = "启用会员")
    public Result<TbMember> startMember(@PathVariable Long id){
        TbMember newTbMember = memberService.alertMemberState(id,1);
        return new ResultUtil<TbMember>().setData(newTbMember);
    }

    @RequestMapping(value = "/member/remove/{id}",method = RequestMethod.PUT)
    @ApiOperation(value = "移除会员")
    public Result<TbMember> removeMember(@PathVariable Long id){
        TbMember newTbMember = memberService.alertMemberState(id,2);
        return new ResultUtil<TbMember>().setData(newTbMember);
    }

    @RequestMapping(value = "/member/del/{id}",method = RequestMethod.DELETE)
    @ApiOperation(value = "彻底删除会员")
    public Result<TbMember> deleteMember(@PathVariable Long id){
        memberService.deleteMember(id);
        return new ResultUtil<TbMember>().setData(null);
    }
}
