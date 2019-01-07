package com.yd.bms.statement.handler;


import com.yd.bms.statement.queue.BMS_STATEMENT_REPAYMENT_QUEUE;

public interface BmsRepaymentHandler {

    void handleMessage(BMS_STATEMENT_REPAYMENT_QUEUE message);
}
