package cn.exrick.content.service.impl;

import cn.exrick.common.exception.XmallException;
import cn.exrick.common.jedis.JedisClient;
import cn.exrick.common.pojo.AllGoodsResult;
import cn.exrick.common.pojo.DataTablesResult;
import cn.exrick.content.service.ContentService;
import cn.exrick.manager.dto.ContentDto;
import cn.exrick.manager.dto.DtoUtil;
import cn.exrick.manager.dto.front.*;
import cn.exrick.manager.mapper.*;
import cn.exrick.manager.pojo.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class ContentServiceImpl implements ContentService {

    private final static Logger log= LoggerFactory.getLogger(ContentCatServiceImpl.class);

    @Autowired
    private TbContentMapper tbContentMapper;
    @Autowired
    private TbContentCategoryMapper tbContentCategoryMapper;
    @Autowired
    private TbItemMapper tbItemMapper;
    @Autowired
    private TbItemDescMapper tbItemDescMapper;
    @Autowired
    private TbImageMapper tbImageMapper;
    @Autowired
    private JedisClient jedisClient;

    @Value("${PRODUCT_HOME}")
    private String PRODUCT_HOME;

    @Value("${HOT_ID}")
    private Long HOT_ID;

    @Value("${OFFICIAL_ID}")
    private Long OFFICIAL_ID;

    @Value("${BRAND_ID}")
    private Long BRAND_ID;

    @Value("${OFFICIAL_IMAGE_ID}")
    private int OFFICIAL_IMAGE_ID;

    @Value("${BRAND_IMAGE_ID}")
    private int BRAND_IMAGE_ID;

    @Value("${RDEIS_ITEM}")
    private String RDEIS_ITEM;

    @Value("${ITEM_EXPIRE}")
    private int ITEM_EXPIRE;

    @Override
    public int addContent(TbContent tbContent) {

        tbContent.setCreated(new Date());
        tbContent.setUpdated(new Date());
        if(tbContentMapper.insert(tbContent)!=1){
            throw new XmallException("添加内容失败");
        }
        //同步缓存
        deleteHomeRedis();
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
        //同步缓存
        deleteHomeRedis();
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
            throw new XmallException("更新内容失败");
        }
        //同步缓存
        deleteHomeRedis();
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

    @Override
    public ProductHome getProductHome() {

        //查询缓存
        try{
            //有缓存则读取
            String json=jedisClient.hget(PRODUCT_HOME,PRODUCT_HOME);
            if(json!=null){
                ProductHome productHome= new Gson().fromJson(json,ProductHome.class);
                log.info("读取了首页缓存");
                return productHome;
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        //没有缓存
        ProductHome productHome =new ProductHome();

        productHome.setHome_hot(getHotProduct());
        productHome.setHome_floors(getFloorProduct());

        //把结果添加至缓存
        try{
            jedisClient.hset(PRODUCT_HOME,PRODUCT_HOME,new Gson().toJson(productHome));
            log.info("添加了首页缓存");
        }catch (Exception e){
            e.printStackTrace();
        }
        return productHome;
    }

    public List<Product> getHotProduct() {

        //热门商品
        TbContentExample example=new TbContentExample();
        TbContentExample.Criteria criteria=example.createCriteria();
        criteria.andCategoryIdEqualTo(HOT_ID);
        List<TbContent> listHot=tbContentMapper.selectByExample(example);

        List<Product> productHotList=new ArrayList<>();
        for(int i=0;i<listHot.size();i++){

            TbItem tbItem=tbItemMapper.selectByPrimaryKey(Long.valueOf(listHot.get(i).getProductId()));

            Product product=new Product();

            product.setProductId(tbItem.getId());
            product.setProductName(tbItem.getTitle());
            product.setSalePrice(tbItem.getPrice());
            product.setSub_title(tbItem.getSellPoint());
            product.setProductImageBig(listHot.get(i).getImage());

            productHotList.add(product);
        }

        return productHotList;
    }

    public List<HomeFloors> getFloorProduct() {

        List<HomeFloors> list=new ArrayList<>();

        //官方精选
        HomeFloors homeFloors1=new HomeFloors();

        TbContentExample example1=new TbContentExample();
        TbContentExample.Criteria criteria1=example1.createCriteria();
        criteria1.andCategoryIdEqualTo(OFFICIAL_ID);
        List<TbContent> listFloor1=tbContentMapper.selectByExample(example1);

        List<Product> productFloorList1=new ArrayList<>();
        for(int i=0;i<listFloor1.size();i++) {

            TbItem tbItem = tbItemMapper.selectByPrimaryKey(Long.valueOf(listFloor1.get(i).getProductId()));

            Product product = new Product();

            product.setProductId(tbItem.getId());
            product.setProductName(tbItem.getTitle());
            product.setSalePrice(tbItem.getPrice());
            product.setSub_title(tbItem.getSellPoint());
            product.setProductImageBig(listFloor1.get(i).getImage());

            productFloorList1.add(product);
        }

        homeFloors1.setTabs(productFloorList1);
        TbImage image1=tbImageMapper.selectByPrimaryKey(OFFICIAL_IMAGE_ID);
        homeFloors1.setImage(image1);
        TbContentCategory tbContentCategory1=tbContentCategoryMapper.selectByPrimaryKey(OFFICIAL_ID);
        homeFloors1.setTitle(tbContentCategory1.getName());

        list.add(homeFloors1);

        //品牌精选
        HomeFloors homeFloors2=new HomeFloors();

        TbContentExample example2=new TbContentExample();
        TbContentExample.Criteria criteria2=example2.createCriteria();
        criteria2.andCategoryIdEqualTo(BRAND_ID);
        List<TbContent> listFloor2=tbContentMapper.selectByExample(example2);

        List<Product> productFloorList2=new ArrayList<>();
        for(int i=0;i<listFloor2.size();i++) {

            TbItem tbItem = tbItemMapper.selectByPrimaryKey(Long.valueOf(listFloor2.get(i).getProductId()));

            Product product = new Product();

            product.setProductId(tbItem.getId());
            product.setProductName(tbItem.getTitle());
            product.setSalePrice(tbItem.getPrice());
            product.setSub_title(tbItem.getSellPoint());
            product.setProductImageBig(listFloor2.get(i).getImage());

            productFloorList2.add(product);
        }

        homeFloors2.setTabs(productFloorList2);
        TbImage image2=tbImageMapper.selectByPrimaryKey(BRAND_IMAGE_ID);
        homeFloors2.setImage(image2);
        TbContentCategory tbContentCategory2=tbContentCategoryMapper.selectByPrimaryKey(BRAND_ID);
        homeFloors2.setTitle(tbContentCategory2.getName());

        list.add(homeFloors2);

        return list;
    }


    @Override
    public ProductDet getProductDet(Long id) {

        //查询缓存
        try{
            //有缓存则读取
            String json=jedisClient.get(RDEIS_ITEM+":"+id);
            if(json!=null){
                ProductDet productDet= new Gson().fromJson(json,ProductDet.class);
                log.info("读取了商品"+id+"详情缓存");
                //重置商品缓存时间
                jedisClient.expire(RDEIS_ITEM+":"+id,ITEM_EXPIRE);
                return productDet;
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        TbItem tbItem=tbItemMapper.selectByPrimaryKey(id);
        ProductDet productDet=new ProductDet();
        productDet.setProductId(id);
        productDet.setProductName(tbItem.getTitle());
        productDet.setSub_title(tbItem.getSellPoint());
        if(tbItem.getLimitNum()!=null&&!tbItem.getLimitNum().toString().isEmpty()){
            productDet.setLimit_num(Long.valueOf(tbItem.getLimitNum()));
        }else{
            productDet.setLimit_num(Long.valueOf(tbItem.getNum()));
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
            jedisClient.set(RDEIS_ITEM+":"+id,new Gson().toJson(productDet));
            //设置过期时间
            jedisClient.expire(RDEIS_ITEM+":"+id,ITEM_EXPIRE);
            log.info("添加了商品"+id+"详情缓存");
        }catch (Exception e){
            e.printStackTrace();
        }
        return productDet;
    }

    @Override
    public AllGoodsResult getAllProduct(int page, int size, String sort, int priceGt, int priceLte) {

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
        if(sort.isEmpty()||sort==null){
            orderCol="created";
            orderDir="desc";
        }else if(sort.equals("1")){
            orderCol="price";
            orderDir="asc";
        }else if(sort.equals("-1")){
            orderCol="price";
            orderDir="desc";
        }

        List<TbItem> tbItemList = tbItemMapper.selectItemFront(orderCol,orderDir,priceGt,priceLte);
        PageInfo<TbItem> pageInfo=new PageInfo<>(tbItemList);

        for(TbItem tbItem:tbItemList){
            Product product= DtoUtil.TbItem2Product(tbItem);
            list.add(product);
        }

        allGoodsResult.setData(list);
        allGoodsResult.setTotal((int) pageInfo.getTotal());

        return allGoodsResult;
    }

    //同步首页缓存
    public void deleteHomeRedis(){
        try {
            jedisClient.hdel(PRODUCT_HOME,PRODUCT_HOME);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
