package com.yd.bms.statement.pojo.key;


public class BMS_statement_repayment_logKey{


    /**
     * 流水号
     */
    private String serial_no = "";






    public String getSerial_no(){
        return this.serial_no;
    }

    public void setSerial_no(String serial_no){
        this.serial_no = serial_no;
    }

    public Object[] toKeys(){
        return new Object[]{ 
                serial_no
                  };
    }


}

