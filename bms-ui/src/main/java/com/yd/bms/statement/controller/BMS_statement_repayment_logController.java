package com.yd.bms.statement.controller;

import com.yd.bms.statement.pojo.key.BMS_statement_repayment_logKey;
import com.yd.bms.statement.pojo.vo.BMS_statement_repayment_log_addVO;
import com.yd.common.data.CIPReqParameter;
import com.yd.common.data.CIPResponseMsg;
import com.yd.common.data.CIPResponseQueryMsg;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.RequestBody;

public interface BMS_statement_repayment_logController {





    /******************************************************************
    * 方法：addData - 新增
    *
    * 变量：vo - 新增VO
    *
    * 方法描述:
    *     新增记录还款日志-bms_statement_repayment_log
    ******************************************************************/
    public static final String C_ACTION_ADDDATA = "bms_statement_repayment_log_addData";
    public CIPResponseMsg addData(@RequestBody BMS_statement_repayment_log_addVO vo);

    /******************************************************************
    * 方法：deleteData - 删除
    *
    * 变量：key - 删除key
    *
    * 方法描述:
    *     删除记录还款日志-bms_statement_repayment_log
    ******************************************************************/
    public static final String C_ACTION_DELETEDATA = "bms_statement_repayment_log_deleteData";
    public CIPResponseMsg deleteData(@RequestBody BMS_statement_repayment_logKey key);

    /******************************************************************
    * 方法：exportData - 导出
    *
    * 变量：request - Http请求
    * 变量：response - Http响应
    *
    * 方法描述:
    *     导出记录还款日志-bms_statement_repayment_log
    ******************************************************************/
    public static final String C_ACTION_EXPORTDATA = "bms_statement_repayment_log_exportData";
    public void exportData(HttpServletRequest request, HttpServletResponse response);

    /******************************************************************
    * 方法：getData - 查看
    *
    * 变量：key - 查看Key
    *
    * 方法描述:
    *     查看记录还款日志-bms_statement_repayment_log
    ******************************************************************/
    public static final String C_ACTION_GETDATA = "bms_statement_repayment_log_getData";
    public CIPResponseMsg getData(@RequestBody BMS_statement_repayment_logKey key);

    /******************************************************************
    * 方法：importData - 导入
    *
    * 变量：request - Http请求
    * 变量：response - Http响应
    *
    * 方法描述:
    *     导入记录还款日志-bms_statement_repayment_log
    ******************************************************************/
    public static final String C_ACTION_IMPORTDATA = "bms_statement_repayment_log_importData";
    public CIPResponseMsg importData(HttpServletRequest request, HttpServletResponse response);

    /******************************************************************
    * 方法：searchData - 查询
    *
    * 变量：parameter - 检索参数
    *
    * 方法描述:
    *     查询记录还款日志-bms_statement_repayment_log
    ******************************************************************/
    public static final String C_ACTION_SEARCHDATA = "bms_statement_repayment_log_searchData";
    public CIPResponseQueryMsg searchData(CIPReqParameter parameter);

    /******************************************************************
    * 方法：updateData - 修改
    *
    * 变量：request - 修改VO
    *
    * 方法描述:
    *     修改记录还款日志-bms_statement_repayment_log
    ******************************************************************/
    public static final String C_ACTION_UPDATEDATA = "bms_statement_repayment_log_updateData";
    public CIPResponseMsg updateData(HttpServletRequest request);

}

