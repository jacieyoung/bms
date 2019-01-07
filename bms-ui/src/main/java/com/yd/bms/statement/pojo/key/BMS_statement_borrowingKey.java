package com.yd.bms.statement.pojo.key;


public class BMS_statement_borrowingKey{


    /**
     * 流程编号
     */
    private String lcbh = "";






    public String getLcbh(){
        return this.lcbh;
    }

    public void setLcbh(String lcbh){
        this.lcbh = lcbh;
    }

    public Object[] toKeys(){
        return new Object[]{ 
                lcbh
                  };
    }


}

