package cn.exrick.manager.dto.front;

import java.io.Serializable;

/**
 * @author Exrickx
 */
public class Image implements Serializable{

    private String link;

    private String image;

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
