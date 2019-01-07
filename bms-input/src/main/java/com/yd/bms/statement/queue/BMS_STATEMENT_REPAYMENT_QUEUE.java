package com.yd.bms.statement.queue;

import java.sql.Date;
import java.sql.Timestamp;

/**
 * @author dy-lly
 * @create 2018-09-11 9:18
 * @desc
 **/
public class BMS_STATEMENT_REPAYMENT_QUEUE {
    /**
     * 流水号
     */
    private String serial_no = "";


    /**
     * 流程编号
     */
    private String lcbh = "";


    /**
     * 还款日期
     */
    private Date hkrq;
    /**
     * 还款方式
     */
    private String hkfs = "";


    /**
     * 还款金额
     */
    private double hkje = 0;


    /**
     * 剩余金额
     */
    private double syje = 0;


    /**
     * 核销人
     */
    private String hxr = "";


    /**
     * 冲借支工作流
     */
    private String cjzgzl = "";


    /**
     * 删除标志
     */
    private String delete_flag = "";


    /**
     * 备注
     */
    private String remark = "";


    /**
     * 操作人id
     */
    private String op_user_id = "";


    /**
     * 操作人
     */
    private String op_user_name = "";


    /**
     * 操作时间
     */
    private Timestamp update_time;
    /**
     * 创建人id
     */
    private String creator = "";


    /**
     * 创建人
     */
    private String creator_name = "";


    /**
     * 创建时间
     */
    private Timestamp create_time;


    /**
     * 还款部门
     */
    private String hkbm = "";

    public String getSerial_no() {
        return serial_no;
    }

    public void setSerial_no(String serial_no) {
        this.serial_no = serial_no;
    }

    public String getLcbh() {
        return lcbh;
    }

    public void setLcbh(String lcbh) {
        this.lcbh = lcbh;
    }

    public Date getHkrq() {
        return hkrq;
    }

    public void setHkrq(Date hkrq) {
        this.hkrq = hkrq;
    }

    public String getHkfs() {
        return hkfs;
    }

    public void setHkfs(String hkfs) {
        this.hkfs = hkfs;
    }

    public double getHkje() {
        return hkje;
    }

    public void setHkje(double hkje) {
        this.hkje = hkje;
    }

    public double getSyje() {
        return syje;
    }

    public void setSyje(double syje) {
        this.syje = syje;
    }

    public String getHxr() {
        return hxr;
    }

    public void setHxr(String hxr) {
        this.hxr = hxr;
    }

    public String getCjzgzl() {
        return cjzgzl;
    }

    public void setCjzgzl(String cjzgzl) {
        this.cjzgzl = cjzgzl;
    }

    public String getDelete_flag() {
        return delete_flag;
    }

    public void setDelete_flag(String delete_flag) {
        this.delete_flag = delete_flag;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getOp_user_id() {
        return op_user_id;
    }

    public void setOp_user_id(String op_user_id) {
        this.op_user_id = op_user_id;
    }

    public String getOp_user_name() {
        return op_user_name;
    }

    public void setOp_user_name(String op_user_name) {
        this.op_user_name = op_user_name;
    }

    public Timestamp getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Timestamp update_time) {
        this.update_time = update_time;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    public String getCreator_name() {
        return creator_name;
    }

    public void setCreator_name(String creator_name) {
        this.creator_name = creator_name;
    }

    public Timestamp getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Timestamp create_time) {
        this.create_time = create_time;
    }

    public String getHkbm() {
        return hkbm;
    }

    public void setHkbm(String hkbm) {
        this.hkbm = hkbm;
    }

    @Override
    public String toString() {
        return "BMS_STATEMENT_REPAYMENT_QUEUE{" +
                "serial_no='" + serial_no + '\'' +
                ", lcbh='" + lcbh + '\'' +
                ", hkrq=" + hkrq +
                ", hkfs='" + hkfs + '\'' +
                ", hkje=" + hkje +
                ", syje=" + syje +
                ", hxr='" + hxr + '\'' +
                ", cjzgzl='" + cjzgzl + '\'' +
                ", delete_flag='" + delete_flag + '\'' +
                ", remark='" + remark + '\'' +
                ", op_user_id='" + op_user_id + '\'' +
                ", op_user_name='" + op_user_name + '\'' +
                ", update_time=" + update_time +
                ", creator='" + creator + '\'' +
                ", creator_name='" + creator_name + '\'' +
                ", create_time=" + create_time +
                ", hkbm='" + hkbm + '\'' +
                '}';
    }
}
