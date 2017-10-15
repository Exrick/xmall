package cn.exrick.manager.service;

import cn.exrick.manager.pojo.TbUser;

import java.util.Set;

public interface UserService {

    TbUser getUserByUsername(String username);

    Set<String> getRoles(String userName);

    Set<String> getPermissions(String userName);

    int addUser(TbUser user);

    int updateUser(TbUser user);

    int deleteUser(Long userId);
}
