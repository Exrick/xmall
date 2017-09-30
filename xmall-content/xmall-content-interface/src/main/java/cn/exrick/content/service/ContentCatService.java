package cn.exrick.content.service;

import cn.exrick.common.pojo.ZTreeNode;
import cn.exrick.manager.dto.ContentCatDto;
import cn.exrick.manager.pojo.TbContentCategory;

import java.util.List;

public interface ContentCatService {

    TbContentCategory getContentCatById(Long id);

    List<ZTreeNode> getContentCatList(Long parentId);

    int addContentCat(ContentCatDto contentCatDto);

    int updateContentCat(ContentCatDto contentCatDto);

    int deleteContentCat(Long id);
}
