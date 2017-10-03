package cn.exrick.search.service;


import org.elasticsearch.action.get.GetResponse;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.transport.client.PreBuiltTransportClient;
import org.junit.Test;

import java.net.InetAddress;
import java.util.Date;

import static org.elasticsearch.common.xcontent.XContentFactory.jsonBuilder;

public class ElasticsearchTest {

    @Test
    public void test1(){
        try{
            Settings settings = Settings.builder()
                    .put("cluster.name", "xmall").build();
            TransportClient client = new PreBuiltTransportClient(settings)
                    .addTransportAddress(new InetSocketTransportAddress(InetAddress.getByName("123.207.121.135"), 9300));

            IndexResponse response = client.prepareIndex("item", "itemList", "830972")
                    .setSource(jsonBuilder()
                            .startObject()
                            .field("productId", "830972")
                            .field("salePrice", "254")
                            .field("productName", "254")
                            .field("sub_title", "524")
                            .field("productImageBig", "252")
                            .field("category_name", "2542")
                            .endObject()
                    ).get();

            GetResponse getResponse = client.prepareGet("item", "itemList", "830972").get();

            String json = getResponse.getSourceAsString();

            System.out.println(json);

            client.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
