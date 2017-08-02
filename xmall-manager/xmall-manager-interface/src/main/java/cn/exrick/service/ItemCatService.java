package cn.exrick.service;

import cn.exrick.common.pojo.ZTreeNode;

import java.util.List;

/**
 * Created by Exrick on 2017/8/2.
 */
public interface ItemCatService {

    List<ZTreeNode> getItemCatList(int parentId);
}
