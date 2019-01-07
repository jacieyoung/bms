package com.yd.bms.org.pojo.data;

import java.sql.Timestamp;

public class BMS_org_profileData {


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

    private String org_status_name;

    /**
     * 机构负责人
     */
    private String resp_user_id;
    /**
     * 机构类型
     */
    private String org_type;

    private String org_type_name;

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
    private int prov_code;
    /**
     * 市编码
     */
    private int city_code;
    /**
     * 区编码
     */
    private int area_code;
    /**
     * 机构地址
     */
    private String org_address;
    /**
     * 备注
     */
    private String remark;
    /**
     * 操作人
     */
    private String op_user_id;
    /**
     * 操作时间
     */
    private Timestamp update_time;
    /**
     * 创建人
     */
    private String creator;
    /**
     * 创建时间
     */
    private Timestamp create_time;
    /**
     * 申报机构
     */
    private String report_org_name;
    /**
     * 申报机构
     */
    private String report_org_id;
    /**
     * 责任机构
     */
    private String resp_org_name;
    /**
     * 责任机构
     */
    private String resp_org_id;
    /**
     * 客户所属机构
     */
    private String cust_org_name;
    /**
     * 客户所属机构
     */
    private String cust_org_id;
    private String country_code_name;
    private String prov_code_name;
    private String city_code_name;
    private String area_code_name;


    public String getCountry_code_name() {
        return country_code_name;
    }

    public void setCountry_code_name(String country_code_name) {
        this.country_code_name = country_code_name;
    }

    public String getProv_code_name() {
        return prov_code_name;
    }

    public void setProv_code_name(String prov_code_name) {
        this.prov_code_name = prov_code_name;
    }

    public String getCity_code_name() {
        return city_code_name;
    }

    public void setCity_code_name(String city_code_name) {
        this.city_code_name = city_code_name;
    }

    public String getArea_code_name() {
        return area_code_name;
    }

    public void setArea_code_name(String area_code_name) {
        this.area_code_name = area_code_name;
    }

    public String getResp_org_name() {
        return resp_org_name;
    }

    public void setResp_org_name(String resp_org_name) {
        this.resp_org_name = resp_org_name;
    }

    public String getResp_org_id() {
        return resp_org_id;
    }

    public void setResp_org_id(String resp_org_id) {
        this.resp_org_id = resp_org_id;
    }

    public String getCust_org_name() {
        return cust_org_name;
    }

    public void setCust_org_name(String cust_org_name) {
        this.cust_org_name = cust_org_name;
    }

    public String getCust_org_id() {
        return cust_org_id;
    }

    public void setCust_org_id(String cust_org_id) {
        this.cust_org_id = cust_org_id;
    }

    public String getReport_org_name() {
        return report_org_name;
    }

    public void setReport_org_name(String report_org_name) {
        this.report_org_name = report_org_name;
    }

    public String getReport_org_id() {
        return report_org_id;
    }

    public void setReport_org_id(String report_org_id) {
        this.report_org_id = report_org_id;
    }

    public String getOrg_id() {
        return this.org_id;
    }

    public void setOrg_id(String org_id) {
        this.org_id = org_id;
    }

    public String getOrg_name() {
        return this.org_name;
    }

    public void setOrg_name(String org_name) {
        this.org_name = org_name;
    }

    public String getOrg_status() {
        return this.org_status;
    }

    public void setOrg_status(String org_status) {
        this.org_status = org_status;
    }

    public void setOrg_status_name(String txt) {
        org_status_name = txt;
    }

    public String getOrg_status_name() {
        return org_status_name;
    }


    public String getResp_user_id() {
        return this.resp_user_id;
    }

    public void setResp_user_id(String resp_user_id) {
        this.resp_user_id = resp_user_id;
    }

    public String getOrg_type() {
        return this.org_type;
    }

    public void setOrg_type(String org_type) {
        this.org_type = org_type;
    }

    public void setOrg_type_name(String txt) {
        org_type_name = txt;
    }

    public String getOrg_type_name() {
        return org_type_name;
    }


    public String getResp_name() {
        return this.resp_name;
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
        return this.country_code;
    }

    public void setCountry_code(String country_code) {
        this.country_code = country_code;
    }

    public int getProv_code() {
        return this.prov_code;
    }

    public void setProv_code(int prov_code) {
        this.prov_code = prov_code;
    }

    public int getCity_code() {
        return this.city_code;
    }

    public void setCity_code(int city_code) {
        this.city_code = city_code;
    }

    public int getArea_code() {
        return this.area_code;
    }

    public void setArea_code(int area_code) {
        this.area_code = area_code;
    }

    public String getOrg_address() {
        return this.org_address;
    }

    public void setOrg_address(String org_address) {
        this.org_address = org_address;
    }

    public String getRemark() {
        return this.remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getOp_user_id() {
        return this.op_user_id;
    }

    public void setOp_user_id(String op_user_id) {
        this.op_user_id = op_user_id;
    }

    public Timestamp getUpdate_time() {
        return this.update_time;
    }

    public void setUpdate_time(Timestamp update_time) {
        this.update_time = update_time;
    }

    public String getCreator() {
        return this.creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    public Timestamp getCreate_time() {
        return this.create_time;
    }

    public void setCreate_time(Timestamp create_time) {
        this.create_time = create_time;
    }

}

