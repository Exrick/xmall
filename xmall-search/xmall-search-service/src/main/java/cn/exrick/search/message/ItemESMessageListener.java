package cn.exrick.search.message;

import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

import cn.exrick.manager.dto.front.SearchItem;
import cn.exrick.search.mapper.ItemMapper;
import org.elasticsearch.action.delete.DeleteResponse;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.TransportAddress;
import org.elasticsearch.transport.client.PreBuiltTransportClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import java.net.InetAddress;

import static org.elasticsearch.common.xcontent.XContentFactory.jsonBuilder;


/**
 * 监听商品添加消息，接收消息后，将对应的商品信息同步到索引库
 */
public class ItemESMessageListener implements MessageListener {

	private final static Logger log= LoggerFactory.getLogger(ItemESMessageListener.class);
	
	@Autowired
	private ItemMapper itemMapper;

	@Value("${ITEM_INDEX}")
	private String ITEM_INDEX;

	@Value("${ITEM_TYPE}")
	private String ITEM_TYPE;

	@Value("${ES_CONNECT_IP}")
	private String ES_CONNECT_IP;

	@Value("${ES_CLUSTER_NAME}")
	private String ES_CLUSTER_NAME;

	@Override
	public void onMessage(Message message) {
		try {
			//从消息中取商品id
			TextMessage textMessage = (TextMessage) message;

			log.info("得到消息："+textMessage.getText());

			String[] text = textMessage.getText().split(",");
			Long itemId = new Long(text[1]);
			//等待事务提交
			Thread.sleep(1000);

			//更新索引
			Settings settings = Settings.builder()
					.put("cluster.name", ES_CLUSTER_NAME).build();
			TransportClient client = new PreBuiltTransportClient(settings)
					.addTransportAddress(new TransportAddress(InetAddress.getByName(ES_CONNECT_IP), 9300));

			if("add".equals(text[0])){
				//根据商品id查询商品信息
				SearchItem searchItem = itemMapper.getItemById(itemId);
				String image=searchItem.getProductImageBig();
				if (image != null && !"".equals(image)) {
					String[] strings = image.split(",");
					image=strings[0];
				}else{
					image="";
				}
				searchItem.setProductImageBig(image);
				IndexResponse indexResponse = client.prepareIndex(ITEM_INDEX, ITEM_TYPE, String.valueOf(searchItem.getProductId()))
						.setSource(jsonBuilder()
								.startObject()
								.field("productId", searchItem.getProductId())
								.field("salePrice", searchItem.getSalePrice())
								.field("productName", searchItem.getProductName())
								.field("sub_title", searchItem.getSubTitle())
								.field("productImageBig", searchItem.getProductImageBig())
								.field("category_name", searchItem.getCategory_name())
								.endObject()
						).get();
			}else if("delete".equals(text[0])){
				DeleteResponse deleteResponse = client.prepareDelete(ITEM_INDEX, ITEM_TYPE, String.valueOf(itemId)).get();
			}

			log.info("处理消息成功");

			client.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
