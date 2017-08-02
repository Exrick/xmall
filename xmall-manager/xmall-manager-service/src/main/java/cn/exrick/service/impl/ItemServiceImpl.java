package cn.exrick.service.impl;

import cn.exrick.mapper.TbItemMapper;
import cn.exrick.pojo.DataTablesResult;
import cn.exrick.pojo.TbItem;
import cn.exrick.pojo.TbItemExample;
import cn.exrick.service.ItemService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Exrick on 2017/7/29.
 */
@Service
public class ItemServiceImpl implements ItemService {

    @Autowired
    private TbItemMapper tbItemMapper;

    @Override
    public TbItem getItemById(long itemId) {
        //根据主键查询
        return tbItemMapper.selectByPrimaryKey(itemId);
    }

    @Override
    public DataTablesResult getItemList(int draw,int start,int length,String search) {

        DataTablesResult result=new DataTablesResult();

        //分页
        PageHelper.startPage(start/length+1,length);

        //执行查询返回结果
        TbItemExample example=new TbItemExample();
        List<TbItem> list;
        PageInfo<TbItem> pageInfo;

        //无过滤搜索
        list = tbItemMapper.selectByExample(example);
        pageInfo=new PageInfo<>(list);
        result.setRecordsTotal((int)pageInfo.getTotal());
        result.setRecordsFiltered((int)pageInfo.getTotal());

        //搜索
        if(search!=null&&!search.isEmpty()){
            PageHelper.startPage(start/length+1,length);
            list = tbItemMapper.selectByItemTitleAndDescription("%"+search+"%");
            pageInfo=new PageInfo<>(list);
            result.setRecordsFiltered((int)pageInfo.getTotal());
        }

        result.setDraw(draw);
        result.setData(list);

        return result;
    }

    @Override
    public DataTablesResult getAllItemCount() {
        TbItemExample example=new TbItemExample();
        List<TbItem> list = tbItemMapper.selectByExample(example);
        DataTablesResult result=new DataTablesResult();
        result.setRecordsTotal(list.size());
        return result;
    }


}
