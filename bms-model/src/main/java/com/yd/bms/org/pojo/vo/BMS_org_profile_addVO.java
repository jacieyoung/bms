package com.yd.bms.org.pojo.vo;

import com.yd.bms.org.pojo.po.BMS_org_profilePO;

public class BMS_org_profile_addVO {


    /**
     * 机构id
     */
    private String org_id;
    /**
     * 机构名称
     */
    private String org_name;
    /**
     * 机构状态
     */
    private String org_status;
    /**
     * 机构负责人
     */
    private String resp_user_id;
    /**
     * 机构类型
     */
    private String org_type;
    /**
     * 负责人名称
     */
    private String resp_name;
    /**
     * 负责人手机
     */
    private String resp_mobile;
    /**
     * 国家编码
     */
    private String country_code;
    /**
     * 省编码
     */
    private String prov_code;
    /**
     * 市编码
     */
    private String city_code;
    /**
     * 区编码
     */
    private String area_code;
    /**
     * 机构地址
     */
    private String org_address;
    /**
     * 备注
     */
    private String remark;


    public String getOrg_id() {
        return org_id;
    }


    public void setOrg_id(String org_id) {
        this.org_id = org_id;
    }


    public String getOrg_name() {
        return org_name;
    }


    public void setOrg_name(String org_name) {
        this.org_name = org_name;
    }


    public String getOrg_status() {
        return org_status;
    }


    public void setOrg_status(String org_status) {
        this.org_status = org_status;
    }


    public String getResp_user_id() {
        return resp_user_id;
    }


    public void setResp_user_id(String resp_user_id) {
        this.resp_user_id = resp_user_id;
    }


    public String getOrg_type() {
        return org_type;
    }


    public void setOrg_type(String org_type) {
        this.org_type = org_type;
    }


    public String getResp_name() {
        return resp_name;
    }


    public void setResp_name(String resp_name) {
        this.resp_name = resp_name;
    }


    public String getResp_mobile() {
        return resp_mobile;
    }


    public void setResp_mobile(String resp_mobile) {
        this.resp_mobile = resp_mobile;
    }


    public String getCountry_code() {
        return country_code;
    }


    public void setCountry_code(String country_code) {
        this.country_code = country_code;
    }


    public String getProv_code() {
        return prov_code;
    }


    public void setProv_code(String prov_code) {
        this.prov_code = prov_code;
    }


    public String getCity_code() {
        return city_code;
    }


    public void setCity_code(String city_code) {
        this.city_code = city_code;
    }


    public String getArea_code() {
        return area_code;
    }


    public void setArea_code(String area_code) {
        this.area_code = area_code;
    }


    public String getOrg_address() {
        return org_address;
    }


    public void setOrg_address(String org_address) {
        this.org_address = org_address;
    }


    public String getRemark() {
        return remark;
    }


    public void setRemark(String remark) {
        this.remark = remark;
    }


    public BMS_org_profilePO toPO() {
        BMS_org_profilePO obj = new BMS_org_profilePO();
        obj.setOrg_id(org_id);
        obj.setOrg_name(org_name);
        obj.setOrg_status(org_status);
        obj.setResp_user_id(resp_user_id);
        obj.setOrg_type(org_type);
        obj.setResp_name(resp_name);
        obj.setResp_mobile(resp_mobile);
        obj.setCountry_code(country_code);
        obj.setProv_code(prov_code);
        obj.setCity_code(city_code);
        obj.setArea_code(area_code);
        obj.setOrg_address(org_address);
        obj.setRemark(remark);
        return obj;
    }


}

