package cn.exrick.manager.service.impl;

import cn.exrick.common.pojo.DataTablesResult;
import cn.exrick.manager.dto.DtoUtil;
import cn.exrick.manager.dto.MemberDto;
import cn.exrick.common.exception.XmallException;
import cn.exrick.manager.mapper.TbMemberMapper;
import cn.exrick.manager.pojo.TbMember;
import cn.exrick.manager.pojo.TbMemberExample;
import cn.exrick.manager.service.MemberService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.Date;
import java.util.List;

/**
 *
 * @author Exrick
 * @date 2017/8/11
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
        tbMember.setPassword("");
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

            for(TbMember tbMember:list){
                tbMember.setPassword("");
            }

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

            for(TbMember tbMember:list){
                tbMember.setPassword("");
            }

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
            list.get(0).setPassword("");
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
            list.get(0).setPassword("");
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
            list.get(0).setPassword("");
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

        if(getMemberByUsername(tbMember.getUsername())!=null){
            throw new XmallException("用户名已被注册");
        }
        if(getMemberByPhone(tbMember.getPhone())!=null){
            throw new XmallException("手机号已被注册");
        }
        if(getMemberByEmail(tbMember.getEmail())!=null){
            throw new XmallException("邮箱已被注册");
        }

        tbMember.setState(1);
        tbMember.setCreated(new Date());
        tbMember.setUpdated(new Date());
        String md5Pass = DigestUtils.md5DigestAsHex(tbMember.getPassword().getBytes());
        tbMember.setPassword(md5Pass);

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
        }else{
            String md5Pass = DigestUtils.md5DigestAsHex(tbMember.getPassword().getBytes());
            tbMember.setPassword(md5Pass);
        }

        if (tbMemberMapper.updateByPrimaryKey(tbMember) != 1){
            throw new XmallException("更新会员信息失败");
        }
        return getMemberById(id);
    }

    @Override
    public TbMember changePassMember(Long id, MemberDto memberDto) {

        TbMember tbMember=tbMemberMapper.selectByPrimaryKey(id);

        String md5Pass = DigestUtils.md5DigestAsHex(memberDto.getPassword().getBytes());
        tbMember.setPassword(md5Pass);
        tbMember.setUpdated(new Date());

        if (tbMemberMapper.updateByPrimaryKey(tbMember) != 1){
            throw new XmallException("修改会员密码失败");
        }
        return getMemberById(id);
    }

    @Override
    public TbMember alertMemberState(Long id,Integer state) {

        TbMember tbMember = tbMemberMapper.selectByPrimaryKey(id);
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

    @Override
    public TbMember getMemberByEditEmail(Long id,String email) {

        TbMember tbMember=getMemberById(id);
        TbMember newTbMember=null;
        if(tbMember.getEmail()==null||!tbMember.getEmail().equals(email)){
            newTbMember=getMemberByEmail(email);
        }
        newTbMember.setPassword("");
        return newTbMember;
    }

    @Override
    public TbMember getMemberByEditPhone(Long id,String phone) {

        TbMember tbMember=getMemberById(id);
        TbMember newTbMember=null;
        if(tbMember.getPhone()==null||!tbMember.getPhone().equals(phone)){
            newTbMember=getMemberByPhone(phone);
        }
        newTbMember.setPassword("");
        return newTbMember;
    }

    @Override
    public TbMember getMemberByEditUsername(Long id,String username) {

        TbMember tbMember=getMemberById(id);
        TbMember newTbMember=null;
        if(tbMember.getUsername()==null||!tbMember.getUsername().equals(username)){
            newTbMember=getMemberByUsername(username);
        }
        newTbMember.setPassword("");
        return newTbMember;
    }
}
