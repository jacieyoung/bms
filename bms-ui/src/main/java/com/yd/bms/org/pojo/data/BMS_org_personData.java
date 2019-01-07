package com.yd.bms.org.pojo.data;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Date;
import java.sql.Timestamp;

public class BMS_org_personData {

    /**
     * 人员编码
     */
    private String person_id;
    /**
     * 身份证号
     */
    private String person_code;
    /**
     * 人员状态
     */
    private String person_status;
    private String person_status_name;// 人员状态
    /**
     * 人员类型
     */
    private String person_type;
    private String person_type_name;// 人员类型
    /**
     * 人员名称
     */
    private String peson_name;
    /**
     * 人员手机
     */
    private long person_mobile;
    /**
     * 人员微信
     */
    private String person_wx;
    /**
     * 人员邮件
     */
    private String person_mail;
    /**
     * 常用住址
     */
    private String person_addr;
    /**
     * 入职日期
     */
    private Date join_date;
    /**
     * 转正日期
     */
    private Date accept_date;
    /**
     * 离职日期
     */
    private Date leave_date;
    /**
     * 工种类型
     */
    private String work_type;
    /**
     * 用户id
     */
    private String user_id;
    /**
     * 用户name
     */
    private String user_name;
    /**
     * 归属机构
     */
    private String org_id;
    private String org_name;// 归属部门
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
     * 上报异常查询的人员
     */
    private String resp_org_id_ticket;

    public String getPerson_status_name() {
        return person_status_name;
    }

    public void setPerson_status_name(String person_status_name) {
        this.person_status_name = person_status_name;
    }

    public String getPerson_type_name() {
        return person_type_name;
    }

    public void setPerson_type_name(String person_type_name) {
        this.person_type_name = person_type_name;
    }

    public String getOrg_name() {
        return org_name;
    }

    public void setOrg_name(String org_name) {
        this.org_name = org_name;
    }

    public String getPerson_id() {
        return person_id;
    }

    public void setPerson_id(String person_id) {
        this.person_id = person_id;
    }

    public String getPerson_code() {
        return this.person_code;
    }

    public void setPerson_code(String person_code) {
        this.person_code = person_code;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getPerson_status() {
        return this.person_status;
    }

    public void setPerson_status(String person_status) {
        this.person_status = person_status;
    }

    public String getPerson_type() {
        return this.person_type;
    }

    public void setPerson_type(String person_type) {
        this.person_type = person_type;
    }

    public String getPeson_name() {
        return this.peson_name;
    }

    public void setPeson_name(String peson_name) {
        this.peson_name = peson_name;
    }

    public long getPerson_mobile() {
        return this.person_mobile;
    }

    public void setPerson_mobile(long person_mobile) {
        this.person_mobile = person_mobile;
    }

    public String getPerson_wx() {
        return this.person_wx;
    }

    public void setPerson_wx(String person_wx) {
        this.person_wx = person_wx;
    }

    public String getPerson_mail() {
        return this.person_mail;
    }

    public void setPerson_mail(String person_mail) {
        this.person_mail = person_mail;
    }

    public String getPerson_addr() {
        return this.person_addr;
    }

    public void setPerson_addr(String person_addr) {
        this.person_addr = person_addr;
    }

    @JsonFormat(pattern = "yyyy-MM-dd")
    public Date getJoin_date() {
        return this.join_date;
    }

    public void setJoin_date(Date join_date) {
        this.join_date = join_date;
    }

    @JsonFormat(pattern = "yyyy-MM-dd")
    public Date getAccept_date() {
        return this.accept_date;
    }

    public void setAccept_date(Date accept_date) {
        this.accept_date = accept_date;
    }

    @JsonFormat(pattern = "yyyy-MM-dd")
    public Date getLeave_date() {
        return this.leave_date;
    }

    public void setLeave_date(Date leave_date) {
        this.leave_date = leave_date;
    }

    public String getWork_type() {
        return this.work_type;
    }

    public void setWork_type(String work_type) {
        this.work_type = work_type;
    }

    public String getUser_id() {
        return this.user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getOrg_id() {
        return this.org_id;
    }

    public void setOrg_id(String org_id) {
        this.org_id = org_id;
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

    public String getResp_org_id_ticket() {
        return resp_org_id_ticket;
    }

    public void setResp_org_id_ticket(String resp_org_id_ticket) {
        this.resp_org_id_ticket = resp_org_id_ticket;
    }

}
