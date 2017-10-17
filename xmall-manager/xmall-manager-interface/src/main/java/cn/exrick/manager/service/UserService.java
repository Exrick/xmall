package cn.exrick.manager.service;

import cn.exrick.common.pojo.DataTablesResult;
import cn.exrick.manager.pojo.TbPermission;
import cn.exrick.manager.pojo.TbRole;
import cn.exrick.manager.pojo.TbUser;

import java.util.List;
import java.util.Set;

public interface UserService {

    TbUser getUserByUsername(String username);

    Set<String> getRoles(String userName);

    Set<String> getPermissions(String userName);

    DataTablesResult getRoleList();

    List<TbRole> getAllRoles();

    int addRole(TbRole tbRole);

    int updateRole(TbRole tbRole);

    int deleteRole(int id);

    Long countRole();

    DataTablesResult getPermissionList();

    int addPermission(TbPermission tbPermission);

    int updatePermission(TbPermission tbPermission);

    int deletePermission(int id);

    Long countPermission();

    DataTablesResult getUserList();

    int addUser(TbUser user);

    TbUser getUserById(Long id);

    boolean getUserByName(String username);

    boolean getUserByPhone(String phone);

    boolean getUserByEmail(String emaill);

    int updateUser(TbUser user);

    int changeUserState(Long id,int state);

    int changePassword(TbUser tbUser);

    boolean getUserByEditName(Long id,String username);

    boolean getUserByEditPhone(Long id,String phone);

    boolean getUserByEditEmail(Long id,String emaill);

    int deleteUser(Long userId);

    Long countUser();
}
