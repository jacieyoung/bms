package com.yd.bms.statement.handler;


import com.yd.bms.statement.queue.BMS_STATEMENT_BORROWING_QUEUE;

public interface BmsBorrowingHandler {

    void handleMessage(BMS_STATEMENT_BORROWING_QUEUE message);
}
