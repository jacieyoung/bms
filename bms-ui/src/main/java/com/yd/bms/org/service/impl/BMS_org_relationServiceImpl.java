package com.yd.bms.org.service.impl;

import com.yd.bms.org.dao.BMS_org_relationDao;
import com.yd.bms.org.pojo.data.BMS_org_relationData;
import com.yd.bms.org.pojo.key.BMS_org_relationKey;
import com.yd.bms.org.pojo.po.BMS_org_relationPO;
import com.yd.bms.org.pojo.vo.BMS_org_relation_addVO;
import com.yd.bms.org.pojo.vo.BMS_org_relation_queryVO;
import com.yd.bms.org.pojo.vo.BMS_org_relation_updateVO;
import com.yd.bms.org.service.BMS_org_relationService;
import com.yd.common.data.CIPPageInfo;
import com.yd.common.data.CIPReqCondition;
import com.yd.common.exception.CIPServiceException;
import com.yd.common.runtime.CIPErrorCode;
import com.yd.common.runtime.CIPRuntimeOperator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

public abstract class BMS_org_relationServiceImpl implements BMS_org_relationService {
    protected Logger log = LoggerFactory.getLogger(getClass());


    // 机构关系Dao
    @Autowired
    protected BMS_org_relationDao dataDao;


    /******************************************************************
     * 方法：addData - 新增
     *
     * 变量：vo - 新增VO
     * 变量：user - 用户信息
     *
     * 方法描述:
     *     新增记录机构关系-bms_org_relation
     ******************************************************************/
    @Override
    public void addData(BMS_org_relation_addVO vo, CIPRuntimeOperator user) {

        BMS_org_relationPO po = vo.toPO();
        Object[] keys = po.toKeys();
        BMS_org_relationPO po0 = dataDao.getSingle(keys);
        if (po0 != null) {
            throw new CIPServiceException(CIPErrorCode.ERROR_DUMPLICATE_PRIMARY_KEY);
        }

        //TODO 添加记录基本判断
        po.setCreate_time(Timestamp.valueOf(user.getOperate_tm()));
        po.setOp_user_id(user.getSubject_id());
        po.setUpdate_time(Timestamp.valueOf(user.getOperate_tm()));

        dataDao.add(po);
    }

    /******************************************************************
     * 方法：deleteData - 删除
     *
     * 变量：key - 删除Key
     * 变量：user - 用户信息
     *
     * 方法描述:
     *     删除记录机构关系-bms_org_relation
     ******************************************************************/
    @Override
    public void deleteData(BMS_org_relationKey key, CIPRuntimeOperator user) {

        dataDao.delete(key.toKeys());
    }

    /******************************************************************
     * 方法：getData - 查看
     *
     * 变量：key - 查看key
     * 变量：user - 用户信息
     *
     * 方法描述:
     *     查看记录机构关系-bms_org_relation
     ******************************************************************/
    @Override
    public BMS_org_relation_queryVO getData(BMS_org_relationKey key, CIPRuntimeOperator user) {

        BMS_org_relationPO po = dataDao.getSingle(key.toKeys());
        if (po == null)
            throw new CIPServiceException(CIPErrorCode.ERROR_RECORD_NOT_EXISTS);

        BMS_org_relation_queryVO vo = new BMS_org_relation_queryVO();
        po.toVO(vo);

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
     *     查询记录机构关系-bms_org_relation
     ******************************************************************/
    @Override
    public List<BMS_org_relationData> searchData(CIPPageInfo page, CIPReqCondition[] conditions, CIPRuntimeOperator user) {

        List<BMS_org_relationData> datas = dataDao.searchData(page, conditions);
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
     *     修改记录机构关系-bms_org_relation
     ******************************************************************/
    @Override
    public void updateData(BMS_org_relationKey key, Map<String, Object> fields, CIPRuntimeOperator user) {

        Object[] keys = key.toKeys();

        BMS_org_relationPO po0 = dataDao.getSingle(keys);
        if (po0 == null) {
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
     *     修改记录机构关系-bms_org_relation
     ******************************************************************/
    @Override
    public void updateFullData(BMS_org_relation_updateVO vo, CIPRuntimeOperator user) {

        BMS_org_relationPO po = vo.toPO();
        Object[] keys = po.toKeys();
        BMS_org_relationPO po0 = dataDao.getSingle(keys);
        if (po0 == null) {
            throw new CIPServiceException(CIPErrorCode.ERROR_RECORD_NOT_EXISTS);
        }

        po.setOp_user_id(user.getSubject_id());

        po.setUpdate_time(Timestamp.valueOf(user.getOperate_tm()));

        dataDao.update(po);

    }

}

