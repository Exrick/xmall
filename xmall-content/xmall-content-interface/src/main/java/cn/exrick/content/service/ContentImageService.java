package cn.exrick.content.service;

import cn.exrick.common.pojo.DataTablesResult;
import cn.exrick.manager.pojo.TbImage;

public interface ContentImageService {

    TbImage getContentImageById(Long id);

    DataTablesResult getContentImage();

    int updateContentImage(TbImage tbImage);
}
