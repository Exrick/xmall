package cn.exrick.dto;

import cn.exrick.pojo.TbMember;

import java.util.Date;

/**
 * Created by Exrick on 2017/8/25.
 */
public class DtoUtil {

    public static TbMember MemberDto2Member(MemberDto memberDto){

        TbMember tbMember =new TbMember();

        if(!memberDto.getUsername().isEmpty()){
            tbMember.setUsername(memberDto.getUsername());
        }
        if(!memberDto.getPassword().isEmpty()){
            tbMember.setPassword(memberDto.getPassword());
        }
        if(!memberDto.getPhone().isEmpty()){
            tbMember.setPhone(memberDto.getPhone());
        }
        if(!memberDto.getEmail().isEmpty()){
            tbMember.setEmail(memberDto.getEmail());
        }
        if(!memberDto.getSex().isEmpty()){
            tbMember.setSex(memberDto.getSex());
        }
        if(!memberDto.getDescription().isEmpty()){
            tbMember.setDescription(memberDto.getDescription());
        }
        if(!memberDto.getProvince().isEmpty()&&!memberDto.getProvince().contains("-")){
            tbMember.setAddress(memberDto.getProvince()+" "
                    +memberDto.getCity()+" "+memberDto.getDistrict());
        }else{
            tbMember.setAddress(null);
        }

        return tbMember;
    }
}
