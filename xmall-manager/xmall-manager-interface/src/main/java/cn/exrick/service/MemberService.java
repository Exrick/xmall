package cn.exrick.service;

import cn.exrick.dto.MemberDto;
import cn.exrick.pojo.DataTablesResult;
import cn.exrick.pojo.TbMember;

/**
 * Created by Exrick on 2017/8/11.
 */
public interface MemberService {

    /**
     * 根据ID获取会员信息
     * @param memberId
     * @return
     */
    TbMember getMemberById(long memberId);

    /**
     * 分页获得会员列表
     * @param draw
     * @param start
     * @param length
     * @param search
     * @return
     */
    DataTablesResult getMemberList(int draw, int start, int length, String search);

    //获得删除会员列表
    DataTablesResult getRemoveMemberList(int draw, int start, int length, String search);

    /**
     * 获得所有会员总数
     * @return
     */
    DataTablesResult getMemberCount();

    DataTablesResult getRemoveMemberCount();

    TbMember getMemberByEmail(String email);

    TbMember getMemberByPhone(String phone);

    TbMember getMemberByUsername(String username);

    /**
     * 添加会员
     * @param memberDto
     * @return
     */
    TbMember addMember(MemberDto memberDto);

    /**
     * 更新会员
     * @param id
     * @param memberDto
     * @return
     */
    TbMember updateMember(Long id,MemberDto memberDto);

    /**
     * 修改会员状态
     * @param id
     * @return
     */
    TbMember alertMemberState(Long id,Integer state);

    int deleteMember(Long id);
}
