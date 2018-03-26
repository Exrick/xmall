package cn.exrick.search.service;


import cn.exrick.manager.dto.EsInfo;

/**
 * @author Exrickx
 */
public interface SearchItemService {

	/**
	 * 同步索引
	 * @return
	 */
	int importAllItems();

	/**
	 * 获取ES基本信息
	 * @return
	 */
	EsInfo getEsInfo();
}
