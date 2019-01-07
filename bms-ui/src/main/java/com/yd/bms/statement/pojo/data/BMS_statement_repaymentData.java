package com.yd.bms.statement.pojo.data;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Date;
import java.sql.Timestamp;

public class BMS_statement_repaymentData {


    /**
     * 流水号
     */
    private String serial_no = "";
    /**
     * 流程编号
     */
    private String lcbh = "";


    /**
     * 申请日期
     */
    private Date sqrq;
    /**
     * 申请人
     */
    private String sqr = "";
    private String sqr_name = "";


    /**
     * 申请人工号
     */
    private String sqrgh = "";


    /**
     * 申请人职位
     */
    private String sqrzw = "";
    private String sqrzw_name = "";


    /**
     * 申请部门
     */
    private String sqbm = "";
    private String sqbm_name = "";


    /**
     * 借支类型
     */
    private String jzlx = "";


    private String jzlx_name;

    /**
     * 具体类型
     */
    private String jtlx = "";
    private String jtlx_name = "";


    /**
     * 付款方式
     */
    private String fkfs = "";


    private String fkfs_name;

    /**
     * 开户行名称
     */
    private String khhmc = "";


    /**
     * 银行账号
     */
    private String yhzh = "";


    /**
     * 收款人全称
     */
    private String skrqc = "";


    /**
     * 还款日期
     */
    private Date hkrq;
    /**
     * 还款方式
     */
    private String hkfs = "";
    private String hkfs_name = "";


    /**
     * 借支金额
     */
    private double jzje = 0;


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


    /**
     * OA核销状态
     */
    private String oa_clear_flag = "";


    public String getSerial_no() {
        return this.serial_no;
    }

    public void setSerial_no(String serial_no) {
        this.serial_no = serial_no;
    }

    public String getLcbh() {
        return this.lcbh;
    }

    public void setLcbh(String lcbh) {
        this.lcbh = lcbh;
    }

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    public Date getHkrq() {
        return this.hkrq;
    }

    public void setHkrq(Date hkrq) {
        this.hkrq = hkrq;
    }

    public String getHkfs() {
        return this.hkfs;
    }

    public void setHkfs(String hkfs) {
        this.hkfs = hkfs;
    }

    public double getHkje() {
        return this.hkje;
    }

    public void setHkje(double hkje) {
        this.hkje = hkje;
    }

    public double getSyje() {
        return this.syje;
    }

    public void setSyje(double syje) {
        this.syje = syje;
    }

    public String getHxr() {
        return this.hxr;
    }

    public void setHxr(String hxr) {
        this.hxr = hxr;
    }

    public String getCjzgzl() {
        return this.cjzgzl;
    }

    public void setCjzgzl(String cjzgzl) {
        this.cjzgzl = cjzgzl;
    }

    public String getDelete_flag() {
        return this.delete_flag;
    }

    public void setDelete_flag(String delete_flag) {
        this.delete_flag = delete_flag;
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

    public String getOp_user_name() {
        return this.op_user_name;
    }

    public void setOp_user_name(String op_user_name) {
        this.op_user_name = op_user_name;
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

    public String getCreator_name() {
        return this.creator_name;
    }

    public void setCreator_name(String creator_name) {
        this.creator_name = creator_name;
    }

    public Timestamp getCreate_time() {
        return this.create_time;
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

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    public Date getSqrq() {
        return sqrq;
    }

    public void setSqrq(Date sqrq) {
        this.sqrq = sqrq;
    }

    public String getSqr() {
        return sqr;
    }

    public void setSqr(String sqr) {
        this.sqr = sqr;
    }

    public String getSqrgh() {
        return sqrgh;
    }

    public void setSqrgh(String sqrgh) {
        this.sqrgh = sqrgh;
    }

    public String getSqrzw() {
        return sqrzw;
    }

    public void setSqrzw(String sqrzw) {
        this.sqrzw = sqrzw;
    }

    public String getSqbm() {
        return sqbm;
    }

    public void setSqbm(String sqbm) {
        this.sqbm = sqbm;
    }

    public String getSqbm_name() {
        return sqbm_name;
    }

    public void setSqbm_name(String sqbm_name) {
        this.sqbm_name = sqbm_name;
    }

    public String getJzlx() {
        return jzlx;
    }

    public void setJzlx(String jzlx) {
        this.jzlx = jzlx;
    }

    public String getJzlx_name() {
        return jzlx_name;
    }

    public void setJzlx_name(String jzlx_name) {
        this.jzlx_name = jzlx_name;
    }

    public String getJtlx() {
        return jtlx;
    }

    public void setJtlx(String jtlx) {
        this.jtlx = jtlx;
    }

    public String getJtlx_name() {
        return jtlx_name;
    }

    public void setJtlx_name(String jtlx_name) {
        this.jtlx_name = jtlx_name;
    }

    public String getFkfs() {
        return fkfs;
    }

    public void setFkfs(String fkfs) {
        this.fkfs = fkfs;
    }

    public String getFkfs_name() {
        return fkfs_name;
    }

    public void setFkfs_name(String fkfs_name) {
        this.fkfs_name = fkfs_name;
    }

    public String getKhhmc() {
        return khhmc;
    }

    public void setKhhmc(String khhmc) {
        this.khhmc = khhmc;
    }

    public String getYhzh() {
        return yhzh;
    }

    public void setYhzh(String yhzh) {
        this.yhzh = yhzh;
    }

    public String getSkrqc() {
        return skrqc;
    }

    public void setSkrqc(String skrqc) {
        this.skrqc = skrqc;
    }

    public double getJzje() {
        return jzje;
    }

    public void setJzje(double jzje) {
        this.jzje = jzje;
    }

    public String getHkfs_name() {
        return hkfs_name;
    }

    public void setHkfs_name(String hkfs_name) {
        this.hkfs_name = hkfs_name;
    }

    public String getSqrzw_name() {
        return sqrzw_name;
    }

    public void setSqrzw_name(String sqrzw_name) {
        this.sqrzw_name = sqrzw_name;
    }

    public String getSqr_name() {
        return sqr_name;
    }

    public void setSqr_name(String sqr_name) {
        this.sqr_name = sqr_name;
    }

    public String getOa_clear_flag() {
        return oa_clear_flag;
    }

    public void setOa_clear_flag(String oa_clear_flag) {
        this.oa_clear_flag = oa_clear_flag;
    }
}

