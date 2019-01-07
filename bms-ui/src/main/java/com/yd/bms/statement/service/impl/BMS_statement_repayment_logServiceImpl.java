package com.yd.bms.statement.service.impl;

import com.yd.bms.statement.dao.BMS_statement_repayment_logDao;
import com.yd.bms.statement.pojo.data.BMS_statement_repayment_logData;
import com.yd.bms.statement.pojo.key.BMS_statement_repayment_logKey;
import com.yd.bms.statement.pojo.po.BMS_statement_repayment_logPO;
import com.yd.bms.statement.pojo.vo.BMS_statement_repayment_log_addVO;
import com.yd.bms.statement.pojo.vo.BMS_statement_repayment_log_queryVO;
import com.yd.bms.statement.pojo.vo.BMS_statement_repayment_log_updateVO;
import com.yd.bms.statement.service.BMS_statement_repayment_logService;
import com.yd.common.data.CIPPageInfo;
import com.yd.common.data.CIPReqCondition;
import com.yd.common.exception.CIPServiceException;
import com.yd.common.runtime.CIPErrorCode;
import com.yd.common.runtime.CIPRuntimeOperator;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

public abstract class BMS_statement_repayment_logServiceImpl implements BMS_statement_repayment_logService{
    protected Logger log = Logger.getLogger(getClass());



    // Dao
    @Autowired
    protected BMS_statement_repayment_logDao dataDao;




    /******************************************************************
    * 方法：addData - 新增
    *
    * 变量：vo - 新增VO
    * 变量：user - 用户信息
    *
    * 方法描述:
    *     新增记录还款日志-bms_statement_repayment_log
    ******************************************************************/
    @Override
    public void addData( BMS_statement_repayment_log_addVO vo,  CIPRuntimeOperator user){

    BMS_statement_repayment_logPO po = vo.toPO();
		Object[] keys = po.toKeys();
		BMS_statement_repayment_logPO po0 = dataDao.getSingle(keys);
		if( po0 != null ){
			throw new CIPServiceException(CIPErrorCode.ERROR_DUMPLICATE_PRIMARY_KEY);
		}
		
		//TODO 添加记录基本判断
		po.setCreate_time(Timestamp.valueOf(user.getOperate_tm()));
		po.setOp_user_id(user.getSubject_id());
		po.setUpdate_time(Timestamp.valueOf(user.getOperate_tm()));
		po.setCreator(user.getSubject_id());
		dataDao.add(po);
    }

    /******************************************************************
    * 方法：deleteData - 删除
    *
    * 变量：key - 删除Key
    * 变量：user - 用户信息
    *
    * 方法描述:
    *     删除记录还款日志-bms_statement_repayment_log
    ******************************************************************/
    @Override
    public void deleteData( BMS_statement_repayment_logKey key,  CIPRuntimeOperator user){

    dataDao.delete(key.toKeys());
    }

    /******************************************************************
    * 方法：getData - 查看
    *
    * 变量：key - 查看key
    * 变量：user - 用户信息
    *
    * 方法描述:
    *     查看记录还款日志-bms_statement_repayment_log
    ******************************************************************/
    @Override
    public BMS_statement_repayment_log_queryVO getData( BMS_statement_repayment_logKey key,  CIPRuntimeOperator user){

		BMS_statement_repayment_logPO po = dataDao.getSingle(key.toKeys());
		if(po == null)
			throw new CIPServiceException(CIPErrorCode.ERROR_RECORD_NOT_EXISTS);
			
		BMS_statement_repayment_log_queryVO vo = new BMS_statement_repayment_log_queryVO();
		BeanUtils.copyProperties(po, vo);
		
		return vo;
    }

    /******************************************************************
    * 方法：searchData - 查询
    *
    * 变量：page - 分页信息
    * 变量：conditions - 查询条件
    * 变量：user - 用户信息
    *
    * 方法描述:
    *     查询记录还款日志-bms_statement_repayment_log
    ******************************************************************/
    @Override
    public List<BMS_statement_repayment_logData> searchData( CIPPageInfo page, CIPReqCondition[] conditions,  CIPRuntimeOperator user){

		List<BMS_statement_repayment_logData> datas = dataDao.searchData(page, conditions);
		return datas;
    }

    /******************************************************************
    * 方法：updateData - 修改
    *
    * 变量：key - 修改Key
    * 变量：fields - 修改字段
    * 变量：user - 用户信息
    *
    * 方法描述:
    *     修改记录还款日志-bms_statement_repayment_log
    ******************************************************************/
    @Override
    public void updateData( BMS_statement_repayment_logKey key,  Map<String,Object> fields,  CIPRuntimeOperator user){

    	Object[] keys = key.toKeys();
    	
		BMS_statement_repayment_logPO po0 = dataDao.getSingle(keys);
		if( po0 == null ){
			throw new CIPServiceException(CIPErrorCode.ERROR_RECORD_NOT_EXISTS);
		}
		
    	dataDao.updateKV(fields, keys);
    }

    /******************************************************************
    * 方法：updateFullData - 全量修改
    *
    * 变量：vo - 修改VO
    * 变量：user - 用户信息
    *
    * 方法描述:
    *     全量修改记录还款日志-bms_statement_repayment_log
    ******************************************************************/
    @Override
    public void updateFullData( BMS_statement_repayment_log_updateVO vo,  CIPRuntimeOperator user){

		BMS_statement_repayment_logPO po = vo.toPO();
		Object[] keys = po.toKeys();
		BMS_statement_repayment_logPO po0 = dataDao.getSingle(keys);
		if( po0 == null ){
			throw new CIPServiceException(CIPErrorCode.ERROR_RECORD_NOT_EXISTS);
		}
		
		po.setOp_user_id(user.getSubject_id());
		
		po.setUpdate_time(Timestamp.valueOf(user.getOperate_tm()));
		
		dataDao.update(po);

    }

}

