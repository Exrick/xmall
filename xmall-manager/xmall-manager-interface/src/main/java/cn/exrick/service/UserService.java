package cn.exrick.service;

import cn.exrick.pojo.DataTablesResult;

/**
 * Created by Exrick on 2017/8/11.
 */
public interface UserService {

    /**
     * 分页获得会员列表
     * @param draw
     * @param start
     * @param length
     * @param search
     * @return
     */
    DataTablesResult getUserList(int draw, int start, int length, String search);
}
