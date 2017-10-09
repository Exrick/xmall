package cn.exrick.sso.service;


import cn.exrick.manager.dto.front.Member;

public interface LoginService {

    Member userLogin(String username, String password);

    Member getUserByToken(String token);

    int logout(String token);
}
