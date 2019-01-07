package com.yd.bms.statement.service;

import com.yd.bms.statement.pojo.data.BMS_statement_borrowingData;
import com.yd.bms.statement.pojo.key.BMS_statement_borrowingKey;
import com.yd.bms.statement.pojo.vo.BMS_statement_borrowing_addVO;
import com.yd.bms.statement.pojo.vo.BMS_statement_borrowing_queryVO;
import com.yd.bms.statement.pojo.vo.BMS_statement_borrowing_updateVO;
import com.yd.common.data.CIPPageInfo;
import com.yd.common.data.CIPReqCondition;
import com.yd.common.runtime.CIPRuntimeOperator;

import java.io.File;
import java.util.List;
import java.util.Map;

public interface BMS_statement_borrowingService {


    /******************************************************************
     * 方法：addData - 新增
     *
     * 变量：vo - 新增VO
     * 变量：user - 用户信息
     *
     * 方法描述:
     *     新增记录借支管理报表-bms_statement_borrowing
     ******************************************************************/
    public void addData(BMS_statement_borrowing_addVO vo, CIPRuntimeOperator user);

    /******************************************************************
     * 方法：deleteData - 删除
     *
     * 变量：key - 删除Key
     * 变量：user - 用户信息
     *
     * 方法描述:
     *     删除记录借支管理报表-bms_statement_borrowing
     ******************************************************************/
    public void deleteData(BMS_statement_borrowingKey key, CIPRuntimeOperator user);

    /******************************************************************
     * 方法：exportData - 导出
     *
     * 变量：exportPath - 导出文件路径
     * 变量：conditions - 查询条件
     * 变量：user - 用户信息
     *
     * 方法描述:
     *     导出记录借支管理报表-bms_statement_borrowing
     ******************************************************************/
    public String exportData(String exportPath, CIPReqCondition[] conditions, CIPRuntimeOperator user);

    /******************************************************************
     * 方法：getData - 查看
     *
     * 变量：key - 查看key
     * 变量：user - 用户信息
     *
     * 方法描述:
     *     查看记录借支管理报表-bms_statement_borrowing
     ******************************************************************/
    public BMS_statement_borrowing_queryVO getData(BMS_statement_borrowingKey key, CIPRuntimeOperator user);

    /******************************************************************
     * 方法：importData - 导入
     *
     * 变量：file - 导入文件
     * 变量：user - 用户信息
     *
     * 方法描述:
     *     导入记录借支管理报表-bms_statement_borrowing
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
     *     查询记录借支管理报表-bms_statement_borrowing
     ******************************************************************/
    public List<BMS_statement_borrowingData> searchData(CIPPageInfo page, CIPReqCondition[] conditions, CIPRuntimeOperator user);

    /******************************************************************
     * 方法：updateData - 修改
     *
     * 变量：key - 修改Key
     * 变量：fields - 修改字段
     * 变量：user - 用户信息
     *
     * 方法描述:
     *     修改记录借支管理报表-bms_statement_borrowing
     ******************************************************************/
    public void updateData(BMS_statement_borrowingKey key, Map<String, Object> fields, CIPRuntimeOperator user);

    /******************************************************************
     * 方法：updateFullData - 全量修改
     *
     * 变量：vo - 修改VO
     * 变量：user - 用户信息
     *
     * 方法描述:
     *     全量修改记录借支管理报表-bms_statement_borrowing
     ******************************************************************/
    public void updateFullData(BMS_statement_borrowing_updateVO vo, CIPRuntimeOperator user);

    /******************************************************************
     * 方法：RepayData - 修改
     *
     * 变量：key - 修改Key
     * 变量：fields - 修改字段
     * 变量：user - 用户信息
     *
     * 方法描述:
     *     修改记录借支管理报表-bms_statement_borrowing
     ******************************************************************/
    public void repayData(BMS_statement_borrowingKey keys, Map<String, Object> fields, CIPRuntimeOperator operateSubject);
}

