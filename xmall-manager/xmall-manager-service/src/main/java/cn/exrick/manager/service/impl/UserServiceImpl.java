package cn.exrick.manager.service.impl;

import cn.exrick.common.exception.XmallException;
import cn.exrick.manager.mapper.TbUserMapper;
import cn.exrick.manager.pojo.TbUser;
import cn.exrick.manager.pojo.TbUserExample;
import cn.exrick.manager.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

@Service
public class UserServiceImpl implements UserService {

    private static final Logger log= LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    private TbUserMapper tbUserMapper;

    @Override
    public TbUser getUserByUsername(String username) {

        List<TbUser> list;
        TbUserExample example=new TbUserExample();
        TbUserExample.Criteria criteria=example.createCriteria();
        criteria.andUsernameEqualTo(username);
        try {
            list=tbUserMapper.selectByExample(example);
        }catch (Exception e){
            throw new XmallException("通过ID获取用户信息失败");
        }
        if(!list.isEmpty()){
            return list.get(0);
        }
        return null;
    }

    @Override
    public Set<String> getRoles(String username) {

        return tbUserMapper.getRoles(username);
    }

    @Override
    public Set<String> getPermissions(String username) {

        return tbUserMapper.getPermissions(username);
    }

    @Override
    public int addUser(TbUser user) {
        return 0;
    }

    @Override
    public int updateUser(TbUser user) {
        return 0;
    }

    @Override
    public int deleteUser(Long userId) {
        return 0;
    }
}
