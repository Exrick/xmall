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
        tbMember.setPassword(memberDto.getPassword());
        tbMember.setPhone(memberDto.getPhone());
        tbMember.setEmail(memberDto.getEmail());
        tbMember.setSex(memberDto.getSex());
        if(!memberDto.getProvince().isEmpty()&&!memberDto.getProvince().contains("-")){
            tbMember.setAddress(memberDto.getProvince()+" "
                    +memberDto.getCity()+" "+memberDto.getDistrict());
        }else{
            tbMember.setAddress(null);
        }

        return tbMember;
    }
}
