package cn.exrick.manager.pojo;

public class TbBase {
    private Integer id;

    private String webName;

    private String keyWord;

    private String description;

    private String sourcePath;

    private String uploadPath;

    private String copyright;

    private String countCode;

    private Integer hasLogNotice;

    private String logNotice;

    private Integer hasAllNotice;

    private String allNotice;

    private String notice;

    private String updateLog;

    private String frontUrl;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getWebName() {
        return webName;
    }

    public void setWebName(String webName) {
        this.webName = webName == null ? null : webName.trim();
    }

    public String getKeyWord() {
        return keyWord;
    }

    public void setKeyWord(String keyWord) {
        this.keyWord = keyWord == null ? null : keyWord.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getSourcePath() {
        return sourcePath;
    }

    public void setSourcePath(String sourcePath) {
        this.sourcePath = sourcePath == null ? null : sourcePath.trim();
    }

    public String getUploadPath() {
        return uploadPath;
    }

    public void setUploadPath(String uploadPath) {
        this.uploadPath = uploadPath == null ? null : uploadPath.trim();
    }

    public String getCopyright() {
        return copyright;
    }

    public void setCopyright(String copyright) {
        this.copyright = copyright == null ? null : copyright.trim();
    }

    public String getCountCode() {
        return countCode;
    }

    public void setCountCode(String countCode) {
        this.countCode = countCode == null ? null : countCode.trim();
    }

    public Integer getHasLogNotice() {
        return hasLogNotice;
    }

    public void setHasLogNotice(Integer hasLogNotice) {
        this.hasLogNotice = hasLogNotice;
    }

    public String getLogNotice() {
        return logNotice;
    }

    public void setLogNotice(String logNotice) {
        this.logNotice = logNotice == null ? null : logNotice.trim();
    }

    public Integer getHasAllNotice() {
        return hasAllNotice;
    }

    public void setHasAllNotice(Integer hasAllNotice) {
        this.hasAllNotice = hasAllNotice;
    }

    public String getAllNotice() {
        return allNotice;
    }

    public void setAllNotice(String allNotice) {
        this.allNotice = allNotice == null ? null : allNotice.trim();
    }

    public String getNotice() {
        return notice;
    }

    public void setNotice(String notice) {
        this.notice = notice == null ? null : notice.trim();
    }

    public String getUpdateLog() {
        return updateLog;
    }

    public void setUpdateLog(String updateLog) {
        this.updateLog = updateLog == null ? null : updateLog.trim();
    }

    public String getFrontUrl() {
        return frontUrl;
    }

    public void setFrontUrl(String frontUrl) {
        this.frontUrl = frontUrl == null ? null : frontUrl.trim();
    }
}