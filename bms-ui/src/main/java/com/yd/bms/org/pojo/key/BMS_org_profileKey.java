package com.yd.bms.org.pojo.key;


public class BMS_org_profileKey {


    /**
     * 机构id
     */
    private String org_id;


    public String getOrg_id() {
        return this.org_id;
    }

    public void setOrg_id(String org_id) {
        this.org_id = org_id;
    }

    public Object[] toKeys() {
        return new Object[]{
                org_id
        };
    }


}

