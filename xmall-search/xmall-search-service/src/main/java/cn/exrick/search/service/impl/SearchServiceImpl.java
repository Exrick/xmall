package cn.exrick.search.service.impl;

import cn.exrick.common.exception.XmallException;
import cn.exrick.common.pojo.SearchItem;
import cn.exrick.common.pojo.SearchResult;
import cn.exrick.search.service.SearchService;
import com.google.gson.Gson;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.search.SearchType;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.text.Text;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightBuilder;
import org.elasticsearch.transport.client.PreBuiltTransportClient;
import org.springframework.stereotype.Service;

import java.net.InetAddress;
import java.util.ArrayList;
import java.util.List;

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

			//设置高亮显示
			HighlightBuilder hiBuilder=new HighlightBuilder();
			hiBuilder.preTags("<a style=\"color: red\">");
			hiBuilder.postTags("</a>");
			hiBuilder.field("productName");
			//执行搜索
			SearchResponse searchResponse = client.prepareSearch("item")
					.setTypes("itemList")
					.setSearchType(SearchType.DFS_QUERY_THEN_FETCH)
					.setQuery(qb)	// Query
					.setFrom(start).setSize(size).setExplain(true)	//从第几个开始，显示size个数据
					.highlighter(hiBuilder)		//设置高亮显示
					.get();

			SearchHits hits = searchResponse.getHits();
			//返回总结果数
			searchResult.setRecordCount(hits.totalHits);
			List<SearchItem> list=new ArrayList<>();
			if (hits.totalHits > 0) {
				for (SearchHit hit : hits) {
					//总页数
					int totalPage=(int) (hit.getScore()/size);
					if((hit.getScore()%size)!=0){
						totalPage++;
					}
					//返回结果总页数
					searchResult.setTotalPages(totalPage);
					//设置高亮字段
					SearchItem searchItem=new Gson().fromJson(hit.getSourceAsString(),SearchItem.class);
					String productName = hit.getHighlightFields().get("productName").getFragments()[0].toString();
					searchItem.setProductName(productName);
					//返回结果
					list.add(searchItem);
				}
			}
			searchResult.setItemList(list);
			client.close();

			return searchResult;
		}catch (Exception e){
			e.printStackTrace();
			throw new XmallException("查询ES索引库出错");
		}
	}
}
