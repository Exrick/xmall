package cn.exrick.common.constant;

/**
 * @author Exrickx
 */
public interface DictConstant {

    /**
     * 词典库修改标识
     */
    String EXT_KEY = "DICT_EXT_KEY";

    /**
     * 词典库修改标识
     */
    String STOP_KEY = "DICT_STOP_KEY";

    /**
     * 扩展词库缓存key
     */
    String LAST_MODIFIED = "Last-Modified";

    /**
     * 停用词库缓存key
     */
    String ETAG = "ETAG";

    /**
     * 扩展词库
     */
    Integer DICT_EXT = 1;

    /**
     * 停用词库
     */
    Integer DICT_STOP = 0;
}
