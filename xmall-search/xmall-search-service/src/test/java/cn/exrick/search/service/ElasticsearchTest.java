package cn.exrick.search.service;


import cn.exrick.search.service.impl.SearchServiceImpl;
import cn.exrick.search.service.impl.SearchItemServiceImpl;
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

            IndexResponse response = client.prepareIndex("twitter", "tweet", "1")
                    .setSource(jsonBuilder()
                            .startObject()
                            .field("user", "kimchy")
                            .field("postDate", new Date())
                            .field("message", "trying out Elasticsearch")
                            .endObject()
                    ).get();

            GetResponse getResponse = client.prepareGet("twitter", "tweet", "1").get();

            String json = getResponse.getSourceAsString();

            System.out.println(json);

            client.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Test
    public void test2() {
        SearchItemServiceImpl searchItemService=new SearchItemServiceImpl();
        System.out.println(searchItemService.importAllItems());

        SearchServiceImpl searchService=new SearchServiceImpl();
        searchService.search("1",1,100);
    }
}
