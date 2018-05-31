package cn.exrick.sso.service;


import cn.exrick.manager.dto.front.Member;

/**
 * @author Exrickx
 */
public interface LoginService {

    /**
     * 登录
     * @param username
     * @param password
     * @return
     */
    Member userLogin(String username, String password);

    /**
     * 通过token获取
     * @param token
     * @return
     */
    Member getUserByToken(String token);

    /**
     * 注销
     * @param token
     * @return
     */
    int logout(String token);
}
