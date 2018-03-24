package cn.exrick.manager.dto.front;

import cn.exrick.manager.pojo.TbImage;

import java.io.Serializable;
import java.util.List;

/**
 * @author Exrickx
 */
public class HomeFloors implements Serializable {

    private List<?> tabs;

    private TbImage image;

    private String title;

    public List<?> getTabs() {
        return tabs;
    }

    public void setTabs(List<?> tabs) {
        this.tabs = tabs;
    }

    public TbImage getImage() {
        return image;
    }

    public void setImage(TbImage image) {
        this.image = image;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
