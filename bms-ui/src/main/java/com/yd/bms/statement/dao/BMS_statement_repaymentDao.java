package com.yd.bms.statement.dao;

import com.yd.bms.statement.pojo.data.BMS_statement_repaymentData;
import com.yd.bms.statement.pojo.po.BMS_statement_repaymentPO;
import com.yd.common.data.CIPPageInfo;
import com.yd.common.data.CIPReqCondition;

import java.util.List;
import java.util.Map;

public interface BMS_statement_repaymentDao {





    /******************************************************************
    * 方法：add - 新增
    *
    * 变量：po - PO
    *
    * 方法描述:
    *     新增
    ******************************************************************/
    public void add(BMS_statement_repaymentPO po);

    /******************************************************************
    * 方法：addBatch - 批量新增
    *
    * 变量：pos - POs
    *
    * 方法描述:
    *     批量新增
    ******************************************************************/
    public void addBatch(List<BMS_statement_repaymentPO> pos);

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
    public List<BMS_statement_repaymentPO> getPOs(Map<String, Object> conditions);

    /******************************************************************
    * 方法：getSingle - 查看
    *
    * 变量：keys - keys
    *
    * 方法描述:
    *     查看
    ******************************************************************/
    public BMS_statement_repaymentPO getSingle(Object... keys);

    /******************************************************************
    * 方法：searchData - 查询
    *
    * 变量：page - 分页信息
    * 变量：conditions - 查询条件
    *
    * 方法描述:
    *     查询
    ******************************************************************/
    public List<BMS_statement_repaymentData> searchData(CIPPageInfo page, CIPReqCondition[] conditions);

    /******************************************************************
    * 方法：update - 修改
    *
    * 变量：po - PO
    *
    * 方法描述:
    *     修改
    ******************************************************************/
    public void update(BMS_statement_repaymentPO po);

    /******************************************************************
    * 方法：updateKV - 修改具体字段
    *
    * 变量：fields - 修改字段
    * 变量：keys - keys
    *
    * 方法描述:
    *     修改具体字段
    ******************************************************************/
    public void updateKV(Map<String, Object> fields, Object... keys);

    /******************************************************************
    * 方法：updateKVBatch - 批量修改具体字段
    *
    * 变量：updateFields - 修改字段
    *
    * 方法描述:
    *     批量修改具体字段
    ******************************************************************/
    public void updateKVBatch(Map<Object[], Map<String, Object>> updateFields);

}

