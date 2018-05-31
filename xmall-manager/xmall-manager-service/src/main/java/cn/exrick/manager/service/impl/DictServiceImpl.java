package cn.exrick.manager.service.impl;

import cn.exrick.common.constant.DictConstant;
import cn.exrick.manager.mapper.TbDictMapper;
import cn.exrick.manager.pojo.TbDict;
import cn.exrick.manager.pojo.TbDictExample;
import cn.exrick.manager.service.DictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Exrickx
 */
@Service
public class DictServiceImpl implements DictService {

    @Autowired
    private TbDictMapper tbDictMapper;

    @Override
    public List<TbDict> getDictList() {

        TbDictExample example=new TbDictExample();
        TbDictExample.Criteria criteria=example.createCriteria();
        //条件查询
        criteria.andTypeEqualTo(DictConstant.DICT_EXT);
        List<TbDict> list = tbDictMapper.selectByExample(example);
        return list;
    }

    @Override
    public List<TbDict> getStopList() {

        TbDictExample example=new TbDictExample();
        TbDictExample.Criteria criteria=example.createCriteria();
        //条件查询
        criteria.andTypeEqualTo(DictConstant.DICT_STOP);
        List<TbDict> list = tbDictMapper.selectByExample(example);
        return list;
    }

    @Override
    public int addDict(TbDict tbDict) {

        tbDictMapper.insert(tbDict);
        return 1;
    }

    @Override
    public int updateDict(TbDict tbDict) {

        tbDictMapper.updateByPrimaryKey(tbDict);
        return 1;
    }

    @Override
    public int delDict(int id) {

        tbDictMapper.deleteByPrimaryKey(id);
        return 1;
    }
}
