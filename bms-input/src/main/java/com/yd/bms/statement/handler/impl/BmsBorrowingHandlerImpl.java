package com.yd.bms.statement.handler.impl;

import com.yd.bms.statement.dao.BMS_statement_borrowingDao;
import com.yd.bms.statement.handler.BmsBorrowingHandler;
import com.yd.bms.statement.pojo.po.BMS_statement_borrowingPO;
import com.yd.bms.statement.queue.BMS_STATEMENT_BORROWING_QUEUE;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;

/**
 * @author dy-lly
 * @create 2018-09-11 9:29
 * @desc
 **/
@Service
public class BmsBorrowingHandlerImpl implements BmsBorrowingHandler {
    private Logger logger = LoggerFactory.getLogger(BmsBorrowingHandlerImpl.class);

    @Autowired
    protected BMS_statement_borrowingDao borrowingDao;

    @Override
    public void handleMessage(BMS_STATEMENT_BORROWING_QUEUE message) {
        BMS_statement_borrowingPO po0 = borrowingDao.getSingle(message.getLcbh());
        if (po0 != null) {
            logger.error("借支报表已存在相同的流程编号:[" + message.getLcbh() + "]" + message.toString());
            return;
        }

        BMS_statement_borrowingPO po = new BMS_statement_borrowingPO();
        BeanUtils.copyProperties(message, po);
        po.setSyje(po.getJzje());//剩余金额为借支金额
        po.setHkje(0);//初始还款金额为0
        String userId = "root";
        String userName = "系统管理员";
        Timestamp currentTime = new Timestamp(System.currentTimeMillis());
        po.setCreate_time(currentTime);
        po.setUpdate_time(currentTime);
        po.setCreator(userId);
        po.setOp_user_id(userId);
        po.setCreator_name(userName);
        po.setOp_user_name(userName);
        borrowingDao.add(po);
    }
}
