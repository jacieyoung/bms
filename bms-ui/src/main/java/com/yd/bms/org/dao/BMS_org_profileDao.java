package com.yd.bms.org.dao;

import com.yd.bms.org.pojo.data.BMS_org_profileData;
import com.yd.bms.org.pojo.po.BMS_org_profilePO;
import com.yd.common.data.CIPPageInfo;
import com.yd.common.data.CIPReqCondition;
import com.yd.common.function.domain.data.CIPDomainValueData;

import java.util.List;
import java.util.Map;

public interface BMS_org_profileDao {


    /******************************************************************
     * 方法：add - 新增
     *
     * 变量：po - 机构信息PO
     *
     * 方法描述:
     *     新增
     ******************************************************************/
    public void add(BMS_org_profilePO po);

    /******************************************************************
     * 方法：addBatch - 批量新增
     *
     * 变量：pos - POs
     *
     * 方法描述:
     *     批量新增
     ******************************************************************/
    public void addBatch(List<BMS_org_profilePO> pos);

    /******************************************************************
     * 方法：delete - 删除
     *
     * 变量：keys - keys
     *
     * 方法描述:
     *     删除
     ******************************************************************/
    public void delete(Object... keys);

    /******************************************************************
     * 方法：export - 导出
     *
     * 变量：conditions - 查询条件
     *
     * 方法描述:
     *     导出
     ******************************************************************/
    public String export(CIPReqCondition[] conditions);

    /******************************************************************
     * 方法：getPOs - 属性查询
     *
     * 变量：conditions - 属性列表
     *
     * 方法描述:
     *     属性查询
     ******************************************************************/
    public List<BMS_org_profilePO> getPOs(Map<String, Object> conditions);

    /******************************************************************
     * 方法：getSingle - 查看
     *
     * 变量：keys - keys
     *
     * 方法描述:
     *     查看
     ******************************************************************/
    public BMS_org_profilePO getSingle(Object... keys);

    /******************************************************************
     * 方法：searchData - 查询
     *
     * 变量：page - 分页信息
     * 变量：conditions - 查询条件
     *
     * 方法描述:
     *     查询
     ******************************************************************/
    public List<BMS_org_profileData> searchData(CIPPageInfo page, CIPReqCondition[] conditions);

    /******************************************************************
     * 方法：searchData - 查询
     *
     * 变量：page - 分页信息
     * 变量：conditions - 查询条件
     *
     * 方法描述:
     *     查询
     ******************************************************************/
    public List<BMS_org_profileData> likeSearchDataByReport(CIPPageInfo page, CIPReqCondition[] conditions);

    /******************************************************************
     * 方法：searchData - 查询
     *
     * 变量：page - 分页信息
     * 变量：conditions - 查询条件
     *
     * 方法描述:
     *     查询
     ******************************************************************/
    public List<BMS_org_profileData> likeSearchDataByResp(CIPPageInfo page, CIPReqCondition[] conditions);

    /******************************************************************
     * 方法：searchData - 查询
     *
     * 变量：page - 分页信息
     * 变量：conditions - 查询条件
     *
     * 方法描述:
     *     查询
     ******************************************************************/
    public List<BMS_org_profileData> likeSearchDataByCust(CIPPageInfo page, CIPReqCondition[] conditions);

    /******************************************************************
     * 方法：searchData - 查询
     *
     * 变量：page - 分页信息
     * 变量：conditions - 查询条件
     *
     * 方法描述:
     *     查询
     ******************************************************************/
    public List<BMS_org_profileData> likeSearchData(CIPPageInfo page, CIPReqCondition[] conditions);

    /******************************************************************
     * 方法：update - 修改
     *
     * 变量：po - 机构信息PO
     *
     * 方法描述:
     *     修改
     ******************************************************************/
    public void update(BMS_org_profilePO po);

    /******************************************************************
     * 方法：updateKV - 修改具体字段
     *
     * 变量：fields - 修改字段
     * 变量：keys - 修改Key
     *
     * 方法描述:
     *     修改具体字段
     ******************************************************************/
    public void updateKV(Map<String, Object> fields, Object... keys);

    /******************************************************************
     * 方法：getDomainValues - 全量修改
     *
     * 变量：tableId
     * 变量：domainId
     *
     * 方法描述:
     *
     ******************************************************************/
    public List<CIPDomainValueData> getDomainValues(String tableId, String domainId);

    public List<CIPDomainValueData> loadAllOrg();

    /******************************************************************
     * 方法：loadData - 查询部门下拉框
     *
     * 变量：tableId
     * 变量：domainId
     *
     * 方法描述:
     *
     ******************************************************************/
    public List<BMS_org_profileData> loadData(String tableId,String domainId);
}

