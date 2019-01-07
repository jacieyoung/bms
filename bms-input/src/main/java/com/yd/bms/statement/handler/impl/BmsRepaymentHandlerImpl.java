package com.yd.bms.statement.handler.impl;

import com.yd.bms.BMSConstant;
import com.yd.bms.statement.dao.BMS_statement_borrowingDao;
import com.yd.bms.statement.dao.BMS_statement_repaymentDao;
import com.yd.bms.statement.handler.BmsRepaymentHandler;
import com.yd.bms.statement.pojo.po.BMS_statement_repaymentPO;
import com.yd.bms.statement.queue.BMS_STATEMENT_REPAYMENT_QUEUE;
import com.yd.common.exception.CIPRuntimeException;
import com.yd.common.utils.SerialNoUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;

/**
 * @author dy-lly
 * @create 2018-09-11 9:29
 *  lly 20180913 先注释掉 OA那边不还款 BMS这边还款
 * @desc
 **/
@Service
public class BmsRepaymentHandlerImpl implements BmsRepaymentHandler {
    private Logger logger = LoggerFactory.getLogger(BmsRepaymentHandlerImpl.class);

    @Autowired
    protected BMS_statement_repaymentDao repaymentDao;

    @Autowired
    protected BMS_statement_borrowingDao borrowingDao;

    @Override
    @Transactional
    public void handleMessage(BMS_STATEMENT_REPAYMENT_QUEUE message) {
        try {
            BMS_statement_repaymentPO po = new BMS_statement_repaymentPO();
            com.yd.utils.BeanUtils.copyProperties(message, po);
            String userId = "root";
            String userName = "系统管理员";
            Timestamp currentTime = new Timestamp(System.currentTimeMillis());
            String serialNo = SerialNoUtils.getTimeSerialNoStr();

            po.setSerial_no(serialNo);
            po.setCreate_time(currentTime);
            po.setUpdate_time(currentTime);
            po.setCreator(userId);
            po.setOp_user_id(userId);
            po.setCreator_name(userName);
            po.setOp_user_name(userName);
            po.setHkfs(BMSConstant.C_HKFS_3);//报销核销
            po.setOa_clear_flag(BMSConstant.C_REPAY_CLEAR_FLAG_0);//未核销


            //更新借支管理报表
//            Map<String, Object> cond = new HashMap<>(1);
//            cond.put(BMS_statement_borrowingConstant.C_FIELD_LCBH, po.getLcbh());
//            List<BMS_statement_borrowingPO> borrowingPOs = borrowingDao.getPOs(cond);
//            if (borrowingPOs == null || borrowingPOs.size() != 1) {
//                throw new CIPServiceException(new CIPErrorCode(9999, "借支单工作流[" + po.getLcbh() + "]流程报表单不存在或找到多个借支单流程报表单!"));
//            }
//            BMS_statement_borrowingPO borrowingPO = borrowingPOs.get(0);
//            BigDecimal jzje = new BigDecimal(borrowingPO.getJzje());//借支金额
//            BigDecimal hjke = new BigDecimal(borrowingPO.getHkje());//还款金额
//            BigDecimal syje = new BigDecimal(borrowingPO.getSyje());//剩余金额
//            BigDecimal clearAmount = new BigDecimal(po.getHkje());//核销金额(还款金额)
//
//            if (clearAmount.doubleValue() <= 0) {
//                throw new CIPServiceException(new CIPErrorCode(99999,  "冲借支工作流[" + po.getCjzgzl() + "]核销金额不能小于0!"));
//            }
            // 20180919  lly  还款金额还款金额大于0 可以大于借支
//            if (clearAmount.compareTo(jzje) > 0) {
//                throw new CIPServiceException(new CIPErrorCode(99999, "冲借支工作流[" + po.getCjzgzl() + "]核销金额不能大于借支金额!"));
//            }
//            if (clearAmount.compareTo(syje) > 0) {
//                throw new CIPServiceException(new CIPErrorCode(99999,  "冲借支工作流[" + po.getCjzgzl() + "]核销金额不能大于剩余金额!"));
//            }
//            if (clearAmount.add(hjke).compareTo(jzje) > 0) {
//                throw new CIPServiceException(new CIPErrorCode(99999,  "冲借支工作流[" + po.getCjzgzl() + "]核销金额+还款金额不能大于借支金额!"));
//            }


//
//            borrowingPO.setHkje(new BigDecimal(borrowingPO.getHkje()).add(clearAmount).doubleValue());//更新后的还款金额
//            borrowingPO.setSyje(new BigDecimal(borrowingPO.getSyje()).subtract(clearAmount).doubleValue());//更新后的剩余金额
//            borrowingPO.setUpdate_time(currentTime);
//            borrowingPO.setOp_user_id(userId);
//            borrowingPO.setOp_user_name(userName);
//            borrowingPO.setRemark(borrowingPO.getRemark() + "," + po.getRemark());
//             borrowingDao.update(borrowingPO);


//          po.setSyje(borrowingPO.getSyje());
            repaymentDao.add(po);//


        } catch (CIPRuntimeException e) {
            logger.error(e.getMessage(), e);
            throw e;
        }
    }
}
