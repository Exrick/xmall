package cn.exrick.content.service;

import cn.exrick.common.pojo.AllGoodsResult;
import cn.exrick.common.pojo.DataTablesResult;
import cn.exrick.manager.dto.front.ProductDet;
import cn.exrick.manager.dto.front.ProductHome;
import cn.exrick.manager.pojo.TbContent;


public interface ContentService {

    int addContent(TbContent content);

    DataTablesResult getContentListByCid(Long cid);

    int deleteContent(Long id);

    int updateContent(TbContent content);

    TbContent getContentById(Long id);

    ProductHome getProductHome();

    ProductDet getProductDet(Long id);

    AllGoodsResult getAllProduct(int page, int size, String sort, int priceGt, int priceLte);
}
