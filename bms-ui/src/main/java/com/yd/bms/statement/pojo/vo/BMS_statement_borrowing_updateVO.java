package com.yd.bms.statement.pojo.vo;

import com.yd.bms.statement.pojo.po.BMS_statement_borrowingPO;
import java.sql.Date;
import java.sql.Timestamp;

public class BMS_statement_borrowing_updateVO{


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
     * 申请时间
     */
    private Timestamp generate_time;




    public String getLcbh(){
        return this.lcbh;
    }

    public void setLcbh(String lcbh){
        this.lcbh = lcbh;
    }

    public Date getSqrq(){
        return this.sqrq;
    }

    public void setSqrq(Date sqrq){
        this.sqrq = sqrq;
    }

    public String getSqr(){
        return this.sqr;
    }

    public void setSqr(String sqr){
        this.sqr = sqr;
    }

    public String getSqrgh(){
        return this.sqrgh;
    }

    public void setSqrgh(String sqrgh){
        this.sqrgh = sqrgh;
    }

    public String getSqrzw(){
        return this.sqrzw;
    }

    public void setSqrzw(String sqrzw){
        this.sqrzw = sqrzw;
    }

    public String getSqbm(){
        return this.sqbm;
    }

    public void setSqbm(String sqbm){
        this.sqbm = sqbm;
    }

    public String getJzlx(){
        return this.jzlx;
    }

    public void setJzlx(String jzlx){
        this.jzlx = jzlx;
    }

    public String getJtlx(){
        return this.jtlx;
    }

    public void setJtlx(String jtlx){
        this.jtlx = jtlx;
    }

    public String getFkfs(){
        return this.fkfs;
    }

    public void setFkfs(String fkfs){
        this.fkfs = fkfs;
    }

    public String getKhhmc(){
        return this.khhmc;
    }

    public void setKhhmc(String khhmc){
        this.khhmc = khhmc;
    }

    public String getYhzh(){
        return this.yhzh;
    }

    public void setYhzh(String yhzh){
        this.yhzh = yhzh;
    }

    public String getSkrqc(){
        return this.skrqc;
    }

    public void setSkrqc(String skrqc){
        this.skrqc = skrqc;
    }

    public double getJzje(){
        return this.jzje;
    }

    public void setJzje(double jzje){
        this.jzje = jzje;
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

    public Date getCnsprq(){
        return this.cnsprq;
    }

    public void setCnsprq(Date cnsprq){
        this.cnsprq = cnsprq;
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

    public Timestamp getGenerate_time() {
        return generate_time;
    }

    public void setGenerate_time(Timestamp generate_time) {
        this.generate_time = generate_time;
    }

    public BMS_statement_borrowingPO toPO(){
        BMS_statement_borrowingPO obj = new BMS_statement_borrowingPO();
        obj.setLcbh(lcbh);
        obj.setSqrq(sqrq);
        obj.setSqr(sqr);
        obj.setSqrgh(sqrgh);
        obj.setSqrzw(sqrzw);
        obj.setSqbm(sqbm);
        obj.setJzlx(jzlx);
        obj.setJtlx(jtlx);
        obj.setFkfs(fkfs);
        obj.setKhhmc(khhmc);
        obj.setYhzh(yhzh);
        obj.setSkrqc(skrqc);
        obj.setJzje(jzje);
        obj.setHkje(hkje);
        obj.setSyje(syje);
        obj.setCnsprq(cnsprq);
        obj.setDelete_flag(delete_flag);
        obj.setRemark(remark);
        obj.setOp_user_name(op_user_name);
        obj.setCreator(creator);
        obj.setCreator_name(creator_name);
        obj.setGenerate_time(generate_time);
        return obj;
    }


}

