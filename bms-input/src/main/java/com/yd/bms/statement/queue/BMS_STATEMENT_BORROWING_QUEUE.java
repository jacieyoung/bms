package com.yd.bms.statement.queue;

import java.sql.Date;
import java.sql.Timestamp;

/**
 * @author dy-lly
 * @create 2018-09-11 9:18
 * @desc
 **/
public class BMS_STATEMENT_BORROWING_QUEUE {

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


    /**
     * 申请人工号
     */
    private String sqrgh = "";


    /**
     * 申请人职位
     */
    private String sqrzw = "";


    /**
     * 申请部门
     */
    private String sqbm = "";


    /**
     * 借支类型
     */
    private String jzlx = "";


    /**
     * 具体类型
     */
    private String jtlx = "";


    /**
     * 付款方式
     */
    private String fkfs = "";


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
     * 出纳审批日期
     */
    private Date cnsprq;
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

    private Timestamp generate_time;


    public String getLcbh() {
        return lcbh;
    }

    public void setLcbh(String lcbh) {
        this.lcbh = lcbh;
    }

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

    public String getJzlx() {
        return jzlx;
    }

    public void setJzlx(String jzlx) {
        this.jzlx = jzlx;
    }

    public String getJtlx() {
        return jtlx;
    }

    public void setJtlx(String jtlx) {
        this.jtlx = jtlx;
    }

    public String getFkfs() {
        return fkfs;
    }

    public void setFkfs(String fkfs) {
        this.fkfs = fkfs;
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

    public Date getCnsprq() {
        return cnsprq;
    }

    public void setCnsprq(Date cnsprq) {
        this.cnsprq = cnsprq;
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

    public Timestamp getGenerate_time() {
        return generate_time;
    }

    public void setGenerate_time(Timestamp generate_time) {
        this.generate_time = generate_time;
    }

    @Override
    public String toString() {
        return "BMS_STATEMENT_BORROWING_QUEUE{" +
                "lcbh='" + lcbh + '\'' +
                ", sqrq=" + sqrq +
                ", sqr='" + sqr + '\'' +
                ", sqrgh='" + sqrgh + '\'' +
                ", sqrzw='" + sqrzw + '\'' +
                ", sqbm='" + sqbm + '\'' +
                ", jzlx='" + jzlx + '\'' +
                ", jtlx='" + jtlx + '\'' +
                ", fkfs='" + fkfs + '\'' +
                ", khhmc='" + khhmc + '\'' +
                ", yhzh='" + yhzh + '\'' +
                ", skrqc='" + skrqc + '\'' +
                ", jzje=" + jzje +
                ", hkje=" + hkje +
                ", syje=" + syje +
                ", cnsprq=" + cnsprq +
                ", delete_flag='" + delete_flag + '\'' +
                ", remark='" + remark + '\'' +
                ", op_user_id='" + op_user_id + '\'' +
                ", op_user_name='" + op_user_name + '\'' +
                ", update_time=" + update_time +
                ", creator='" + creator + '\'' +
                ", creator_name='" + creator_name + '\'' +
                ", create_time=" + create_time +
                ", generate_time=" + generate_time +
                '}';
    }
}
