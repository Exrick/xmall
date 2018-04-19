package cn.exrick.content.service.impl;

import cn.exrick.common.exception.XmallException;
import cn.exrick.common.jedis.JedisClient;
import cn.exrick.common.pojo.ZTreeNode;
import cn.exrick.content.service.PanelService;
import cn.exrick.manager.dto.DtoUtil;
import cn.exrick.manager.mapper.TbPanelMapper;
import cn.exrick.manager.pojo.TbPanelExample;
import cn.exrick.manager.pojo.TbPanel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author Exrickx
 */
@Service
public class PanelServiceImpl implements PanelService {

    private final static Logger log= LoggerFactory.getLogger(PanelServiceImpl.class);

    @Autowired
    private TbPanelMapper tbPanelMapper;
    @Autowired
    private JedisClient jedisClient;

    @Value("${PRODUCT_HOME}")
    private String PRODUCT_HOME;

    @Override
    public TbPanel getTbPanelById(int id) {

        TbPanel tbPanel=tbPanelMapper.selectByPrimaryKey(id);
        if(tbPanel==null){
            throw new XmallException("通过id获得板块失败");
        }
        return tbPanel;
    }

    @Override
    public List<ZTreeNode> getPanelList(int position, boolean showAll) {

        TbPanelExample example=new TbPanelExample();
        TbPanelExample.Criteria criteria=example.createCriteria();
        if(position==0&&!showAll){
            //除去非轮播
            criteria.andTypeNotEqualTo(0);
        }else if(position==-1){
            //仅含轮播
            position=0;
            criteria.andTypeEqualTo(0);
        }
        //首页板块
        criteria.andPositionEqualTo(position);
        example.setOrderByClause("sort_order");
        List<TbPanel> panelList=tbPanelMapper.selectByExample(example);

        List<ZTreeNode> list=new ArrayList<>();

        for(TbPanel tbPanel:panelList){
            ZTreeNode zTreeNode= DtoUtil.TbPanel2ZTreeNode(tbPanel);
            list.add(zTreeNode);
        }

        return list;
    }

    @Override
    public int addPanel(TbPanel tbPanel) {

        if(tbPanel.getType()==0){
            TbPanelExample example=new TbPanelExample();
            TbPanelExample.Criteria criteria=example.createCriteria();
            criteria.andTypeEqualTo(0);
            List<TbPanel> list = tbPanelMapper.selectByExample(example);
            if(list!=null&&list.size()>0){
                throw new XmallException("已有轮播图板块,轮播图仅能添加1个!");
            }
        }

        tbPanel.setCreated(new Date());
        tbPanel.setUpdated(new Date());

        if(tbPanelMapper.insert(tbPanel)!=1){
            throw new XmallException("添加板块失败");
        }
        //同步缓存
        deleteHomeRedis();
        return 1;
    }

    @Override
    public int updatePanel(TbPanel tbPanel) {

        TbPanel old=getTbPanelById(tbPanel.getId());
        tbPanel.setUpdated(new Date());

        if(tbPanelMapper.updateByPrimaryKey(tbPanel)!=1){
            throw new XmallException("更新板块失败");
        }
        //同步缓存
        deleteHomeRedis();
        return 1;
    }

    @Override
    public int deletePanel(int id) {

        if(tbPanelMapper.deleteByPrimaryKey(id)!=1){
            throw new XmallException("删除内容分类失败");
        }
        //同步缓存
        deleteHomeRedis();
        return 1;
    }

    /**
     * 同步首页缓存
     */
    public void deleteHomeRedis(){
        try {
            jedisClient.del(PRODUCT_HOME);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
