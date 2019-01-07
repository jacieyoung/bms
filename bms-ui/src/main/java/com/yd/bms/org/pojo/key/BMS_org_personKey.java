package com.yd.bms.org.pojo.key;


public class BMS_org_personKey {


    /**
     * 人员编码
     */
    private int person_id;


    public int getPerson_id() {
        return this.person_id;
    }

    public void setPerson_id(int person_id) {
        this.person_id = person_id;
    }

    public Object[] toKeys() {
        return new Object[]{
                person_id
        };
    }


}

