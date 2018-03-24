package cn.exrick.manager.dto.front;

import java.io.Serializable;
import java.util.List;

/**
 * @author Exrickx
 */
public class SearchResult implements Serializable{

    private Long recordCount;

    private int totalPages;

    private List<SearchItem> itemList;

    public Long getRecordCount() {
        return recordCount;
    }

    public void setRecordCount(Long recordCount) {
        this.recordCount = recordCount;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public List<SearchItem> getItemList() {
        return itemList;
    }

    public void setItemList(List<SearchItem> itemList) {
        this.itemList = itemList;
    }
}
