package cn.exrick.search.service.impl;

import cn.exrick.common.exception.XmallException;
import cn.exrick.common.pojo.SearchResult;
import cn.exrick.search.service.SearchService;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.search.SearchType;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.transport.client.PreBuiltTransportClient;
import org.springframework.stereotype.Service;

import java.net.InetAddress;

import static org.elasticsearch.index.query.QueryBuilders.termQuery;

@Service
public class SearchServiceImpl implements SearchService {

	@Override
	public SearchResult search(String keyword, int page, int size) {

		try{
			Settings settings = Settings.builder()
					.put("cluster.name", "xmall").build();
			TransportClient client = new PreBuiltTransportClient(settings)
					.addTransportAddress(new InetSocketTransportAddress(InetAddress.getByName("123.207.121.135"), 9300));

			SearchResult searchResult=new SearchResult();

			//设置查询条件
			QueryBuilder qb = termQuery("productName",keyword);
			//设置分页
			if (page <=0 ) page =1;
			int start=(page - 1) * size;

			SearchResponse response = client.prepareSearch("item")
					.setTypes("itemList")
					.setSearchType(SearchType.DFS_QUERY_THEN_FETCH)
					.setQuery(qb)	// Query
					.setFrom(start).setSize(size).setExplain(true)	//从第几个开始，显示size个数据
					.get();

			SearchHits hits = response.getHits();
			searchResult.setRecordCount(hits.totalHits);
			if (hits.totalHits > 0) {
				for (SearchHit hit : hits) {
					//总页数
					int totalPage=(int) (hit.getScore()/size);
					if((hit.getScore()%size)!=0){
						totalPage++;
					}
					searchResult.setTotalPages(totalPage);

					System.out.println("score:"+hit.getScore()+":\t"+hit.getSource());
				}
			}

			client.close();
		}catch (Exception e){
			e.printStackTrace();
			throw new XmallException("查询ES索引库出错");
		}

		return null;
	}
}
