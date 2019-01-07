package com.yd.bms.statement.consumer;

import com.alibaba.fastjson.JSON;
import com.yd.bms.statement.handler.BmsRepaymentHandler;
import com.yd.bms.statement.queue.BMS_STATEMENT_REPAYMENT_QUEUE;
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
public class BmsRepaymentCounsumer implements MessageListener {
    private Logger logger = LoggerFactory.getLogger(BmsRepaymentCounsumer.class);

    @Autowired
    private BmsRepaymentHandler repaymentHandler;

    @Override
    public void onMessage(Message message) {
        logger.info("BmsRepaymentCounsumer receive borrowing message------->:{}", message);
        try {
            BMS_STATEMENT_REPAYMENT_QUEUE bms_statement_repayment_queue = JSON.parseObject(message.getBody(), BMS_STATEMENT_REPAYMENT_QUEUE.class);
            repaymentHandler.handleMessage(bms_statement_repayment_queue);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
