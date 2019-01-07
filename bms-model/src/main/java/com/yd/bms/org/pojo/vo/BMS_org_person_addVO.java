package com.yd.bms.org.pojo.vo;

import com.yd.bms.org.pojo.po.BMS_org_personPO;

import java.sql.Date;

public class BMS_org_person_addVO {


    /**
     * 人员编码
     */
    private int person_id;
    /**
     * 身份证号
     */
    private String person_code;
    /**
     * 人员状态
     */
    private String person_status;
    /**
     * 人员类型
     */
    private String person_type;
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
     * 归属机构
     */
    private String org_id;
    /**
     * 备注
     */
    private String remark;


    public int getPerson_id() {
        return this.person_id;
    }

    public void setPerson_id(int person_id) {
        this.person_id = person_id;
    }

    public String getPerson_code() {
        return this.person_code;
    }

    public void setPerson_code(String person_code) {
        this.person_code = person_code;
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

    public Date getJoin_date() {
        return this.join_date;
    }

    public void setJoin_date(Date join_date) {
        this.join_date = join_date;
    }

    public Date getAccept_date() {
        return this.accept_date;
    }

    public void setAccept_date(Date accept_date) {
        this.accept_date = accept_date;
    }

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

    public BMS_org_personPO toPO() {
        BMS_org_personPO obj = new BMS_org_personPO();
        obj.setPerson_id(person_id);
        obj.setPerson_code(person_code);
        obj.setPerson_status(person_status);
        obj.setPerson_type(person_type);
        obj.setPeson_name(peson_name);
        obj.setPerson_mobile(person_mobile);
        obj.setPerson_wx(person_wx);
        obj.setPerson_mail(person_mail);
        obj.setPerson_addr(person_addr);
        obj.setJoin_date(join_date);
        obj.setAccept_date(accept_date);
        obj.setLeave_date(leave_date);
        obj.setWork_type(work_type);
        obj.setUser_id(user_id);
        obj.setOrg_id(org_id);
        obj.setRemark(remark);
        return obj;
    }


}

