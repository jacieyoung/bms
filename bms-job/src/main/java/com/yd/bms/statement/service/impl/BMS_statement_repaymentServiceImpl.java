package com.yd.bms.statement.service.impl;

import com.yd.bms.statement.dao.BMS_statement_borrowingDao;
import com.yd.bms.statement.dao.BMS_statement_repaymentDao;
import com.yd.bms.statement.dao.BMS_statement_repayment_logDao;
import com.yd.bms.statement.service.BMS_statement_repaymentService;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

public abstract class BMS_statement_repaymentServiceImpl implements BMS_statement_repaymentService {
    protected final org.slf4j.Logger logger = LoggerFactory.getLogger(getClass());


    // Dao
    @Autowired
    protected BMS_statement_repaymentDao dataDao;
    // Dao
    @Autowired
    protected BMS_statement_repayment_logDao repayLogDao;
    // Dao
    @Autowired
    protected BMS_statement_borrowingDao borrowingDao;


}

