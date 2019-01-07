/**
 * @author wangpeng
 * @create 2018-06-26 14:43
 **/
package com.yd.bms.statement.job;


import com.yd.bms.DyJobBase;
import com.yd.bms.DyProcessJobService;
import com.yd.bms.statement.service.BMS_statement_repaymentService;
import com.yd.common.exception.CIPDaoException;
import com.yd.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component("BMS_statement_repayment")
public class BMS_statement_repaymentJob extends DyJobBase implements DyProcessJobService {
    @Autowired
    private BMS_statement_repaymentService bms_statement_repaymentService;

    @Scheduled(cron = "0 */2 * * * ?")
    @Override
    public void doJob() throws Exception {
        if (!isRun)
            return;
        try {
            logger.info("核销OA过来的冲借支工作流开始在 " + DateUtils.format(new Date(), "yyyy-MM-dd HH:mm:ss"));
            bms_statement_repaymentService.updateOArepay();
            logger.info("核销OA过来的冲借支工作流任务结束在 " + DateUtils.format(new Date(), "yyyy-MM-dd HH:mm:ss")+"\n");
        } catch (CIPDaoException e) {
            logger.error(e.getMessage());
            e.printStackTrace();
        }
    }
}
