package cn.exrick.service;

import cn.exrick.pojo.DataTablesResult;

/**
 * Created by Exrick on 2017/8/11.
 */
public interface MemberService {

    /**
     * 分页获得会员列表
     * @param draw
     * @param start
     * @param length
     * @param search
     * @return
     */
    DataTablesResult getMemberList(int draw, int start, int length, String search);

    /**
     * 获得所有用户总数
     * @return
     */
    DataTablesResult getMemberCount();
}
