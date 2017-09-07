package cn.exrick.service.impl;

import cn.exrick.dto.DtoUtil;
import cn.exrick.dto.MemberDto;
import cn.exrick.mapper.TbMemberMapper;
import cn.exrick.pojo.*;
import cn.exrick.service.MemberService;
import cn.exrick.common.exception.XmallException;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by Exrick on 2017/8/11.
 */
@Service
public class MemberServiceImpl implements MemberService {

    final static Logger log= LoggerFactory.getLogger(MemberServiceImpl.class);

    @Autowired
    private TbMemberMapper tbMemberMapper;

    @Override
    public TbMember getMemberById(long memberId) {

        TbMember tbMember;
        try {
            tbMember=tbMemberMapper.selectByPrimaryKey(memberId);
        }catch (Exception e){
            throw new XmallException("ID获取会员信息失败");
        }
        return tbMember;
    }

    @Override
    public DataTablesResult getMemberList(int draw, int start, int length, String search,
                                          String minDate, String maxDate, String orderCol, String orderDir) {

        DataTablesResult result=new DataTablesResult();

        try{
            //分页
            PageHelper.startPage(start/length+1,length);
            List<TbMember> list = tbMemberMapper.selectByMemberInfo("%"+search+"%",minDate,maxDate,orderCol,orderDir);
            PageInfo<TbMember> pageInfo=new PageInfo<>(list);
            result.setRecordsFiltered((int)pageInfo.getTotal());
            result.setRecordsTotal(getMemberCount().getRecordsTotal());

            result.setDraw(draw);
            result.setData(list);
        }catch (Exception e){
            throw new XmallException("加载用户列表失败");
        }

        return result;
    }

    @Override
    public DataTablesResult getRemoveMemberList(int draw, int start, int length, String search,
                                                String minDate, String maxDate, String orderCol, String orderDir) {

        DataTablesResult result=new DataTablesResult();

        try{
            //分页执行查询返回结果
            PageHelper.startPage(start/length+1,length);
            List<TbMember> list = tbMemberMapper.selectByRemoveMemberInfo("%"+search+"%",minDate,maxDate,orderCol,orderDir);
            PageInfo<TbMember> pageInfo=new PageInfo<>(list);
            result.setRecordsFiltered((int)pageInfo.getTotal());
            result.setRecordsTotal(getRemoveMemberCount().getRecordsTotal());

            result.setDraw(draw);
            result.setData(list);
        }catch (Exception e){
            throw new XmallException("加载删除用户列表失败");
        }

        return result;
    }

    @Override
    public TbMember getMemberByUsername(String username) {

        List<TbMember> list;
        TbMemberExample example=new TbMemberExample();
        TbMemberExample.Criteria criteria=example.createCriteria();
        criteria.andUsernameEqualTo(username);
        try {
            list=tbMemberMapper.selectByExample(example);
        }catch (Exception e){
            throw new XmallException("ID获取会员信息失败");
        }
        if(!list.isEmpty()){
            return list.get(0);
        }
        return null;
    }

    @Override
    public TbMember getMemberByPhone(String phone) {

        List<TbMember> list;
        TbMemberExample example=new TbMemberExample();
        TbMemberExample.Criteria criteria=example.createCriteria();
        criteria.andPhoneEqualTo(phone);
        try {
            list=tbMemberMapper.selectByExample(example);
        }catch (Exception e){
            throw new XmallException("Phone获取会员信息失败");
        }
        if(!list.isEmpty()){
            return list.get(0);
        }
        return null;
    }

    @Override
    public TbMember getMemberByEmail(String email) {

        List<TbMember> list;
        TbMemberExample example=new TbMemberExample();
        TbMemberExample.Criteria criteria=example.createCriteria();
        criteria.andEmailEqualTo(email);
        try {
            list=tbMemberMapper.selectByExample(example);
        }catch (Exception e){
            throw new XmallException("Email获取会员信息失败");
        }
        if(!list.isEmpty()){
            return list.get(0);
        }
        return null;
    }

    @Override
    public DataTablesResult getMemberCount(){

        DataTablesResult result=new DataTablesResult();
        TbMemberExample example=new TbMemberExample();
        TbMemberExample.Criteria criteria=example.createCriteria();
        criteria.andStateNotEqualTo(2);
        try{
            result.setRecordsTotal((int)tbMemberMapper.countByExample(example));
        }catch (Exception e){
            throw new XmallException("统计会员数失败");
        }

        return result;
    }

    @Override
    public DataTablesResult getRemoveMemberCount(){

        DataTablesResult result=new DataTablesResult();
        TbMemberExample example=new TbMemberExample();
        TbMemberExample.Criteria criteria=example.createCriteria();
        criteria.andStateEqualTo(2);
        try{
            result.setRecordsTotal((int)tbMemberMapper.countByExample(example));
        }catch (Exception e){
            throw new XmallException("统计移除会员数失败");
        }

        return result;
    }

    @Override
    public TbMember addMember(MemberDto memberDto) {

        TbMember tbMember= DtoUtil.MemberDto2Member(memberDto);

        tbMember.setState(1);
        tbMember.setCreated(new Date());
        tbMember.setUpdated(new Date());

        if(getMemberByPhone(tbMember.getPhone())!=null){
            throw new XmallException("手机号已被注册");
        }
        if(getMemberByEmail(tbMember.getEmail())!=null){
            throw new XmallException("邮箱已被注册");
        }

        if(tbMemberMapper.insert(tbMember)!=1){
            throw new XmallException("添加用户失败");
        }
        return getMemberByPhone(tbMember.getPhone());
    }

    @Override
    public TbMember updateMember(Long id,MemberDto memberDto) {

        TbMember tbMember = DtoUtil.MemberDto2Member(memberDto);
        tbMember.setId(id);
        tbMember.setUpdated(new Date());
        TbMember oldMember=getMemberById(id);
        tbMember.setState(oldMember.getState());
        tbMember.setCreated(oldMember.getCreated());
        if(tbMember.getPassword()==null||tbMember.getPassword()==""){
            tbMember.setPassword(oldMember.getPassword());
        }

        if (tbMemberMapper.updateByPrimaryKey(tbMember) != 1){
            throw new XmallException("更新会员信息失败");
        }
        return getMemberById(id);
    }

    @Override
    public TbMember alertMemberState(Long id,Integer state) {

        TbMember tbMember = getMemberById(id);
        tbMember.setState(state);
        tbMember.setUpdated(new Date());

        if (tbMemberMapper.updateByPrimaryKey(tbMember) != 1){
            throw new XmallException("修改会员状态失败");
        }
        return getMemberById(id);
    }

    @Override
    public int deleteMember(Long id) {

        if(tbMemberMapper.deleteByPrimaryKey(id)!=1){
            throw new XmallException("删除会员失败");
        }
        return 0;
    }
}
