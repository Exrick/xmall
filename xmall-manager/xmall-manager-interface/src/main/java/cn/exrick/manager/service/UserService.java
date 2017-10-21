package cn.exrick.manager.service;

import cn.exrick.common.pojo.DataTablesResult;
import cn.exrick.manager.pojo.TbPermission;
import cn.exrick.manager.pojo.TbRole;
import cn.exrick.manager.pojo.TbShiroFilter;
import cn.exrick.manager.pojo.TbUser;

import java.security.Permission;
import java.util.List;
import java.util.Set;

/**
 * @author Exrickx
 */
public interface UserService {

    /**
     * 通过用户名获取用户
     * @param username
     * @return
     */
    TbUser getUserByUsername(String username);

    Set<String> getRoles(String userName);

    Set<String> getPermissions(String userName);

    DataTablesResult getRoleList();

    List<TbRole> getAllRoles();

    int addRole(TbRole tbRole);

    /**
     * 通过角色名获取角色
     * @param roleName
     * @return
     */
    TbRole getRoleByRoleName(String roleName);

    /**
     * 判断角色编辑名是否已存在
     * @param roleName
     * @return
     */
    boolean getRoleByEditName(int id,String roleName);

    int updateRole(TbRole tbRole);

    int deleteRole(int id);

    Long countRole();

    /**
     * 获得所有权限列表
     * @return
     */
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
