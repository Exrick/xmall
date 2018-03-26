package cn.exrick.manager.service;

import cn.exrick.common.pojo.DataTablesResult;
import cn.exrick.manager.pojo.TbPermission;
import cn.exrick.manager.pojo.TbRole;
import cn.exrick.manager.pojo.TbUser;

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

    /**
     * 通过用户名获取角色
     * @param username
     * @return
     */
    Set<String> getRoles(String username);

    /**
     * 通过用户名获取权限
     * @param username
     * @return
     */
    Set<String> getPermissions(String username);

    /**
     * 获取角色列表
     * @return
     */
    DataTablesResult getRoleList();

    /**
     * 获取所有角色
     * @return
     */
    List<TbRole> getAllRoles();

    /**
     * 添加角色
     * @param tbRole
     * @return
     */
    int addRole(TbRole tbRole);

    /**
     * 通过角色名获取角色
     * @param roleName
     * @return
     */
    TbRole getRoleByRoleName(String roleName);

    /**
     * 判断角色编辑名是否已存在
     * @param id
     * @param roleName
     * @return
     */
    boolean getRoleByEditName(int id,String roleName);

    /**
     * 更新角色
     * @param tbRole
     * @return
     */
    int updateRole(TbRole tbRole);

    /**
     * 删除角色
     * @param id
     * @return
     */
    int deleteRole(int id);

    /**
     * 统计角色数
     * @return
     */
    Long countRole();

    /**
     * 获得所有权限列表
     * @return
     */
    DataTablesResult getPermissionList();

    /**
     * 添加权限
     * @param tbPermission
     * @return
     */
    int addPermission(TbPermission tbPermission);

    /**
     * 更新权限
     * @param tbPermission
     * @return
     */
    int updatePermission(TbPermission tbPermission);

    /**
     * 删除权限
     * @param id
     * @return
     */
    int deletePermission(int id);

    /**
     * 统计权限
     * @return
     */
    Long countPermission();

    /**
     * 获取用户列表
     * @return
     */
    DataTablesResult getUserList();

    /**
     * 添加管理员
     * @param user
     * @return
     */
    int addUser(TbUser user);

    /**
     * 通过id获取
     * @param id
     * @return
     */
    TbUser getUserById(Long id);

    /**
     * 通过用户名获取
     * @param username
     * @return
     */
    boolean getUserByName(String username);

    /**
     * 通过手机获取
     * @param phone
     * @return
     */
    boolean getUserByPhone(String phone);

    /**
     * 通过邮件获取
     * @param emaill
     * @return
     */
    boolean getUserByEmail(String emaill);

    /**
     * 更新用户
     * @param user
     * @return
     */
    int updateUser(TbUser user);

    /**
     * 更改状态
     * @param id
     * @param state
     * @return
     */
    int changeUserState(Long id,int state);

    /**
     * 修改密码
     * @param tbUser
     * @return
     */
    int changePassword(TbUser tbUser);

    /**
     * 判断编辑用户名
     * @param id
     * @param username
     * @return
     */
    boolean getUserByEditName(Long id,String username);

    /**
     * 判断编辑手机
     * @param id
     * @param phone
     * @return
     */
    boolean getUserByEditPhone(Long id,String phone);

    /**
     * 判断编辑邮箱
     * @param id
     * @param emaill
     * @return
     */
    boolean getUserByEditEmail(Long id,String emaill);

    /**
     * 删除管理员
     * @param userId
     * @return
     */
    int deleteUser(Long userId);

    /**
     * 统计管理员
     * @return
     */
    Long countUser();
}
