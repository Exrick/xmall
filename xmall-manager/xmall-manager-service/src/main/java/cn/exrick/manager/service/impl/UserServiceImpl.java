package cn.exrick.manager.service.impl;

import cn.exrick.common.exception.XmallException;
import cn.exrick.common.pojo.DataTablesResult;
import cn.exrick.manager.dto.RoleDto;
import cn.exrick.manager.mapper.TbPermissionMapper;
import cn.exrick.manager.mapper.TbRoleMapper;
import cn.exrick.manager.mapper.TbUserMapper;
import cn.exrick.manager.pojo.*;
import cn.exrick.manager.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.*;

@Service
public class UserServiceImpl implements UserService {

    private static final Logger log= LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    private TbUserMapper tbUserMapper;
    @Autowired
    private TbRoleMapper tbRoleMapper;
    @Autowired
    private TbPermissionMapper tbPermissionMapper;

    @Override
    public TbUser getUserByUsername(String username) {

        List<TbUser> list;
        TbUserExample example=new TbUserExample();
        TbUserExample.Criteria criteria=example.createCriteria();
        criteria.andUsernameEqualTo(username);
        criteria.andStateEqualTo(1);
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
    public DataTablesResult getRoleList() {

        DataTablesResult result=new DataTablesResult();
        List<RoleDto> list=new ArrayList<>();
        TbRoleExample example=new TbRoleExample();
        List<TbRole> listRole=tbRoleMapper.selectByExample(example);
        if(listRole==null){
            throw new XmallException("获取角色列表失败");
        }
        for(TbRole tbRole:listRole){
            RoleDto roleDto=new RoleDto();
            roleDto.setId(tbRole.getId());
            roleDto.setName(tbRole.getName());
            roleDto.setDesciption(tbRole.getDescription());

            TbPermissionExample example1=new TbPermissionExample();
            TbPermissionExample.Criteria criteria=example1.createCriteria();
            criteria.andRoleIdEqualTo(tbRole.getId());
            List<TbPermission> listPermission=tbPermissionMapper.selectByExample(example1);
            String names="";
            if(listPermission.size()>1){
                names+=listPermission.get(0).getName();
                for(int i=1;i<listPermission.size();i++){
                    names+="|"+listPermission.get(i).getName();
                }
            }else if(listPermission.size()==1){
                names+=listPermission.get(0).getName();
            }
            roleDto.setPermissions(names);

            list.add(roleDto);
        }
        result.setData(list);
        return result;
    }

    @Override
    public List<TbRole> getAllRoles() {

        TbRoleExample example=new TbRoleExample();
        List<TbRole> list=tbRoleMapper.selectByExample(example);
        if(list==null){
            throw new XmallException("获取所有角色列表失败");
        }
        return list;
    }

    @Override
    public int addRole(TbRole tbRole) {
        return 0;
    }

    @Override
    public int updateRole(TbRole tbRole) {
        return 0;
    }

    @Override
    public int deleteRole(int id) {

        List<String> list=tbRoleMapper.getUsedRoles(id);
        if(list!=null){
            return 0;
        }
        if(tbRoleMapper.deleteByPrimaryKey(id)!=1){
            throw new XmallException("删除角色失败");
        }
        return 1;
    }

    @Override
    public Long countRole() {

        TbRoleExample example=new TbRoleExample();
        Long result=tbRoleMapper.countByExample(example);
        return result;
    }

    @Override
    public DataTablesResult getPermissionList() {

        DataTablesResult result=new DataTablesResult();
        TbPermissionExample example=new TbPermissionExample();
        List<TbPermission> list=tbPermissionMapper.selectByExample(example);
        if(list==null){
            throw new XmallException("获取权限列表失败");
        }
        result.setData(list);
        return result;
    }

    @Override
    public int addPermission(TbPermission tbPermission) {

        if(tbPermissionMapper.insert(tbPermission)!=1){
            throw new XmallException("添加权限失败");
        }
        return 1;
    }

    @Override
    public int updatePermission(TbPermission tbPermission) {

        if(tbPermissionMapper.updateByPrimaryKey(tbPermission)!=1){
            throw new XmallException("更新权限失败");
        }
        return 1;
    }

    @Override
    public int deletePermission(int id) {

        if(tbPermissionMapper.deleteByPrimaryKey(id)!=1){
            throw new XmallException("删除权限失败");
        }
        return 1;
    }

    @Override
    public Long countPermission() {

        TbPermissionExample example=new TbPermissionExample();
        Long result=tbPermissionMapper.countByExample(example);
        return result;
    }

    @Override
    public DataTablesResult getUserList() {

        DataTablesResult result=new DataTablesResult();
        TbUserExample example=new TbUserExample();
        List<TbUser> list=tbUserMapper.selectByExample(example);
        if(list==null){
            throw new XmallException("获取用户列表失败");
        }
        for(TbUser tbUser:list){
            String names="";
            Iterator it=getRoles(tbUser.getUsername()).iterator();
            while (it.hasNext()){
                names+=it.next()+" ";
            }
            tbUser.setRoleNames(names);
        }
        result.setData(list);
        return result;
    }


    @Override
    public boolean getUserByName(String username) {

        TbUserExample example=new TbUserExample();
        TbUserExample.Criteria criteria=example.createCriteria();
        criteria.andUsernameEqualTo(username);
        List<TbUser> list=tbUserMapper.selectByExample(example);
        if(list.size()!=0){
            return false;
        }
        return true;
    }

    @Override
    public boolean getUserByPhone(String phone) {

        TbUserExample example=new TbUserExample();
        TbUserExample.Criteria criteria=example.createCriteria();
        criteria.andPhoneEqualTo(phone);
        List<TbUser> list=tbUserMapper.selectByExample(example);
        if(list.size()!=0){
            return false;
        }
        return true;
    }

    @Override
    public boolean getUserByEmail(String emaill) {

        TbUserExample example=new TbUserExample();
        TbUserExample.Criteria criteria=example.createCriteria();
        criteria.andEmailEqualTo(emaill);
        List<TbUser> list=tbUserMapper.selectByExample(example);
        if(list.size()!=0){
            return false;
        }
        return true;
    }

    @Override
    public int addUser(TbUser user) {

        if(!getUserByName(user.getUsername())){
            throw new XmallException("用户名已存在");
        }
        if(!getUserByPhone(user.getPhone())){
            throw new XmallException("手机号已存在");
        }
        if(!getUserByEmail(user.getEmail())){
            throw new XmallException("邮箱已存在");
        }
        String md5Pass = DigestUtils.md5DigestAsHex(user.getPassword().getBytes());
        user.setPassword(md5Pass);
        user.setState(1);
        user.setCreated(new Date());
        user.setUpdated(new Date());
        if(tbUserMapper.insert(user)!=1){
            throw new XmallException("添加用户失败");
        }
        return 1;
    }

    @Override
    public TbUser getUserById(Long id) {

        TbUser tbUser=tbUserMapper.selectByPrimaryKey(id);
        if(tbUser==null){
            throw new XmallException("通过ID获取用户失败");
        }
        return tbUser;
    }

    @Override
    public int updateUser(TbUser user) {

        TbUser old=getUserByUsername(user.getUsername());
        user.setPassword(old.getPassword());
        user.setState(old.getState());
        user.setCreated(old.getCreated());
        user.setUpdated(new Date());
        if(tbUserMapper.updateByPrimaryKey(user)!=1){
            throw new XmallException("更新用户失败");
        }
        return 1;
    }

    @Override
    public int changeUserState(Long id,int state) {

        TbUser tbUser=tbUserMapper.selectByPrimaryKey(id);
        tbUser.setState(state);
        tbUser.setUpdated(new Date());
        if(tbUserMapper.updateByPrimaryKey(tbUser)!=1){
            throw new XmallException("更新用户状态失败");
        }
        return 1;
    }

    @Override
    public int changePassword(TbUser tbUser) {

        TbUser old=tbUserMapper.selectByPrimaryKey(tbUser.getId());
        old.setUpdated(new Date());
        String md5Pass = DigestUtils.md5DigestAsHex(tbUser.getPassword().getBytes());
        old.setPassword(md5Pass);
        if(tbUserMapper.updateByPrimaryKey(old)!=1){
            throw new XmallException("修改用户密码失败");
        }
        return 1;
    }

    @Override
    public boolean getUserByEditName(Long id,String username) {

        TbUser tbUser=getUserById(id);
        boolean result=true;
        if(tbUser.getUsername()==null||!tbUser.getUsername().equals(username)){
            result=getUserByName(username);
        }
        return result;
    }

    @Override
    public boolean getUserByEditPhone(Long id,String phone) {

        TbUser tbUser=getUserById(id);
        boolean result=true;
        if(tbUser.getPhone()==null||!tbUser.getPhone().equals(phone)){
            result=getUserByPhone(phone);
        }
        return result;
    }

    @Override
    public boolean getUserByEditEmail(Long id,String email) {

        TbUser tbUser=getUserById(id);
        boolean result=true;
        if(tbUser.getEmail()==null||!tbUser.getEmail().equals(email)){
            result=getUserByEmail(email);
        }
        return result;
    }

    @Override
    public int deleteUser(Long userId) {

        if(tbUserMapper.deleteByPrimaryKey(userId)!=1){
            throw new XmallException("删除用户失败");
        }
        return 1;
    }

    @Override
    public Long countUser() {

        TbUserExample example=new TbUserExample();
        Long result=tbUserMapper.countByExample(example);
        return result;
    }
}
