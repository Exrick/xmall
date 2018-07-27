package cn.exrick.content.service.impl;

import cn.exrick.common.exception.XmallException;
import cn.exrick.common.jedis.JedisClient;
import cn.exrick.manager.dto.front.AllGoodsResult;
import cn.exrick.common.pojo.DataTablesResult;
import cn.exrick.content.service.ContentService;
import cn.exrick.manager.dto.DtoUtil;
import cn.exrick.manager.dto.front.*;
import cn.exrick.manager.mapper.*;
import cn.exrick.manager.pojo.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.apache.commons.lang3.StringUtils;
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
public class ContentServiceImpl implements ContentService {

    private final static Logger log= LoggerFactory.getLogger(PanelServiceImpl.class);

    @Autowired
    private TbPanelMapper tbPanelMapper;
    @Autowired
    private TbPanelContentMapper tbPanelContentMapper;
    @Autowired
    private TbItemMapper tbItemMapper;
    @Autowired
    private TbItemDescMapper tbItemDescMapper;
    @Autowired
    private JedisClient jedisClient;

    @Value("${PRODUCT_HOME}")
    private String PRODUCT_HOME;

    @Value("${PRODUCT_ITEM}")
    private String PRODUCT_ITEM;

    @Value("${RECOMEED_PANEL_ID}")
    private Integer RECOMEED_PANEL_ID;

    @Value("${THANK_PANEL_ID}")
    private Integer THANK_PANEL_ID;

    @Value("${RECOMEED_PANEL}")
    private String RECOMEED_PANEL;

    @Value("${THANK_PANEL}")
    private String THANK_PANEL;

    @Value("${ITEM_EXPIRE}")
    private int ITEM_EXPIRE;

    @Value("${HEADER_PANEL_ID}")
    private int HEADER_PANEL_ID;

    @Value("${HEADER_PANEL}")
    private String HEADER_PANEL;

    @Override
    public int addPanelContent(TbPanelContent tbPanelContent) {

        tbPanelContent.setCreated(new Date());
        tbPanelContent.setUpdated(new Date());
        if(tbPanelContentMapper.insert(tbPanelContent)!=1){
            throw new XmallException("添加首页板块内容失败");
        }
        //同步导航栏缓存
        if(tbPanelContent.getPanelId()==HEADER_PANEL_ID){
            updateNavListRedis();
        }
        //同步缓存
        deleteHomeRedis();
        return 1;
    }

    @Override
    public DataTablesResult getPanelContentListByPanelId(int panelId) {

        DataTablesResult result=new DataTablesResult();
        List<TbPanelContent> list=new ArrayList<>();

        TbPanelContentExample example=new TbPanelContentExample();
        TbPanelContentExample.Criteria criteria=example.createCriteria();
        //条件查询
        criteria.andPanelIdEqualTo(panelId);
        list=tbPanelContentMapper.selectByExample(example);
        for(TbPanelContent content:list){
            if(content.getProductId()!=null){
                TbItem tbItem=tbItemMapper.selectByPrimaryKey(content.getProductId());
                content.setProductName(tbItem.getTitle());
                content.setSalePrice(tbItem.getPrice());
                content.setSubTitle(tbItem.getSellPoint());
            }
        }

        result.setData(list);
        return result;
    }

    @Override
    public int deletePanelContent(int id) {

        if(tbPanelContentMapper.deleteByPrimaryKey(id)!=1){
            throw new XmallException("删除首页板块失败");
        }
        //同步导航栏缓存
        if(id==HEADER_PANEL_ID){
            updateNavListRedis();
        }
        //同步缓存
        deleteHomeRedis();
        return 1;
    }

    @Override
    public int updateContent(TbPanelContent tbPanelContent) {

        TbPanelContent old=getTbPanelContentById(tbPanelContent.getId());
        if(StringUtils.isBlank(tbPanelContent.getPicUrl())){
            tbPanelContent.setPicUrl(old.getPicUrl());
        }
        if(StringUtils.isBlank(tbPanelContent.getPicUrl2())){
            tbPanelContent.setPicUrl2(old.getPicUrl2());
        }
        if(StringUtils.isBlank(tbPanelContent.getPicUrl3())){
            tbPanelContent.setPicUrl3(old.getPicUrl3());
        }
        tbPanelContent.setCreated(old.getCreated());
        tbPanelContent.setUpdated(new Date());
        if(tbPanelContentMapper.updateByPrimaryKey(tbPanelContent)!=1){
            throw new XmallException("更新板块内容失败");
        }
        //同步导航栏缓存
        if(tbPanelContent.getPanelId()==HEADER_PANEL_ID){
            updateNavListRedis();
        }
        //同步缓存
        deleteHomeRedis();
        return 1;
    }

    @Override
    public TbPanelContent getTbPanelContentById(int id) {

        TbPanelContent tbPanelContent=tbPanelContentMapper.selectByPrimaryKey(id);
        if(tbPanelContent==null){
            throw new XmallException("通过id获取板块内容失败");
        }
        return tbPanelContent;
    }

    @Override
    public List<TbPanel> getHome() {

        List<TbPanel> list=new ArrayList<>();

        //查询缓存
        try{
            //有缓存则读取
            String json=jedisClient.get(PRODUCT_HOME);
            if(json!=null){
                list = new Gson().fromJson(json, new TypeToken<List<TbPanel>>(){}.getType());
                log.info("读取了首页缓存");
                return list;
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        //没有缓存
        TbPanelExample example=new TbPanelExample();
        TbPanelExample.Criteria criteria=example.createCriteria();
        //条件查询
        criteria.andPositionEqualTo(0);
        criteria.andStatusEqualTo(1);
        example.setOrderByClause("sort_order");
        list=tbPanelMapper.selectByExample(example);
        for(TbPanel tbPanel:list){
            TbPanelContentExample exampleContent=new TbPanelContentExample();
            exampleContent.setOrderByClause("sort_order");
            TbPanelContentExample.Criteria criteriaContent=exampleContent.createCriteria();
            //条件查询
            criteriaContent.andPanelIdEqualTo(tbPanel.getId());
            List<TbPanelContent> contentList=tbPanelContentMapper.selectByExample(exampleContent);
            for(TbPanelContent content:contentList){
                if(content.getProductId()!=null){
                    TbItem tbItem=tbItemMapper.selectByPrimaryKey(content.getProductId());
                    content.setProductName(tbItem.getTitle());
                    content.setSalePrice(tbItem.getPrice());
                    content.setSubTitle(tbItem.getSellPoint());
                }
            }

            tbPanel.setPanelContents(contentList);
        }

        //把结果添加至缓存
        try{
            jedisClient.set(PRODUCT_HOME, new Gson().toJson(list));
            log.info("添加了首页缓存");
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<TbPanel> getRecommendGoods() {


        List<TbPanel> list = new ArrayList<>();
        //查询缓存
        try{
            //有缓存则读取
            String json=jedisClient.get(RECOMEED_PANEL);
            if(json!=null){
                list = new Gson().fromJson(json, new TypeToken<List<TbPanel>>(){}.getType());
                log.info("读取了推荐板块缓存");
                return list;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        list = getTbPanelAndContentsById(RECOMEED_PANEL_ID);
        //把结果添加至缓存
        try{
            jedisClient.set(RECOMEED_PANEL, new Gson().toJson(list));
            log.info("添加了推荐板块缓存");
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<TbPanel> getThankGoods() {

        List<TbPanel> list = new ArrayList<>();
        //查询缓存
        try{
            //有缓存则读取
            String json=jedisClient.get(THANK_PANEL);
            if(json!=null){
                list = new Gson().fromJson(json, new TypeToken<List<TbPanel>>(){}.getType());
                log.info("读取了捐赠板块缓存");
                return list;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        list = getTbPanelAndContentsById(THANK_PANEL_ID);
        //把结果添加至缓存
        try{
            jedisClient.set(THANK_PANEL, new Gson().toJson(list));
            log.info("添加了捐赠板块缓存");
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    List<TbPanel> getTbPanelAndContentsById(Integer panelId){

        List<TbPanel> list=new ArrayList<>();
        TbPanelExample example=new TbPanelExample();
        TbPanelExample.Criteria criteria=example.createCriteria();
        //条件查询
        criteria.andIdEqualTo(panelId);
        criteria.andStatusEqualTo(1);
        list=tbPanelMapper.selectByExample(example);
        for(TbPanel tbPanel:list){
            TbPanelContentExample exampleContent=new TbPanelContentExample();
            exampleContent.setOrderByClause("sort_order");
            TbPanelContentExample.Criteria criteriaContent=exampleContent.createCriteria();
            //条件查询
            criteriaContent.andPanelIdEqualTo(tbPanel.getId());
            List<TbPanelContent> contentList=tbPanelContentMapper.selectByExample(exampleContent);
            for(TbPanelContent content:contentList){
                if(content.getProductId()!=null){
                    TbItem tbItem=tbItemMapper.selectByPrimaryKey(content.getProductId());
                    content.setProductName(tbItem.getTitle());
                    content.setSalePrice(tbItem.getPrice());
                    content.setSubTitle(tbItem.getSellPoint());
                }
            }

            tbPanel.setPanelContents(contentList);
        }
        return list;
    }

    @Override
    public ProductDet getProductDet(Long id) {

        //查询缓存
        try{
            //有缓存则读取
            String json=jedisClient.get(PRODUCT_ITEM+":"+id);
            if(json!=null){
                ProductDet productDet= new Gson().fromJson(json,ProductDet.class);
                log.info("读取了商品"+id+"详情缓存");
                //重置商品缓存时间
                jedisClient.expire(PRODUCT_ITEM+":"+id,ITEM_EXPIRE);
                return productDet;
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        TbItem tbItem=tbItemMapper.selectByPrimaryKey(id);
        ProductDet productDet=new ProductDet();
        productDet.setProductId(id);
        productDet.setProductName(tbItem.getTitle());
        productDet.setSubTitle(tbItem.getSellPoint());
        if(tbItem.getLimitNum()!=null&&!tbItem.getLimitNum().toString().isEmpty()){
            productDet.setLimitNum(Long.valueOf(tbItem.getLimitNum()));
        }else{
            productDet.setLimitNum(Long.valueOf(tbItem.getNum()));
        }
        productDet.setSalePrice(tbItem.getPrice());

        TbItemDesc tbItemDesc=tbItemDescMapper.selectByPrimaryKey(id);
        productDet.setDetail(tbItemDesc.getItemDesc());

        if(tbItem.getImage()!=null&&!tbItem.getImage().isEmpty()){
            String images[]=tbItem.getImage().split(",");
            productDet.setProductImageBig(images[0]);
            List list=new ArrayList();
            for(int i=0;i<images.length;i++){
                list.add(images[i]);
            }
            productDet.setProductImageSmall(list);
        }
        //无缓存 把结果添加至缓存
        try{
            jedisClient.set(PRODUCT_ITEM+":"+id,new Gson().toJson(productDet));
            //设置过期时间
            jedisClient.expire(PRODUCT_ITEM+":"+id,ITEM_EXPIRE);
            log.info("添加了商品"+id+"详情缓存");
        }catch (Exception e){
            e.printStackTrace();
        }
        return productDet;
    }

    @Override
    public AllGoodsResult getAllProduct(int page, int size, String sort, Long cid, int priceGt, int priceLte) {

        AllGoodsResult allGoodsResult=new AllGoodsResult();
        List<Product> list=new ArrayList<>();
        //分页执行查询返回结果
        if(page<=0) {
            page = 1;
        }
        PageHelper.startPage(page,size);

        //判断条件
        String orderCol="created";
        String orderDir="desc";
        if(sort.equals("1")){
            orderCol="price";
            orderDir="asc";
        }else if(sort.equals("-1")){
            orderCol="price";
            orderDir="desc";
        }else{
            orderCol="created";
            orderDir="desc";
        }

        List<TbItem> tbItemList = tbItemMapper.selectItemFront(cid,orderCol,orderDir,priceGt,priceLte);
        PageInfo<TbItem> pageInfo=new PageInfo<>(tbItemList);

        for(TbItem tbItem:tbItemList){
            Product product= DtoUtil.TbItem2Product(tbItem);
            list.add(product);
        }

        allGoodsResult.setData(list);
        allGoodsResult.setTotal((int) pageInfo.getTotal());

        return allGoodsResult;
    }

    @Override
    public String getIndexRedis() {

        try{
            String json=jedisClient.get(PRODUCT_HOME);
            return json;
        }catch (Exception e){
            log.error(e.toString());
        }
        return "";
    }

    @Override
    public int updateIndexRedis() {

        deleteHomeRedis();
        return 1;
    }

    @Override
    public String getRecommendRedis() {

        try{
            String json=jedisClient.get(RECOMEED_PANEL);
            return json;
        }catch (Exception e){
            log.error(e.toString());
        }
        return "";
    }

    @Override
    public int updateRecommendRedis() {

        try {
            jedisClient.del(RECOMEED_PANEL);
        }catch (Exception e){
            e.printStackTrace();
        }
        return 1;
    }

    @Override
    public String getThankRedis() {

        try{
            String json=jedisClient.get(THANK_PANEL);
            return json;
        }catch (Exception e){
            log.error(e.toString());
        }
        return "";
    }

    @Override
    public int updateThankRedis() {

        try {
            jedisClient.del(THANK_PANEL);
        }catch (Exception e){
            e.printStackTrace();
        }
        return 1;
    }

    public void updateNavListRedis() {

        try {
            jedisClient.del(HEADER_PANEL);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public List<TbPanelContent> getNavList() {

        List<TbPanelContent> list = new ArrayList<>();
        //查询缓存
        try{
            //有缓存则读取
            String json=jedisClient.get(HEADER_PANEL);
            if(json!=null){
                list = new Gson().fromJson(json, new TypeToken<List<TbPanelContent>>(){}.getType());
                log.info("读取了导航栏缓存");
                return list;
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        TbPanelContentExample exampleContent=new TbPanelContentExample();
        exampleContent.setOrderByClause("sort_order");
        TbPanelContentExample.Criteria criteriaContent=exampleContent.createCriteria();
        //条件查询
        criteriaContent.andPanelIdEqualTo(HEADER_PANEL_ID);
        list=tbPanelContentMapper.selectByExample(exampleContent);

        //把结果添加至缓存
        try{
            jedisClient.set(HEADER_PANEL, new Gson().toJson(list));
            log.info("添加了导航栏缓存");
        }catch (Exception e){
            e.printStackTrace();
        }

        return list;
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
