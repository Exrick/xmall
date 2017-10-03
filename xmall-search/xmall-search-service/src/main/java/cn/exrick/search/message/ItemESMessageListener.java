package cn.exrick.search.message;

import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

import cn.exrick.common.pojo.SearchItem;
import cn.exrick.search.mapper.ItemMapper;
import org.elasticsearch.action.delete.DeleteResponse;
import org.elasticsearch.action.get.GetResponse;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.transport.client.PreBuiltTransportClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import java.net.InetAddress;

import static org.elasticsearch.common.xcontent.XContentFactory.jsonBuilder;


/**
 * 监听商品添加消息，接收消息后，将对应的商品信息同步到索引库
 */
public class ItemESMessageListener implements MessageListener {
	
	@Autowired
	private ItemMapper itemMapper;

	@Value("${ITEM_INDEX}")
	private String ITEM_INDEX;

	@Value("${ITEM_TYPE}")
	private String ITEM_TYPE;

	@Override
	public void onMessage(Message message) {
		try {
			//从消息中取商品id
			TextMessage textMessage = (TextMessage) message;
			String[] text = textMessage.getText().split(",");
			Long itemId = new Long(text[1]);
			//等待事务提交
			Thread.sleep(1000);
			//根据商品id查询商品信息
			SearchItem searchItem = itemMapper.getItemById(itemId);
			//更新索引
			Settings settings = Settings.builder()
					.put("cluster.name", "xmall").build();
			TransportClient client = new PreBuiltTransportClient(settings)
					.addTransportAddress(new InetSocketTransportAddress(InetAddress.getByName("123.207.121.135"), 9300));

			if(text[0].equals("add")){
				IndexResponse indexResponse = client.prepareIndex(ITEM_INDEX, ITEM_TYPE, String.valueOf(searchItem.getProductId()))
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
			}else if(text[0].equals("delete")){
				DeleteResponse deleteResponse = client.prepareDelete(ITEM_INDEX, ITEM_TYPE, String.valueOf(searchItem.getProductId())).get();
			}

			client.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
