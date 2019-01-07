package com.yd.bms.org.pojo.vo;

import com.yd.bms.org.pojo.po.BMS_org_relationPO;

public class BMS_org_relation_addVO {


    /**
     * 上级机构id
     */
    private String sup_org_id;
    /**
     * 机构id
     */
    private String org_id;
    /**
     * 根机构id
     */
    private String root_org_id;
    /**
     * 机构层级数
     */
    private int org_level;
    /**
     * 层级顺序数
     */
    private int level_order;
    /**
     * 机构层级链
     */
    private String org_rel_link;
    /**
     * 备注
     */
    private String remark;


    public String getSup_org_id() {
        return this.sup_org_id;
    }

    public void setSup_org_id(String sup_org_id) {
        this.sup_org_id = sup_org_id;
    }

    public String getOrg_id() {
        return this.org_id;
    }

    public void setOrg_id(String org_id) {
        this.org_id = org_id;
    }

    public String getRoot_org_id() {
        return this.root_org_id;
    }

    public void setRoot_org_id(String root_org_id) {
        this.root_org_id = root_org_id;
    }

    public int getOrg_level() {
        return this.org_level;
    }

    public void setOrg_level(int org_level) {
        this.org_level = org_level;
    }

    public int getLevel_order() {
        return this.level_order;
    }

    public void setLevel_order(int level_order) {
        this.level_order = level_order;
    }

    public String getOrg_rel_link() {
        return this.org_rel_link;
    }

    public void setOrg_rel_link(String org_rel_link) {
        this.org_rel_link = org_rel_link;
    }

    public String getRemark() {
        return this.remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public BMS_org_relationPO toPO() {
        BMS_org_relationPO obj = new BMS_org_relationPO();
        obj.setSup_org_id(sup_org_id);
        obj.setOrg_id(org_id);
        obj.setRoot_org_id(root_org_id);
        obj.setOrg_level(org_level);
        obj.setLevel_order(level_order);
        obj.setOrg_rel_link(org_rel_link);
        obj.setRemark(remark);
        return obj;
    }


}

