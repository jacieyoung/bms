package com.yd.bms.org.service.impl;

import com.yd.bms.org.dao.BMS_org_personDao;
import com.yd.bms.org.pojo.data.BMS_org_personData;
import com.yd.bms.org.pojo.key.BMS_org_personKey;
import com.yd.bms.org.pojo.po.BMS_org_personPO;
import com.yd.bms.org.pojo.vo.BMS_org_person_addVO;
import com.yd.bms.org.pojo.vo.BMS_org_person_queryVO;
import com.yd.bms.org.pojo.vo.BMS_org_person_updateVO;
import com.yd.bms.org.service.BMS_org_personService;
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

public abstract class BMS_org_personServiceImpl implements BMS_org_personService {
    protected Logger log = LoggerFactory.getLogger(getClass());


    // 人员信息Dao
    @Autowired
    protected BMS_org_personDao dataDao;
    // 网络机构和组织架构关系表Dao
//    @Autowired
//    protected BMS_net_org_relDao reldataDao;


    /******************************************************************
     * 方法：addData - 新增
     *
     * 变量：vo - 新增VO
     * 变量：user - 用户信息
     *
     * 方法描述:
     *     新增记录人员信息-bms_org_person
     ******************************************************************/
    @Override
    public void addData(BMS_org_person_addVO vo, CIPRuntimeOperator user) {

        BMS_org_personPO po = vo.toPO();
        Object[] keys = po.toKeys();
        BMS_org_personPO po0 = dataDao.getSingle(keys);
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
     *     删除记录人员信息-bms_org_person
     ******************************************************************/
    @Override
    public void deleteData(BMS_org_personKey key, CIPRuntimeOperator user) {

        dataDao.delete(key.toKeys());
    }

    /******************************************************************
     * 方法：getData - 查看
     *
     * 变量：key - 查看key
     * 变量：user - 用户信息
     *
     * 方法描述:
     *     查看记录人员信息-bms_org_person
     ******************************************************************/
    @Override
    public BMS_org_person_queryVO getData(BMS_org_personKey key, CIPRuntimeOperator user) {

        BMS_org_personPO po = dataDao.getSingle(key.toKeys());
        if (po == null)
            throw new CIPServiceException(CIPErrorCode.ERROR_RECORD_NOT_EXISTS);

        BMS_org_person_queryVO vo = new BMS_org_person_queryVO();
        po.toVO(vo);

        return vo;
    }
//
//    /******************************************************************
//     * 方法：getDomainValues - 全量修改
//     *
//     * 变量：tableId
//     * 变量：domainId
//     * 变量：hr_org_id
//     * 方法描述:
//     *
//     ******************************************************************/
//    @Override
//    public List<DomainValueData> getDomain(String tableId, String domainId) {
//        CIPRuntimeOperator user = CIPRuntime.getOperateSubject();// 系统用户信息
//        String orgId = user.getSubject_org();//获取组织机构编码
//        String userId = user.getSubject_id();
//
//        String org_id = RouteUtils.getRoute(orgId, userId);
//        ;
//
//        List<BMS_net_org_relData> datas = reldataDao.searchHrorgData(org_id);
//        if (datas == null || datas.size() < 1) {
//            throw new CIPServiceException(new CIPErrorCode(156428, "该路由组织未关联HR请联系管理员"));
//        }
//        String Hr_org = "";
//        for (int i = 0; i < datas.size(); i++) {
//            Hr_org += datas.get(i).getHr_org_id() + ",";
//        }
//        String hr_org_id = Hr_org.substring(0, Hr_org.length() - 1);
//
//
//        return dataDao.getDomainValues(tableId, domainId, hr_org_id);
//    }

    /******************************************************************
     * 方法：searchData - 查询
     *
     * 变量：page - 分页信息
     * 变量：conditions - 查询条件
     * 变量：user - 用户信息
     *
     * 方法描述:
     *     查询记录人员信息-bms_org_person
     ******************************************************************/
    @Override
    public List<BMS_org_personData> searchData(CIPPageInfo page, CIPReqCondition[] conditions, CIPRuntimeOperator user) {

        List<BMS_org_personData> datas = dataDao.searchData(page, conditions);
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
     *     修改记录人员信息-bms_org_person
     ******************************************************************/
    @Override
    public void updateData(BMS_org_personKey key, Map<String, Object> fields, CIPRuntimeOperator user) {

        Object[] keys = key.toKeys();

        BMS_org_personPO po0 = dataDao.getSingle(keys);
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
     *     修改记录人员信息-bms_org_person
     ******************************************************************/
    @Override
    public void updateFullData(BMS_org_person_updateVO vo, CIPRuntimeOperator user) {

        BMS_org_personPO po = vo.toPO();
        Object[] keys = po.toKeys();
        BMS_org_personPO po0 = dataDao.getSingle(keys);
        if (po0 == null) {
            throw new CIPServiceException(CIPErrorCode.ERROR_RECORD_NOT_EXISTS);
        }

        po.setOp_user_id(user.getSubject_id());

        po.setUpdate_time(Timestamp.valueOf(user.getOperate_tm()));

        dataDao.update(po);

    }

}

