package cn.exrick.sso.service.impl;

import cn.exrick.common.exception.XmallException;
import cn.exrick.common.jedis.JedisClient;
import cn.exrick.common.utils.QiniuUtil;
import cn.exrick.manager.dto.front.Member;
import cn.exrick.manager.mapper.TbMemberMapper;
import cn.exrick.manager.pojo.TbMember;
import cn.exrick.sso.service.LoginService;
import cn.exrick.sso.service.MemberService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private LoginService loginService;
    @Autowired
    private TbMemberMapper tbMemberMapper;
    @Autowired
    private JedisClient jedisClient;
    @Value("${SESSION_EXPIRE}")
    private Integer SESSION_EXPIRE;

    @Override
    public String imageUpload(Long userId,String token,String imgData) {

        //过滤data:URL
        String base64=QiniuUtil.base64Data(imgData);
        String imgPath= QiniuUtil.qiniuBase64Upload(base64);

        TbMember tbMember=tbMemberMapper.selectByPrimaryKey(userId);
        if(tbMember==null){
            throw new XmallException("通过id获取用户失败");
        }
        tbMember.setFile(imgPath);
        if(tbMemberMapper.updateByPrimaryKey(tbMember)!=1){
            throw new XmallException("更新用户头像失败");
        }

        //更新缓存
        Member member=loginService.getUserByToken(token);
        member.setFile(imgPath);
        jedisClient.set("SESSION:" + token, new Gson().toJson(member));
        return imgPath;
    }
}
