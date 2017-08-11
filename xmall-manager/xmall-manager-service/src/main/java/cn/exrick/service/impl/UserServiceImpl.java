package cn.exrick.service.impl;

import cn.exrick.mapper.TbUserMapper;
import cn.exrick.pojo.*;
import cn.exrick.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Exrick on 2017/8/11.
 */
@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private TbUserMapper tbUserMapper;

    @Override
    public DataTablesResult getUserList(int draw, int start, int length, String search) {
        DataTablesResult result=new DataTablesResult();

        //分页
        PageHelper.startPage(start/length+1,length);

        //执行查询返回结果
        TbUserExample example=new TbUserExample();
        List<TbUser> list;
        PageInfo<TbUser> pageInfo;

        //无过滤搜索
        list = tbUserMapper.selectByExample(example);
        pageInfo=new PageInfo<>(list);
        result.setRecordsTotal((int)pageInfo.getTotal());
        result.setRecordsFiltered((int)pageInfo.getTotal());

        //搜索
        if(search!=null&&!search.isEmpty()){
            PageHelper.startPage(start/length+1,length);
            list = tbUserMapper.selectByUserInformation("%"+search+"%");
            pageInfo=new PageInfo<>(list);
            result.setRecordsFiltered((int)pageInfo.getTotal());
        }

        result.setDraw(draw);
        result.setData(list);

        return result;
    }
}
