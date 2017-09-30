package cn.exrick.search.service.impl;

import cn.exrick.common.exception.XmallException;
import cn.exrick.common.pojo.SearchItem;
import cn.exrick.search.service.SearchItemService;
import cn.exrick.search.mapper.ItemMapper;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.transport.client.PreBuiltTransportClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.net.InetAddress;
import java.util.List;

import static org.elasticsearch.common.xcontent.XContentFactory.jsonBuilder;

@Service
public class SearchItemServiceImpl implements SearchItemService {

	@Autowired
	private ItemMapper itemMapper;

	@Override
	public int importAllItems() {

		try{
			Settings settings = Settings.builder()
					.put("cluster.name", "xmall").build();
			TransportClient client = new PreBuiltTransportClient(settings)
					.addTransportAddress(new InetSocketTransportAddress(InetAddress.getByName("123.207.121.135"), 9300));

			//查询商品列表
			List<SearchItem> itemList = itemMapper.getItemList();
			//遍历商品列表
			for (SearchItem searchItem : itemList) {
				IndexResponse response = client.prepareIndex("item", "itemList")
						.setSource(jsonBuilder()
								.startObject()
								.field("productId", searchItem.getProductId())
								.field("salePrice", searchItem.getSalePrice())
								.field("productName", searchItem.getProductName())
								.field("sub_title", searchItem.getSub_title())
								.field("productImageBig", searchItem.getProductImageBig())
								.field("category_name", searchItem.getCategory_name())
								.endObject()
						).get();
			}

			client.close();
		}catch (Exception e){
			e.printStackTrace();
			throw new XmallException("导入ES索引库出错");
		}

		return 1;
	}
}
