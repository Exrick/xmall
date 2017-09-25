package cn.exrick.content.service;

import cn.exrick.common.pojo.DataTablesResult;
import cn.exrick.dto.front.ProductDet;
import cn.exrick.dto.front.ProductHome;
import cn.exrick.pojo.TbContent;


public interface ContentService {

    int addContent(TbContent content);

    DataTablesResult getContentListByCid(Long cid);

    int deleteContent(Long id);

    int updateContent(TbContent content);

    TbContent getContentById(Long id);

    ProductHome getProductHome();

    ProductDet getProductDet(Long id);
}
