package cn.exrick.search.service;


import cn.exrick.common.pojo.SearchResult;

public interface SearchService {

	SearchResult search(String keyword, int page, int size,String sort,int priceGt,int priceLte);
}
