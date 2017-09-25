package cn.exrick.content.service.impl;

import cn.exrick.common.exception.XmallException;
import cn.exrick.common.pojo.DataTablesResult;
import cn.exrick.content.service.ContentService;
import cn.exrick.dto.front.*;
import cn.exrick.dto.ContentDto;
import cn.exrick.dto.DtoUtil;
import cn.exrick.mapper.*;
import cn.exrick.pojo.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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

    @Override
    public ProductHome getProductHome() {

        ProductHome productHome =new ProductHome();

        productHome.setHome_hot(getHotProduct());
        productHome.setHome_floors(getFloorProduct());

        return productHome;
    }

    public List<Product> getHotProduct() {

        //热门商品
        TbContentExample example=new TbContentExample();
        TbContentExample.Criteria criteria=example.createCriteria();
        criteria.andCategoryIdEqualTo((long) 1);
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
        criteria1.andCategoryIdEqualTo((long) 2);
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
        TbImage image1=tbImageMapper.selectByPrimaryKey(1);
        homeFloors1.setImage(image1);
        TbContentCategory tbContentCategory1=tbContentCategoryMapper.selectByPrimaryKey((long) 2);
        homeFloors1.setTitle(tbContentCategory1.getName());

        list.add(homeFloors1);

        //品牌精选
        HomeFloors homeFloors2=new HomeFloors();

        TbContentExample example2=new TbContentExample();
        TbContentExample.Criteria criteria2=example2.createCriteria();
        criteria2.andCategoryIdEqualTo((long) 3);
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
        TbImage image2=tbImageMapper.selectByPrimaryKey(2);
        homeFloors2.setImage(image2);
        TbContentCategory tbContentCategory2=tbContentCategoryMapper.selectByPrimaryKey((long) 3);
        homeFloors2.setTitle(tbContentCategory2.getName());

        list.add(homeFloors2);

        return list;
    }


    @Override
    public ProductDet getProductDet(Long id) {

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
        return productDet;
    }
}
