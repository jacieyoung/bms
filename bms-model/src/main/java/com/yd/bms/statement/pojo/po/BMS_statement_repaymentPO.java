package com.yd.bms.statement.pojo.po;

import java.sql.Date;
import java.sql.Timestamp;

public class BMS_statement_repaymentPO{


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


    /**
     * OA核销状态
     */
    private String oa_clear_flag = "";


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

    public double getHkje(){
        return this.hkje;
    }

    public void setHkje(double hkje){
        this.hkje = hkje;
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

    public String getOp_user_id(){
        return this.op_user_id;
    }

    public void setOp_user_id(String op_user_id){
        this.op_user_id = op_user_id;
    }

    public String getOp_user_name(){
        return this.op_user_name;
    }

    public void setOp_user_name(String op_user_name){
        this.op_user_name = op_user_name;
    }

    public Timestamp getUpdate_time(){
        return this.update_time;
    }

    public void setUpdate_time(Timestamp update_time){
        this.update_time = update_time;
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

    public Timestamp getCreate_time(){
        return this.create_time;
    }

    public void setCreate_time(Timestamp create_time){
        this.create_time = create_time;
    }

    public String getHkbm() {
        return hkbm;
    }

    public void setHkbm(String hkbm) {
        this.hkbm = hkbm;
    }

    public String getOa_clear_flag() {
        return oa_clear_flag;
    }

    public void setOa_clear_flag(String oa_clear_flag) {
        this.oa_clear_flag = oa_clear_flag;
    }

    public Object[] toKeys(){
        return new Object[]{ 
                serial_no
                  };
    }


}

