package com.yd.bms.statement.service.local;

import com.yd.bms.BMSConstant;
import com.yd.bms.statement.pojo.po.BMS_statement_borrowingPO;
import com.yd.bms.statement.pojo.po.BMS_statement_repaymentPO;
import com.yd.bms.statement.pojo.po.BMS_statement_repayment_logPO;
import com.yd.bms.statement.service.impl.BMS_statement_repaymentServiceImpl;
import com.yd.common.utils.CollectionUtil;
import com.yd.common.utils.SerialNoUtils;
import com.yd.common.utils.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service(value = "BMS_statement_repaymentServiceImpl")
public class LBMS_statement_repaymentServiceImpl extends BMS_statement_repaymentServiceImpl {


    @Override
    public void updateOArepay() {

//        String userId = "root";
//        String userName = "系统管理员";


        Map<String, Object> repayCod = new HashMap<>(1);
        repayCod.put("oa_clear_flag", BMSConstant.C_REPAY_CLEAR_FLAG_0);

        List<BMS_statement_repaymentPO> repayList = dataDao.getPOs(repayCod);
        if (CollectionUtil.isEmpty(repayList)) {
            logger.info("没有可以核销的还款报表\n");
            return;
        }
        int size = repayList.size();
        logger.info("此次任务共找到" + size + "条冲借支单");
        int index = 0;
        for (int i = 0; i < size; i++) {
            BMS_statement_repaymentPO repaymentPO = repayList.get(i);
            index = i + 1;
            logger.info("=======正在核销第" + index + "条(共[" + size + "])条冲借支单条,冲借支单号[" + repaymentPO.getCjzgzl() + "]========");

            doClear(repaymentPO, size, index);

        }
    }

    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    public void doClear(BMS_statement_repaymentPO repaymentPO, int size, int index) {

        try {
            String userId = "root";
            String userName = "系统管理员";


            //更新借支管理报表
            String lcbh = repaymentPO.getLcbh();
            if (StringUtils.isEmpty(lcbh)) {
                logger.error("冲借支工作流[" + repaymentPO.getCjzgzl() + "]借支单流程编号不存在\n");
                return;
            }
            //todo 查询借支单流程 按照申请时间排序
            List<BMS_statement_borrowingPO> borrowingPOs = borrowingDao.getByLcbh(lcbh);

            if (borrowingPOs == null || borrowingPOs.size() < 1) {
                logger.error("借支单工作流[" + repaymentPO.getLcbh() + "]流程报表单已经核销完或者不存在\n");
                return;
            }

            BigDecimal leftAmout = new BigDecimal(repaymentPO.getHkje());//核销金额(还款金额);

            //核销标记
            int count = 0;
            logger.info("===dy_info ==== 还款单[" + repaymentPO.getCjzgzl() + "]找到" + borrowingPOs.size() + "条借支单========");

            //开始核销
            for (int i = 0; i < borrowingPOs.size(); i++) {
                Timestamp currentTime = new Timestamp(System.currentTimeMillis());

                BMS_statement_borrowingPO borrowingPO = borrowingPOs.get(i);
                BigDecimal jzje = new BigDecimal(borrowingPO.getJzje());//借支金额
                BigDecimal hjke = new BigDecimal(borrowingPO.getHkje());//还款金额
                BigDecimal syje = new BigDecimal(borrowingPO.getSyje());//剩余金额

                //剩余的钱不够跳出循环
                if (leftAmout.compareTo(new BigDecimal("0.0")) <= 0) {
                    break;
                }

                if (borrowingPO.getSyje() <= 0) {
                    logger.error("借支工作流[" + borrowingPO.getLcbh() + "]已经核销过了剩余金额[" + borrowingPO.getSyje() + "]\n");
                    continue;
                }
                BigDecimal clearAmount;//核销金额(还款金额)

                //核销的剩余总金额大于 借支单的剩余金额 全部核销
                if (leftAmout.compareTo(syje) >= 0) {
                    clearAmount = new BigDecimal(syje.doubleValue());
                    //如果是最后一个 取所有的剩余的钱
                    if (i == borrowingPOs.size() - 1) {
                        clearAmount = new BigDecimal(leftAmout.doubleValue());
                    }

                } else {
                    //部分核销
                    clearAmount = new BigDecimal(leftAmout.doubleValue());
                }

                //剩余总核销金额 减去此次核销的金额
                leftAmout = new BigDecimal(leftAmout.subtract(clearAmount).doubleValue());

                if (clearAmount.doubleValue() <= 0) {
                    logger.error("冲借支工作流[" + repaymentPO.getCjzgzl() + "]核销金额不能小于0!\n");
                    return;
                }


                //last total money

                borrowingPO.setHkje(new BigDecimal(borrowingPO.getHkje()).add(clearAmount).doubleValue());//更新后的还款金额
                borrowingPO.setSyje(new BigDecimal(borrowingPO.getSyje()).subtract(clearAmount).doubleValue());//更新后的剩余金额
                borrowingPO.setUpdate_time(currentTime);
                borrowingPO.setOp_user_id(userId);
                borrowingPO.setOp_user_name(userName);
                String remark = StringUtils.isEmpty(borrowingPO.getRemark()) ? "" : (borrowingPO.getRemark() + ",");
                borrowingPO.setRemark(remark + repaymentPO.getRemark());

                //update borroing po
                borrowingDao.update(borrowingPO);


                String serialNo = SerialNoUtils.getTimeSerialNoStr();
                Timestamp cTime = new Timestamp(System.currentTimeMillis());


                //新增还款记录
                BMS_statement_repayment_logPO repayLogPo = new BMS_statement_repayment_logPO();
                repayLogPo.setSerial_no(serialNo);//流水号
                repayLogPo.setLcbh(borrowingPO.getLcbh());//流程编号
                repayLogPo.setHkrq(repaymentPO.getHkrq());//还款日期
                repayLogPo.setRemark(remark);//
                repayLogPo.setHkfs(BMSConstant.C_HKFS_3);//还款方式
                repayLogPo.setHxje(clearAmount.doubleValue());//还款金额
                repayLogPo.setSyje(borrowingPO.getSyje());//更新后的剩余金额
                repayLogPo.setHxr(repaymentPO.getHxr());//核销人
                repayLogPo.setCjzgzl(repaymentPO.getCjzgzl());//冲借支工作流

                repayLogPo.setHkbm(borrowingPO.getSqbm());//还款部门 就用申请部门把
                repayLogPo.setCreate_time(cTime);
                repayLogPo.setUpdate_time(cTime);
                repayLogPo.setCreator(userId);
                repayLogPo.setOp_user_id(userId);
                repayLogPo.setCreator_name(userName);
                repayLogPo.setOp_user_name(userName);

                repayLogDao.add(repayLogPo);

                count++;
                logger.info("===dy_info ====核销第" + count + "条(共" + borrowingPOs.size() + " )条借支单条,借支单号[" + borrowingPO.getLcbh() + "]========");
            }


            //如果没有进行任何核销操作 则不修改此条还款单的状态
            if (count != 0) {
                //更新repay报表
                repaymentPO.setOa_clear_flag(BMSConstant.C_REPAY_CLEAR_FLAG_1);
                repaymentPO.setUpdate_time(new Timestamp(System.currentTimeMillis()));
                repaymentPO.setOp_user_id(userId);
                repaymentPO.setOp_user_name(userName);

                dataDao.update(repaymentPO);
                logger.info("===dy_info ====还款单[" + repaymentPO.getCjzgzl() + "]实际共核销" + +count + "条借支单");

            } else {
                logger.error("===dy_error ====还款单[" + repaymentPO.getCjzgzl() + "]未进行任何核销 状态不变========\n");

            }
        } catch (Exception e) {
            logger.error("===dy_error ====核销第" + index + "条(共" + size + " )条冲借支单条错误,冲借支单号[" + repaymentPO.getCjzgzl() + "]========\n");
            e.printStackTrace();
        }
    }
}

