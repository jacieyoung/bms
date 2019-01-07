package com.yd.bms.org.dao;

import com.yd.bms.org.pojo.data.BMS_org_personData;
import com.yd.bms.org.pojo.data.DomainValueData;
import com.yd.bms.org.pojo.po.BMS_org_personPO;
import com.yd.common.data.CIPPageInfo;
import com.yd.common.data.CIPReqCondition;

import java.util.List;
import java.util.Map;

public interface BMS_org_personDao {


    /******************************************************************
     * 方法：add - 新增
     *
     * 变量：po - 人员信息PO
     *
     * 方法描述:
     *     新增
     ******************************************************************/
    public void add(BMS_org_personPO po);

    /******************************************************************
     * 方法：addBatch - 批量新增
     *
     * 变量：pos - POs
     *
     * 方法描述:
     *     批量新增
     ******************************************************************/
    public void addBatch(List<BMS_org_personPO> pos);

    /******************************************************************
     * 方法：getDomainValues - 全量修改
     *
     * 变量：tableId
     * 变量：domainId
     * 变量：hr_org_id
     * 方法描述:
     *
     ******************************************************************/
    public List<DomainValueData> getDomainValues(String tableId, String domainId, String hr_org_id);

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
    public List<BMS_org_personPO> getPOs(Map<String, Object> conditions);

    /******************************************************************
     * 方法：getSingle - 查看
     *
     * 变量：keys - keys
     *
     * 方法描述:
     *     查看
     ******************************************************************/
    public BMS_org_personPO getSingle(Object... keys);

    /******************************************************************
     * 方法：searchData - 查询
     *
     * 变量：page - 分页信息
     * 变量：conditions - 查询条件
     *
     * 方法描述:
     *     查询
     ******************************************************************/
    public List<BMS_org_personData> searchData(CIPPageInfo page, CIPReqCondition[] conditions);

    /******************************************************************
     * 方法：update - 修改
     *
     * 变量：po - 人员信息PO
     *
     * 方法描述:
     *     修改
     ******************************************************************/
    public void update(BMS_org_personPO po);

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

}

