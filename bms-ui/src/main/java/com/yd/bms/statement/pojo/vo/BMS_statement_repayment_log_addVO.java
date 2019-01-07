package com.yd.bms.statement.pojo.vo;

import com.yd.bms.statement.pojo.po.BMS_statement_repayment_logPO;
import java.sql.Date;

public class BMS_statement_repayment_log_addVO{


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
     * 核销金额
     */
    private double hxje = 0;


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
     * 操作人
     */
    private String op_user_name = "";


    /**
     * 创建人id
     */
    private String creator = "";


    /**
     * 创建人
     */
    private String creator_name = "";



    /**
     * 还款部门
     */
    private String hkbm = "";



    public String getSerial_no(){
        return this.serial_no;
    }

    public void setSerial_no(String serial_no){
        this.serial_no = serial_no;
    }

    public String getLcbh(){
        return this.lcbh;
    }

    public void setLcbh(String lcbh){
        this.lcbh = lcbh;
    }

    public Date getHkrq(){
        return this.hkrq;
    }

    public void setHkrq(Date hkrq){
        this.hkrq = hkrq;
    }

    public String getHkfs(){
        return this.hkfs;
    }

    public void setHkfs(String hkfs){
        this.hkfs = hkfs;
    }

    public double getHxje(){
        return this.hxje;
    }

    public void setHxje(double hxje){
        this.hxje = hxje;
    }

    public double getSyje(){
        return this.syje;
    }

    public void setSyje(double syje){
        this.syje = syje;
    }

    public String getHxr(){
        return this.hxr;
    }

    public void setHxr(String hxr){
        this.hxr = hxr;
    }

    public String getCjzgzl(){
        return this.cjzgzl;
    }

    public void setCjzgzl(String cjzgzl){
        this.cjzgzl = cjzgzl;
    }

    public String getDelete_flag(){
        return this.delete_flag;
    }

    public void setDelete_flag(String delete_flag){
        this.delete_flag = delete_flag;
    }

    public String getRemark(){
        return this.remark;
    }

    public void setRemark(String remark){
        this.remark = remark;
    }

    public String getOp_user_name(){
        return this.op_user_name;
    }

    public void setOp_user_name(String op_user_name){
        this.op_user_name = op_user_name;
    }

    public String getCreator(){
        return this.creator;
    }

    public void setCreator(String creator){
        this.creator = creator;
    }

    public String getCreator_name(){
        return this.creator_name;
    }

    public void setCreator_name(String creator_name){
        this.creator_name = creator_name;
    }

    public String getHkbm() {
        return hkbm;
    }

    public void setHkbm(String hkbm) {
        this.hkbm = hkbm;
    }

    public BMS_statement_repayment_logPO toPO(){
        BMS_statement_repayment_logPO obj = new BMS_statement_repayment_logPO();
        obj.setSerial_no(serial_no);
        obj.setLcbh(lcbh);
        obj.setHkrq(hkrq);
        obj.setHkfs(hkfs);
        obj.setHxje(hxje);
        obj.setSyje(syje);
        obj.setHxr(hxr);
        obj.setCjzgzl(cjzgzl);
        obj.setDelete_flag(delete_flag);
        obj.setRemark(remark);
        obj.setOp_user_name(op_user_name);
        obj.setCreator(creator);
        obj.setCreator_name(creator_name);
        obj.setHkbm(hkbm);
        return obj;
    }


}

