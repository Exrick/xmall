package cn.exrick.content.service.impl;

import cn.exrick.common.exception.XmallException;
import cn.exrick.common.pojo.DataTablesResult;
import cn.exrick.content.service.ContentService;
import cn.exrick.dto.ContentDto;
import cn.exrick.dto.DtoUtil;
import cn.exrick.mapper.TbContentCategoryMapper;
import cn.exrick.mapper.TbContentMapper;
import cn.exrick.pojo.TbContent;
import cn.exrick.pojo.TbContentCategory;
import cn.exrick.pojo.TbContentExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class ContentServiceImpl implements ContentService {

    @Autowired
    private TbContentMapper tbContentMapper;
    @Autowired
    private TbContentCategoryMapper tbContentCategoryMapper;

    @Override
    public int addContent(TbContent tbContent) {

        tbContent.setCreated(new Date());
        tbContent.setUpdated(new Date());
        if(tbContentMapper.insert(tbContent)!=1){
            throw new XmallException("添加内容失败");
        }
        return 1;
    }

    @Override
    public DataTablesResult getContentListByCid(Long cid) {

        DataTablesResult result=new DataTablesResult();
        List<ContentDto> list=new ArrayList<>();

        TbContentExample example=new TbContentExample();
        TbContentExample.Criteria criteria=example.createCriteria();
        //条件查询
        criteria.andCategoryIdEqualTo(cid);
        List<TbContent> listTbContent=tbContentMapper.selectByExample(example);

        TbContentCategory tbContentCategory=tbContentCategoryMapper.selectByPrimaryKey(cid);

        for(int i=0;i<listTbContent.size();i++){
            ContentDto contentDto= DtoUtil.TbContent2ContentDto(listTbContent.get(i));
            contentDto.setCategory(tbContentCategory.getName());
            list.add(contentDto);
        }

        result.setData(list);
        return result;
    }

    @Override
    public int deleteContent(Long id) {

        if(tbContentMapper.deleteByPrimaryKey(id)!=1){
            throw new XmallException("删除内容失败");
        }
        return 1;
    }

    @Override
    public int updateContent(TbContent tbContent) {

        TbContent old=getContentById(tbContent.getId());
        if(tbContent.getImage().isEmpty()){
            tbContent.setImage(old.getImage());
        }
        tbContent.setCreated(old.getCreated());
        tbContent.setUpdated(new Date());
        if(tbContentMapper.updateByPrimaryKey(tbContent)!=1){
            throw new XmallException("删除内容失败");
        }
        return 1;
    }

    @Override
    public TbContent getContentById(Long id) {

        TbContent tbContent=tbContentMapper.selectByPrimaryKey(id);
        if(tbContent==null){
            throw new XmallException("通过id获取内容失败");
        }
        return tbContent;
    }
}
