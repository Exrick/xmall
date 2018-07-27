package cn.exrick.front.controller;

import cn.exrick.manager.dto.front.AllGoodsResult;
import cn.exrick.common.pojo.Result;
import cn.exrick.manager.dto.front.SearchResult;
import cn.exrick.common.utils.ResultUtil;
import cn.exrick.content.service.ContentService;
import cn.exrick.manager.dto.front.ProductDet;
import cn.exrick.manager.pojo.TbPanel;
import cn.exrick.manager.pojo.TbPanelContent;
import cn.exrick.search.service.SearchService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author Exrickx
 */
@RestController
@Api(description = "商品页面展示")
public class GoodsController {

    @Autowired
    private ContentService contentService;
    @Autowired
    private SearchService searchService;

    @RequestMapping(value = "/goods/navList",method = RequestMethod.GET)
    @ApiOperation(value = "获取导航栏")
    public Result<List<TbPanelContent>> getNavList(){

        List<TbPanelContent> list=contentService.getNavList();
        return new ResultUtil<List<TbPanelContent>>().setData(list);
    }

    @RequestMapping(value = "/goods/home",method = RequestMethod.GET)
    @ApiOperation(value = "首页内容展示")
    public Result<List<TbPanel>> getProductHome(){

        List<TbPanel> list=contentService.getHome();
        return new ResultUtil<List<TbPanel>>().setData(list);
    }

    @RequestMapping(value = "/goods/productDet",method = RequestMethod.GET)
    @ApiOperation(value = "商品详情")
    public Result<ProductDet> getProductDet(Long productId){

        ProductDet productDet=contentService.getProductDet(productId);
        return new ResultUtil<ProductDet>().setData(productDet);
    }

    @RequestMapping(value = "/goods/allGoods",method = RequestMethod.GET)
    @ApiOperation(value = "所有商品")
    public Result<AllGoodsResult> getAllProduct(@RequestParam(defaultValue = "1") int page,
                                                @RequestParam(defaultValue = "20") int size,
                                                @RequestParam(defaultValue = "") String sort,
                                                @RequestParam(defaultValue = "") Long cid,
                                                @RequestParam(defaultValue = "-1") int priceGt,
                                                @RequestParam(defaultValue = "-1") int priceLte){

        AllGoodsResult allGoodsResult=contentService.getAllProduct(page,size,sort,cid,priceGt,priceLte);
        return new ResultUtil<AllGoodsResult>().setData(allGoodsResult);
    }

    @RequestMapping(value = "/goods/search",method = RequestMethod.GET)
    @ApiOperation(value = "搜索商品ES")
    public Result<SearchResult> searchProduct(@RequestParam(defaultValue = "") String key,
                                              @RequestParam(defaultValue = "1") int page,
                                              @RequestParam(defaultValue = "20") int size,
                                              @RequestParam(defaultValue = "") String sort,
                                              @RequestParam(defaultValue = "-1") int priceGt,
                                              @RequestParam(defaultValue = "-1") int priceLte){

        SearchResult searchResult=searchService.search(key,page,size,sort,priceGt,priceLte);
        return new ResultUtil<SearchResult>().setData(searchResult);
    }

    @RequestMapping(value = "/goods/recommend",method = RequestMethod.GET)
    @ApiOperation(value = "商品推荐板块")
    public Result<List<TbPanel>> getRecommendGoods(){

        List<TbPanel> list=contentService.getRecommendGoods();
        return new ResultUtil<List<TbPanel>>().setData(list);
    }

    @RequestMapping(value = "/goods/thank",method = RequestMethod.GET)
    @ApiOperation(value = "我要捐赠板块")
    public Result<List<TbPanel>> getThankGoods(){

        List<TbPanel> list=contentService.getThankGoods();
        return new ResultUtil<List<TbPanel>>().setData(list);
    }

    @RequestMapping(value = "/goods/quickSearch",produces= "text/plain;charset=UTF-8",method = RequestMethod.GET)
    @ApiOperation(value = "快速搜索")
    public String getQuickSearch(@RequestParam(defaultValue = "") String key){

        return searchService.quickSearch(key);
    }
}
