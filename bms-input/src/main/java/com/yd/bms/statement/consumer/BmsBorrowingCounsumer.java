package com.yd.bms.statement.consumer;

import com.alibaba.fastjson.JSON;
import com.yd.bms.statement.handler.BmsBorrowingHandler;
import com.yd.bms.statement.queue.BMS_STATEMENT_BORROWING_QUEUE;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageListener;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author dy-lly
 * @create 2018-09-11 9:26
 * @desc
 **/
public class BmsBorrowingCounsumer implements MessageListener {
    private Logger logger = LoggerFactory.getLogger(BmsBorrowingCounsumer.class);

    @Autowired
    private BmsBorrowingHandler borrowingHandler;

    @Override
    public void onMessage(Message message) {
        logger.info("BmsBorrowingCounsumer receive borrowing message------->:{}", message);
        try {
            BMS_STATEMENT_BORROWING_QUEUE bms_statement_borrowing_queue = JSON.parseObject(message.getBody(), BMS_STATEMENT_BORROWING_QUEUE.class);
            borrowingHandler.handleMessage(bms_statement_borrowing_queue);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
