package cn.exrick.manager.dto;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author Exrick
 * @date 2017/8/25
 */
public class MemberDto implements Serializable{

    private String username;

    private String password;

    private String phone;

    private String email;

    private String sex;

    private String province;

    private String city;

    private String district;

    private Integer state;

    private String memberfile;

    private String description;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getMemberfile() {
        return memberfile;
    }

    public void setMemberfile(String memberfile) {
        this.memberfile = memberfile;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
