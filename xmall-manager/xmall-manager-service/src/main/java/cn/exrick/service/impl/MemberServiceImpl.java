package cn.exrick.service.impl;

import cn.exrick.mapper.TbMemberMapper;
import cn.exrick.pojo.*;
import cn.exrick.service.MemberService;
import cn.exrick.service.exception.XMallException;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Exrick on 2017/8/11.
 */
@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private TbMemberMapper tbMemberMapper;

    @Override
    public DataTablesResult getMemberList(int draw, int start, int length, String search) {
        DataTablesResult result=new DataTablesResult();

        try{
            //分页
            PageHelper.startPage(start/length+1,length);

            //执行查询返回结果
            TbMemberExample example=new TbMemberExample();
            List<TbMember> list;
            PageInfo<TbMember> pageInfo;

            //无过滤搜索
            list = tbMemberMapper.selectByExample(example);
            pageInfo=new PageInfo<>(list);
            result.setRecordsTotal((int)pageInfo.getTotal());
            result.setRecordsFiltered((int)pageInfo.getTotal());

            //搜索
            if(search!=null&&!search.isEmpty()){
                PageHelper.startPage(start/length+1,length);
                list = tbMemberMapper.selectByMemberInformation("%"+search+"%");
                pageInfo=new PageInfo<>(list);
                result.setRecordsFiltered((int)pageInfo.getTotal());
            }

            result.setDraw(draw);
            result.setData(list);
        }catch (Exception e){
            throw new XMallException("加载用户列表失败");
        }

        return result;
    }

    @Override
    public DataTablesResult getMemberCount(){
        DataTablesResult result=new DataTablesResult();
        TbMemberExample example=new TbMemberExample();
        try{
            result.setRecordsTotal((int)tbMemberMapper.countByExample(example));
        }catch (Exception e){
            throw new XMallException("统计用户数失败");
        }

        return result;
    }
}
