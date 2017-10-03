package cn.exrick.content.service.impl;

import cn.exrick.common.exception.XmallException;
import cn.exrick.common.jedis.JedisClient;
import cn.exrick.common.pojo.DataTablesResult;
import cn.exrick.content.service.ContentImageService;
import cn.exrick.manager.dto.DtoUtil;
import cn.exrick.manager.dto.ImageDto;
import cn.exrick.manager.mapper.TbImageMapper;
import cn.exrick.manager.pojo.TbContentCategory;
import cn.exrick.manager.pojo.TbImage;
import cn.exrick.manager.pojo.TbImageExample;
import cn.exrick.manager.mapper.TbContentCategoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class ContentImageServiceImpl implements ContentImageService {

    @Autowired
    private TbImageMapper tbImageMapper;
    @Autowired
    private TbContentCategoryMapper tbContentCategoryMapper;
    @Autowired
    private JedisClient jedisClient;

    @Value("${PRODUCT_HOME}")
    private String PRODUCT_HOME;

    @Override
    public TbImage getContentImageById(Long id) {

        TbImage tbImage=tbImageMapper.selectByPrimaryKey(Math.toIntExact(id));
        if(tbImage==null){
            throw new XmallException("通过id获取图片失败");
        }
        return tbImage;
    }

    @Override
    public DataTablesResult getContentImage() {

        DataTablesResult result=new DataTablesResult();
        List<ImageDto> list=new ArrayList<>();

        TbImageExample example=new TbImageExample();
        List<TbImage> listImage=tbImageMapper.selectByExample(example);

        for(int i=0;i<listImage.size();i++){
            ImageDto imageDto= DtoUtil.TbImage2ImageDto(listImage.get(i));
            TbContentCategory tbContentCategory=tbContentCategoryMapper.selectByPrimaryKey(Long.valueOf(listImage.get(i).getCategoryId()));
            imageDto.setCategory(tbContentCategory.getName());
            list.add(imageDto);
        }

        result.setData(list);
        return result;
    }

    @Override
    public int updateContentImage(TbImage tbImage) {

        TbImage old=getContentImageById(Long.valueOf(tbImage.getId()));

        if(tbImage.getImage().isEmpty()){
            tbImage.setImage(old.getImage());
        }
        tbImage.setUpdated(new Date());
        tbImage.setImageMobile(old.getImageMobile());
        tbImage.setCreated(old.getCreated());

        if(tbImageMapper.updateByPrimaryKey(tbImage)!=1){
            throw new XmallException("更新图片失败");
        }
        //同步缓存
        deleteHomeRedis();
        return 1;
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
