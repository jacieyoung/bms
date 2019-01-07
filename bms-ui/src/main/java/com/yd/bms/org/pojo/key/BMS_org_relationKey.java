package com.yd.bms.org.pojo.key;


public class BMS_org_relationKey {


    /**
     * 上级机构id
     */
    private String sup_org_id;
    /**
     * 机构id
     */
    private String org_id;


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

    public Object[] toKeys() {
        return new Object[]{
                sup_org_id,
                org_id
        };
    }


}

