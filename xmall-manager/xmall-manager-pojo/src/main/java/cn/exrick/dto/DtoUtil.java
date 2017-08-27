package cn.exrick.dto;

import cn.exrick.pojo.TbMember;

import java.util.Date;

/**
 * Created by Exrick on 2017/8/25.
 */
public class DtoUtil {

    public static TbMember MemberDto2Member(MemberDto memberDto){

        TbMember tbMember =new TbMember();

        tbMember.setUsername(memberDto.getUsername());
        tbMember.setPhone(memberDto.getPhone());
        tbMember.setEmail(memberDto.getEmail());
        tbMember.setPassword(memberDto.getPassword());
        tbMember.setSex(memberDto.getSex());
        if(!memberDto.getProvince().isEmpty()){
            tbMember.setAddress(memberDto.getProvince()+" "
                    +memberDto.getCity()+" "+memberDto.getDistrict());
        }

        return tbMember;
    }
}
