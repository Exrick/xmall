package cn.exrick.manager.pojo;

import java.util.ArrayList;
import java.util.List;

public class TbBaseExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TbBaseExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andWebNameIsNull() {
            addCriterion("web_name is null");
            return (Criteria) this;
        }

        public Criteria andWebNameIsNotNull() {
            addCriterion("web_name is not null");
            return (Criteria) this;
        }

        public Criteria andWebNameEqualTo(String value) {
            addCriterion("web_name =", value, "webName");
            return (Criteria) this;
        }

        public Criteria andWebNameNotEqualTo(String value) {
            addCriterion("web_name <>", value, "webName");
            return (Criteria) this;
        }

        public Criteria andWebNameGreaterThan(String value) {
            addCriterion("web_name >", value, "webName");
            return (Criteria) this;
        }

        public Criteria andWebNameGreaterThanOrEqualTo(String value) {
            addCriterion("web_name >=", value, "webName");
            return (Criteria) this;
        }

        public Criteria andWebNameLessThan(String value) {
            addCriterion("web_name <", value, "webName");
            return (Criteria) this;
        }

        public Criteria andWebNameLessThanOrEqualTo(String value) {
            addCriterion("web_name <=", value, "webName");
            return (Criteria) this;
        }

        public Criteria andWebNameLike(String value) {
            addCriterion("web_name like", value, "webName");
            return (Criteria) this;
        }

        public Criteria andWebNameNotLike(String value) {
            addCriterion("web_name not like", value, "webName");
            return (Criteria) this;
        }

        public Criteria andWebNameIn(List<String> values) {
            addCriterion("web_name in", values, "webName");
            return (Criteria) this;
        }

        public Criteria andWebNameNotIn(List<String> values) {
            addCriterion("web_name not in", values, "webName");
            return (Criteria) this;
        }

        public Criteria andWebNameBetween(String value1, String value2) {
            addCriterion("web_name between", value1, value2, "webName");
            return (Criteria) this;
        }

        public Criteria andWebNameNotBetween(String value1, String value2) {
            addCriterion("web_name not between", value1, value2, "webName");
            return (Criteria) this;
        }

        public Criteria andKeyWordIsNull() {
            addCriterion("key_word is null");
            return (Criteria) this;
        }

        public Criteria andKeyWordIsNotNull() {
            addCriterion("key_word is not null");
            return (Criteria) this;
        }

        public Criteria andKeyWordEqualTo(String value) {
            addCriterion("key_word =", value, "keyWord");
            return (Criteria) this;
        }

        public Criteria andKeyWordNotEqualTo(String value) {
            addCriterion("key_word <>", value, "keyWord");
            return (Criteria) this;
        }

        public Criteria andKeyWordGreaterThan(String value) {
            addCriterion("key_word >", value, "keyWord");
            return (Criteria) this;
        }

        public Criteria andKeyWordGreaterThanOrEqualTo(String value) {
            addCriterion("key_word >=", value, "keyWord");
            return (Criteria) this;
        }

        public Criteria andKeyWordLessThan(String value) {
            addCriterion("key_word <", value, "keyWord");
            return (Criteria) this;
        }

        public Criteria andKeyWordLessThanOrEqualTo(String value) {
            addCriterion("key_word <=", value, "keyWord");
            return (Criteria) this;
        }

        public Criteria andKeyWordLike(String value) {
            addCriterion("key_word like", value, "keyWord");
            return (Criteria) this;
        }

        public Criteria andKeyWordNotLike(String value) {
            addCriterion("key_word not like", value, "keyWord");
            return (Criteria) this;
        }

        public Criteria andKeyWordIn(List<String> values) {
            addCriterion("key_word in", values, "keyWord");
            return (Criteria) this;
        }

        public Criteria andKeyWordNotIn(List<String> values) {
            addCriterion("key_word not in", values, "keyWord");
            return (Criteria) this;
        }

        public Criteria andKeyWordBetween(String value1, String value2) {
            addCriterion("key_word between", value1, value2, "keyWord");
            return (Criteria) this;
        }

        public Criteria andKeyWordNotBetween(String value1, String value2) {
            addCriterion("key_word not between", value1, value2, "keyWord");
            return (Criteria) this;
        }

        public Criteria andDescriptionIsNull() {
            addCriterion("description is null");
            return (Criteria) this;
        }

        public Criteria andDescriptionIsNotNull() {
            addCriterion("description is not null");
            return (Criteria) this;
        }

        public Criteria andDescriptionEqualTo(String value) {
            addCriterion("description =", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionNotEqualTo(String value) {
            addCriterion("description <>", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionGreaterThan(String value) {
            addCriterion("description >", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionGreaterThanOrEqualTo(String value) {
            addCriterion("description >=", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionLessThan(String value) {
            addCriterion("description <", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionLessThanOrEqualTo(String value) {
            addCriterion("description <=", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionLike(String value) {
            addCriterion("description like", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionNotLike(String value) {
            addCriterion("description not like", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionIn(List<String> values) {
            addCriterion("description in", values, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionNotIn(List<String> values) {
            addCriterion("description not in", values, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionBetween(String value1, String value2) {
            addCriterion("description between", value1, value2, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionNotBetween(String value1, String value2) {
            addCriterion("description not between", value1, value2, "description");
            return (Criteria) this;
        }

        public Criteria andSourcePathIsNull() {
            addCriterion("source_path is null");
            return (Criteria) this;
        }

        public Criteria andSourcePathIsNotNull() {
            addCriterion("source_path is not null");
            return (Criteria) this;
        }

        public Criteria andSourcePathEqualTo(String value) {
            addCriterion("source_path =", value, "sourcePath");
            return (Criteria) this;
        }

        public Criteria andSourcePathNotEqualTo(String value) {
            addCriterion("source_path <>", value, "sourcePath");
            return (Criteria) this;
        }

        public Criteria andSourcePathGreaterThan(String value) {
            addCriterion("source_path >", value, "sourcePath");
            return (Criteria) this;
        }

        public Criteria andSourcePathGreaterThanOrEqualTo(String value) {
            addCriterion("source_path >=", value, "sourcePath");
            return (Criteria) this;
        }

        public Criteria andSourcePathLessThan(String value) {
            addCriterion("source_path <", value, "sourcePath");
            return (Criteria) this;
        }

        public Criteria andSourcePathLessThanOrEqualTo(String value) {
            addCriterion("source_path <=", value, "sourcePath");
            return (Criteria) this;
        }

        public Criteria andSourcePathLike(String value) {
            addCriterion("source_path like", value, "sourcePath");
            return (Criteria) this;
        }

        public Criteria andSourcePathNotLike(String value) {
            addCriterion("source_path not like", value, "sourcePath");
            return (Criteria) this;
        }

        public Criteria andSourcePathIn(List<String> values) {
            addCriterion("source_path in", values, "sourcePath");
            return (Criteria) this;
        }

        public Criteria andSourcePathNotIn(List<String> values) {
            addCriterion("source_path not in", values, "sourcePath");
            return (Criteria) this;
        }

        public Criteria andSourcePathBetween(String value1, String value2) {
            addCriterion("source_path between", value1, value2, "sourcePath");
            return (Criteria) this;
        }

        public Criteria andSourcePathNotBetween(String value1, String value2) {
            addCriterion("source_path not between", value1, value2, "sourcePath");
            return (Criteria) this;
        }

        public Criteria andUploadPathIsNull() {
            addCriterion("upload_path is null");
            return (Criteria) this;
        }

        public Criteria andUploadPathIsNotNull() {
            addCriterion("upload_path is not null");
            return (Criteria) this;
        }

        public Criteria andUploadPathEqualTo(String value) {
            addCriterion("upload_path =", value, "uploadPath");
            return (Criteria) this;
        }

        public Criteria andUploadPathNotEqualTo(String value) {
            addCriterion("upload_path <>", value, "uploadPath");
            return (Criteria) this;
        }

        public Criteria andUploadPathGreaterThan(String value) {
            addCriterion("upload_path >", value, "uploadPath");
            return (Criteria) this;
        }

        public Criteria andUploadPathGreaterThanOrEqualTo(String value) {
            addCriterion("upload_path >=", value, "uploadPath");
            return (Criteria) this;
        }

        public Criteria andUploadPathLessThan(String value) {
            addCriterion("upload_path <", value, "uploadPath");
            return (Criteria) this;
        }

        public Criteria andUploadPathLessThanOrEqualTo(String value) {
            addCriterion("upload_path <=", value, "uploadPath");
            return (Criteria) this;
        }

        public Criteria andUploadPathLike(String value) {
            addCriterion("upload_path like", value, "uploadPath");
            return (Criteria) this;
        }

        public Criteria andUploadPathNotLike(String value) {
            addCriterion("upload_path not like", value, "uploadPath");
            return (Criteria) this;
        }

        public Criteria andUploadPathIn(List<String> values) {
            addCriterion("upload_path in", values, "uploadPath");
            return (Criteria) this;
        }

        public Criteria andUploadPathNotIn(List<String> values) {
            addCriterion("upload_path not in", values, "uploadPath");
            return (Criteria) this;
        }

        public Criteria andUploadPathBetween(String value1, String value2) {
            addCriterion("upload_path between", value1, value2, "uploadPath");
            return (Criteria) this;
        }

        public Criteria andUploadPathNotBetween(String value1, String value2) {
            addCriterion("upload_path not between", value1, value2, "uploadPath");
            return (Criteria) this;
        }

        public Criteria andCopyrightIsNull() {
            addCriterion("copyright is null");
            return (Criteria) this;
        }

        public Criteria andCopyrightIsNotNull() {
            addCriterion("copyright is not null");
            return (Criteria) this;
        }

        public Criteria andCopyrightEqualTo(String value) {
            addCriterion("copyright =", value, "copyright");
            return (Criteria) this;
        }

        public Criteria andCopyrightNotEqualTo(String value) {
            addCriterion("copyright <>", value, "copyright");
            return (Criteria) this;
        }

        public Criteria andCopyrightGreaterThan(String value) {
            addCriterion("copyright >", value, "copyright");
            return (Criteria) this;
        }

        public Criteria andCopyrightGreaterThanOrEqualTo(String value) {
            addCriterion("copyright >=", value, "copyright");
            return (Criteria) this;
        }

        public Criteria andCopyrightLessThan(String value) {
            addCriterion("copyright <", value, "copyright");
            return (Criteria) this;
        }

        public Criteria andCopyrightLessThanOrEqualTo(String value) {
            addCriterion("copyright <=", value, "copyright");
            return (Criteria) this;
        }

        public Criteria andCopyrightLike(String value) {
            addCriterion("copyright like", value, "copyright");
            return (Criteria) this;
        }

        public Criteria andCopyrightNotLike(String value) {
            addCriterion("copyright not like", value, "copyright");
            return (Criteria) this;
        }

        public Criteria andCopyrightIn(List<String> values) {
            addCriterion("copyright in", values, "copyright");
            return (Criteria) this;
        }

        public Criteria andCopyrightNotIn(List<String> values) {
            addCriterion("copyright not in", values, "copyright");
            return (Criteria) this;
        }

        public Criteria andCopyrightBetween(String value1, String value2) {
            addCriterion("copyright between", value1, value2, "copyright");
            return (Criteria) this;
        }

        public Criteria andCopyrightNotBetween(String value1, String value2) {
            addCriterion("copyright not between", value1, value2, "copyright");
            return (Criteria) this;
        }

        public Criteria andCountCodeIsNull() {
            addCriterion("count_code is null");
            return (Criteria) this;
        }

        public Criteria andCountCodeIsNotNull() {
            addCriterion("count_code is not null");
            return (Criteria) this;
        }

        public Criteria andCountCodeEqualTo(String value) {
            addCriterion("count_code =", value, "countCode");
            return (Criteria) this;
        }

        public Criteria andCountCodeNotEqualTo(String value) {
            addCriterion("count_code <>", value, "countCode");
            return (Criteria) this;
        }

        public Criteria andCountCodeGreaterThan(String value) {
            addCriterion("count_code >", value, "countCode");
            return (Criteria) this;
        }

        public Criteria andCountCodeGreaterThanOrEqualTo(String value) {
            addCriterion("count_code >=", value, "countCode");
            return (Criteria) this;
        }

        public Criteria andCountCodeLessThan(String value) {
            addCriterion("count_code <", value, "countCode");
            return (Criteria) this;
        }

        public Criteria andCountCodeLessThanOrEqualTo(String value) {
            addCriterion("count_code <=", value, "countCode");
            return (Criteria) this;
        }

        public Criteria andCountCodeLike(String value) {
            addCriterion("count_code like", value, "countCode");
            return (Criteria) this;
        }

        public Criteria andCountCodeNotLike(String value) {
            addCriterion("count_code not like", value, "countCode");
            return (Criteria) this;
        }

        public Criteria andCountCodeIn(List<String> values) {
            addCriterion("count_code in", values, "countCode");
            return (Criteria) this;
        }

        public Criteria andCountCodeNotIn(List<String> values) {
            addCriterion("count_code not in", values, "countCode");
            return (Criteria) this;
        }

        public Criteria andCountCodeBetween(String value1, String value2) {
            addCriterion("count_code between", value1, value2, "countCode");
            return (Criteria) this;
        }

        public Criteria andCountCodeNotBetween(String value1, String value2) {
            addCriterion("count_code not between", value1, value2, "countCode");
            return (Criteria) this;
        }

        public Criteria andHasLogNoticeIsNull() {
            addCriterion("has_log_notice is null");
            return (Criteria) this;
        }

        public Criteria andHasLogNoticeIsNotNull() {
            addCriterion("has_log_notice is not null");
            return (Criteria) this;
        }

        public Criteria andHasLogNoticeEqualTo(Integer value) {
            addCriterion("has_log_notice =", value, "hasLogNotice");
            return (Criteria) this;
        }

        public Criteria andHasLogNoticeNotEqualTo(Integer value) {
            addCriterion("has_log_notice <>", value, "hasLogNotice");
            return (Criteria) this;
        }

        public Criteria andHasLogNoticeGreaterThan(Integer value) {
            addCriterion("has_log_notice >", value, "hasLogNotice");
            return (Criteria) this;
        }

        public Criteria andHasLogNoticeGreaterThanOrEqualTo(Integer value) {
            addCriterion("has_log_notice >=", value, "hasLogNotice");
            return (Criteria) this;
        }

        public Criteria andHasLogNoticeLessThan(Integer value) {
            addCriterion("has_log_notice <", value, "hasLogNotice");
            return (Criteria) this;
        }

        public Criteria andHasLogNoticeLessThanOrEqualTo(Integer value) {
            addCriterion("has_log_notice <=", value, "hasLogNotice");
            return (Criteria) this;
        }

        public Criteria andHasLogNoticeIn(List<Integer> values) {
            addCriterion("has_log_notice in", values, "hasLogNotice");
            return (Criteria) this;
        }

        public Criteria andHasLogNoticeNotIn(List<Integer> values) {
            addCriterion("has_log_notice not in", values, "hasLogNotice");
            return (Criteria) this;
        }

        public Criteria andHasLogNoticeBetween(Integer value1, Integer value2) {
            addCriterion("has_log_notice between", value1, value2, "hasLogNotice");
            return (Criteria) this;
        }

        public Criteria andHasLogNoticeNotBetween(Integer value1, Integer value2) {
            addCriterion("has_log_notice not between", value1, value2, "hasLogNotice");
            return (Criteria) this;
        }

        public Criteria andLogNoticeIsNull() {
            addCriterion("log_notice is null");
            return (Criteria) this;
        }

        public Criteria andLogNoticeIsNotNull() {
            addCriterion("log_notice is not null");
            return (Criteria) this;
        }

        public Criteria andLogNoticeEqualTo(String value) {
            addCriterion("log_notice =", value, "logNotice");
            return (Criteria) this;
        }

        public Criteria andLogNoticeNotEqualTo(String value) {
            addCriterion("log_notice <>", value, "logNotice");
            return (Criteria) this;
        }

        public Criteria andLogNoticeGreaterThan(String value) {
            addCriterion("log_notice >", value, "logNotice");
            return (Criteria) this;
        }

        public Criteria andLogNoticeGreaterThanOrEqualTo(String value) {
            addCriterion("log_notice >=", value, "logNotice");
            return (Criteria) this;
        }

        public Criteria andLogNoticeLessThan(String value) {
            addCriterion("log_notice <", value, "logNotice");
            return (Criteria) this;
        }

        public Criteria andLogNoticeLessThanOrEqualTo(String value) {
            addCriterion("log_notice <=", value, "logNotice");
            return (Criteria) this;
        }

        public Criteria andLogNoticeLike(String value) {
            addCriterion("log_notice like", value, "logNotice");
            return (Criteria) this;
        }

        public Criteria andLogNoticeNotLike(String value) {
            addCriterion("log_notice not like", value, "logNotice");
            return (Criteria) this;
        }

        public Criteria andLogNoticeIn(List<String> values) {
            addCriterion("log_notice in", values, "logNotice");
            return (Criteria) this;
        }

        public Criteria andLogNoticeNotIn(List<String> values) {
            addCriterion("log_notice not in", values, "logNotice");
            return (Criteria) this;
        }

        public Criteria andLogNoticeBetween(String value1, String value2) {
            addCriterion("log_notice between", value1, value2, "logNotice");
            return (Criteria) this;
        }

        public Criteria andLogNoticeNotBetween(String value1, String value2) {
            addCriterion("log_notice not between", value1, value2, "logNotice");
            return (Criteria) this;
        }

        public Criteria andHasAllNoticeIsNull() {
            addCriterion("has_all_notice is null");
            return (Criteria) this;
        }

        public Criteria andHasAllNoticeIsNotNull() {
            addCriterion("has_all_notice is not null");
            return (Criteria) this;
        }

        public Criteria andHasAllNoticeEqualTo(Integer value) {
            addCriterion("has_all_notice =", value, "hasAllNotice");
            return (Criteria) this;
        }

        public Criteria andHasAllNoticeNotEqualTo(Integer value) {
            addCriterion("has_all_notice <>", value, "hasAllNotice");
            return (Criteria) this;
        }

        public Criteria andHasAllNoticeGreaterThan(Integer value) {
            addCriterion("has_all_notice >", value, "hasAllNotice");
            return (Criteria) this;
        }

        public Criteria andHasAllNoticeGreaterThanOrEqualTo(Integer value) {
            addCriterion("has_all_notice >=", value, "hasAllNotice");
            return (Criteria) this;
        }

        public Criteria andHasAllNoticeLessThan(Integer value) {
            addCriterion("has_all_notice <", value, "hasAllNotice");
            return (Criteria) this;
        }

        public Criteria andHasAllNoticeLessThanOrEqualTo(Integer value) {
            addCriterion("has_all_notice <=", value, "hasAllNotice");
            return (Criteria) this;
        }

        public Criteria andHasAllNoticeIn(List<Integer> values) {
            addCriterion("has_all_notice in", values, "hasAllNotice");
            return (Criteria) this;
        }

        public Criteria andHasAllNoticeNotIn(List<Integer> values) {
            addCriterion("has_all_notice not in", values, "hasAllNotice");
            return (Criteria) this;
        }

        public Criteria andHasAllNoticeBetween(Integer value1, Integer value2) {
            addCriterion("has_all_notice between", value1, value2, "hasAllNotice");
            return (Criteria) this;
        }

        public Criteria andHasAllNoticeNotBetween(Integer value1, Integer value2) {
            addCriterion("has_all_notice not between", value1, value2, "hasAllNotice");
            return (Criteria) this;
        }

        public Criteria andAllNoticeIsNull() {
            addCriterion("all_notice is null");
            return (Criteria) this;
        }

        public Criteria andAllNoticeIsNotNull() {
            addCriterion("all_notice is not null");
            return (Criteria) this;
        }

        public Criteria andAllNoticeEqualTo(String value) {
            addCriterion("all_notice =", value, "allNotice");
            return (Criteria) this;
        }

        public Criteria andAllNoticeNotEqualTo(String value) {
            addCriterion("all_notice <>", value, "allNotice");
            return (Criteria) this;
        }

        public Criteria andAllNoticeGreaterThan(String value) {
            addCriterion("all_notice >", value, "allNotice");
            return (Criteria) this;
        }

        public Criteria andAllNoticeGreaterThanOrEqualTo(String value) {
            addCriterion("all_notice >=", value, "allNotice");
            return (Criteria) this;
        }

        public Criteria andAllNoticeLessThan(String value) {
            addCriterion("all_notice <", value, "allNotice");
            return (Criteria) this;
        }

        public Criteria andAllNoticeLessThanOrEqualTo(String value) {
            addCriterion("all_notice <=", value, "allNotice");
            return (Criteria) this;
        }

        public Criteria andAllNoticeLike(String value) {
            addCriterion("all_notice like", value, "allNotice");
            return (Criteria) this;
        }

        public Criteria andAllNoticeNotLike(String value) {
            addCriterion("all_notice not like", value, "allNotice");
            return (Criteria) this;
        }

        public Criteria andAllNoticeIn(List<String> values) {
            addCriterion("all_notice in", values, "allNotice");
            return (Criteria) this;
        }

        public Criteria andAllNoticeNotIn(List<String> values) {
            addCriterion("all_notice not in", values, "allNotice");
            return (Criteria) this;
        }

        public Criteria andAllNoticeBetween(String value1, String value2) {
            addCriterion("all_notice between", value1, value2, "allNotice");
            return (Criteria) this;
        }

        public Criteria andAllNoticeNotBetween(String value1, String value2) {
            addCriterion("all_notice not between", value1, value2, "allNotice");
            return (Criteria) this;
        }

        public Criteria andNoticeIsNull() {
            addCriterion("notice is null");
            return (Criteria) this;
        }

        public Criteria andNoticeIsNotNull() {
            addCriterion("notice is not null");
            return (Criteria) this;
        }

        public Criteria andNoticeEqualTo(String value) {
            addCriterion("notice =", value, "notice");
            return (Criteria) this;
        }

        public Criteria andNoticeNotEqualTo(String value) {
            addCriterion("notice <>", value, "notice");
            return (Criteria) this;
        }

        public Criteria andNoticeGreaterThan(String value) {
            addCriterion("notice >", value, "notice");
            return (Criteria) this;
        }

        public Criteria andNoticeGreaterThanOrEqualTo(String value) {
            addCriterion("notice >=", value, "notice");
            return (Criteria) this;
        }

        public Criteria andNoticeLessThan(String value) {
            addCriterion("notice <", value, "notice");
            return (Criteria) this;
        }

        public Criteria andNoticeLessThanOrEqualTo(String value) {
            addCriterion("notice <=", value, "notice");
            return (Criteria) this;
        }

        public Criteria andNoticeLike(String value) {
            addCriterion("notice like", value, "notice");
            return (Criteria) this;
        }

        public Criteria andNoticeNotLike(String value) {
            addCriterion("notice not like", value, "notice");
            return (Criteria) this;
        }

        public Criteria andNoticeIn(List<String> values) {
            addCriterion("notice in", values, "notice");
            return (Criteria) this;
        }

        public Criteria andNoticeNotIn(List<String> values) {
            addCriterion("notice not in", values, "notice");
            return (Criteria) this;
        }

        public Criteria andNoticeBetween(String value1, String value2) {
            addCriterion("notice between", value1, value2, "notice");
            return (Criteria) this;
        }

        public Criteria andNoticeNotBetween(String value1, String value2) {
            addCriterion("notice not between", value1, value2, "notice");
            return (Criteria) this;
        }

        public Criteria andUpdateLogIsNull() {
            addCriterion("update_log is null");
            return (Criteria) this;
        }

        public Criteria andUpdateLogIsNotNull() {
            addCriterion("update_log is not null");
            return (Criteria) this;
        }

        public Criteria andUpdateLogEqualTo(String value) {
            addCriterion("update_log =", value, "updateLog");
            return (Criteria) this;
        }

        public Criteria andUpdateLogNotEqualTo(String value) {
            addCriterion("update_log <>", value, "updateLog");
            return (Criteria) this;
        }

        public Criteria andUpdateLogGreaterThan(String value) {
            addCriterion("update_log >", value, "updateLog");
            return (Criteria) this;
        }

        public Criteria andUpdateLogGreaterThanOrEqualTo(String value) {
            addCriterion("update_log >=", value, "updateLog");
            return (Criteria) this;
        }

        public Criteria andUpdateLogLessThan(String value) {
            addCriterion("update_log <", value, "updateLog");
            return (Criteria) this;
        }

        public Criteria andUpdateLogLessThanOrEqualTo(String value) {
            addCriterion("update_log <=", value, "updateLog");
            return (Criteria) this;
        }

        public Criteria andUpdateLogLike(String value) {
            addCriterion("update_log like", value, "updateLog");
            return (Criteria) this;
        }

        public Criteria andUpdateLogNotLike(String value) {
            addCriterion("update_log not like", value, "updateLog");
            return (Criteria) this;
        }

        public Criteria andUpdateLogIn(List<String> values) {
            addCriterion("update_log in", values, "updateLog");
            return (Criteria) this;
        }

        public Criteria andUpdateLogNotIn(List<String> values) {
            addCriterion("update_log not in", values, "updateLog");
            return (Criteria) this;
        }

        public Criteria andUpdateLogBetween(String value1, String value2) {
            addCriterion("update_log between", value1, value2, "updateLog");
            return (Criteria) this;
        }

        public Criteria andUpdateLogNotBetween(String value1, String value2) {
            addCriterion("update_log not between", value1, value2, "updateLog");
            return (Criteria) this;
        }

        public Criteria andFrontUrlIsNull() {
            addCriterion("front_url is null");
            return (Criteria) this;
        }

        public Criteria andFrontUrlIsNotNull() {
            addCriterion("front_url is not null");
            return (Criteria) this;
        }

        public Criteria andFrontUrlEqualTo(String value) {
            addCriterion("front_url =", value, "frontUrl");
            return (Criteria) this;
        }

        public Criteria andFrontUrlNotEqualTo(String value) {
            addCriterion("front_url <>", value, "frontUrl");
            return (Criteria) this;
        }

        public Criteria andFrontUrlGreaterThan(String value) {
            addCriterion("front_url >", value, "frontUrl");
            return (Criteria) this;
        }

        public Criteria andFrontUrlGreaterThanOrEqualTo(String value) {
            addCriterion("front_url >=", value, "frontUrl");
            return (Criteria) this;
        }

        public Criteria andFrontUrlLessThan(String value) {
            addCriterion("front_url <", value, "frontUrl");
            return (Criteria) this;
        }

        public Criteria andFrontUrlLessThanOrEqualTo(String value) {
            addCriterion("front_url <=", value, "frontUrl");
            return (Criteria) this;
        }

        public Criteria andFrontUrlLike(String value) {
            addCriterion("front_url like", value, "frontUrl");
            return (Criteria) this;
        }

        public Criteria andFrontUrlNotLike(String value) {
            addCriterion("front_url not like", value, "frontUrl");
            return (Criteria) this;
        }

        public Criteria andFrontUrlIn(List<String> values) {
            addCriterion("front_url in", values, "frontUrl");
            return (Criteria) this;
        }

        public Criteria andFrontUrlNotIn(List<String> values) {
            addCriterion("front_url not in", values, "frontUrl");
            return (Criteria) this;
        }

        public Criteria andFrontUrlBetween(String value1, String value2) {
            addCriterion("front_url between", value1, value2, "frontUrl");
            return (Criteria) this;
        }

        public Criteria andFrontUrlNotBetween(String value1, String value2) {
            addCriterion("front_url not between", value1, value2, "frontUrl");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}