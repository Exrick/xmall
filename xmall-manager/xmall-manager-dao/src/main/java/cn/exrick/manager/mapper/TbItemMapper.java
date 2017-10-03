package cn.exrick.manager.mapper;

import cn.exrick.manager.pojo.TbItem;
import cn.exrick.manager.pojo.TbItemExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbItemMapper {
    long countByExample(TbItemExample example);

    int deleteByExample(TbItemExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbItem record);

    int insertSelective(TbItem record);

    List<TbItem> selectByExample(TbItemExample example);

    TbItem selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbItem record, @Param("example") TbItemExample example);

    int updateByExample(@Param("record") TbItem record, @Param("example") TbItemExample example);

    int updateByPrimaryKeySelective(TbItem record);

    int updateByPrimaryKey(TbItem record);

    List<TbItem> selectItemByCondition(@Param("cid") int cid,@Param("search") String search,
                                       @Param("orderCol") String orderCol,@Param("orderDir") String orderDir);

    List<TbItem> selectItemByMultiCondition(@Param("cid") int cid,@Param("search") String search,@Param("minDate") String minDate,
                                            @Param("maxDate") String maxDate,@Param("orderCol") String orderCol,
                                            @Param("orderDir") String orderDir);

    List<TbItem> selectItemFront(@Param("orderCol") String orderCol,@Param("orderDir") String orderDir,
                                 @Param("priceGt") int priceGt,@Param("priceLte") int priceLte);
}