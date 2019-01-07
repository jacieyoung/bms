package com.yd.bms.org.service;

import com.yd.bms.org.pojo.data.BMS_org_relationData;
import com.yd.bms.org.pojo.key.BMS_org_relationKey;
import com.yd.bms.org.pojo.vo.BMS_org_relation_addVO;
import com.yd.bms.org.pojo.vo.BMS_org_relation_queryVO;
import com.yd.bms.org.pojo.vo.BMS_org_relation_updateVO;
import com.yd.common.data.CIPPageInfo;
import com.yd.common.data.CIPReqCondition;
import com.yd.common.runtime.CIPRuntimeOperator;

import java.io.File;
import java.util.List;
import java.util.Map;

public interface BMS_org_relationService {


    /******************************************************************
     * 方法：addData - 新增
     *
     * 变量：vo - 新增VO
     * 变量：user - 用户信息
     *
     * 方法描述:
     *     新增记录机构关系-bms_org_relation
     ******************************************************************/
    public void addData(BMS_org_relation_addVO vo, CIPRuntimeOperator user);

    /******************************************************************
     * 方法：deleteData - 删除
     *
     * 变量：key - 删除Key
     * 变量：user - 用户信息
     *
     * 方法描述:
     *     删除记录机构关系-bms_org_relation
     ******************************************************************/
    public void deleteData(BMS_org_relationKey key, CIPRuntimeOperator user);

    /******************************************************************
     * 方法：exportData - 导出
     *
     * 变量：exportPath - 导出文件路径
     * 变量：conditions - 查询条件
     * 变量：user - 用户信息
     *
     * 方法描述:
     *     导出记录机构关系-bms_org_relation
     ******************************************************************/
    public String exportData(String exportPath, CIPReqCondition[] conditions, CIPRuntimeOperator user);

    /******************************************************************
     * 方法：getData - 查看
     *
     * 变量：key - 查看key
     * 变量：user - 用户信息
     *
     * 方法描述:
     *     查看记录机构关系-bms_org_relation
     ******************************************************************/
    public BMS_org_relation_queryVO getData(BMS_org_relationKey key, CIPRuntimeOperator user);

    /******************************************************************
     * 方法：importData - 导入
     *
     * 变量：file - 导入文件
     * 变量：user - 用户信息
     *
     * 方法描述:
     *     导入记录机构关系-bms_org_relation
     ******************************************************************/
    public void importData(File file, CIPRuntimeOperator user);

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
    public List<BMS_org_relationData> searchData(CIPPageInfo page, CIPReqCondition[] conditions, CIPRuntimeOperator user);

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
    public void updateData(BMS_org_relationKey key, Map<String, Object> fields, CIPRuntimeOperator user);

    /******************************************************************
     * 方法：updateFullData - 全量修改
     *
     * 变量：vo - 修改VO
     * 变量：user - 用户信息
     *
     * 方法描述:
     *     修改记录机构关系-bms_org_relation
     ******************************************************************/
    public void updateFullData(BMS_org_relation_updateVO vo, CIPRuntimeOperator user);

}

