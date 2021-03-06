package com.yd.bms.statement.controller.local;

import com.yd.bms.statement.constant.BMS_statement_borrowingConstant;
import com.yd.bms.statement.constant.BMS_statement_repayment_logConstant;
import com.yd.bms.statement.controller.BMS_statement_repayment_logController;
import com.yd.bms.statement.pojo.key.BMS_statement_repayment_logKey;
import com.yd.bms.statement.pojo.vo.BMS_statement_repayment_log_addVO;
import com.yd.bms.statement.service.BMS_statement_repayment_logService;
import com.yd.common.data.*;
import com.yd.common.exception.CIPRuntimeException;
import com.yd.common.runtime.CIPErrorCode;
import com.yd.common.runtime.CIPRuntime;
import com.yd.common.runtime.CIPRuntimeConfigure;
import com.yd.common.utils.CIPUtil;
import com.yd.common.utils.ExcelSheetParser;
import com.yd.common.utils.JSONUtils;
import com.yd.common.utils.StringUtils;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.util.Map;

@Component
public class LBMS_statement_repayment_logControllerImpl implements BMS_statement_repayment_logController {

    // Service
    @Autowired
    protected BMS_statement_repayment_logService dataService;


    /******************************************************************
     * 方法：addData - 新增
     *
     * 变量：vo - 新增VO
     *
     * 方法描述:
     *     新增记录还款日志-bms_statement_repayment_log
     ******************************************************************/
    public CIPResponseMsg addData(BMS_statement_repayment_log_addVO vo) {

        CIPResponseMsg msg = new CIPResponseMsg();
        boolean xAuth = true;
        // CIPAuthLock lock = CIPRuntime.authManager.getAuthLock("authObject");
        // lock.setAuthValue("authAtribute", String.valueOf(vo.getAttribute()));
        // xAuth = CIPRuntime.authManager.checkBehavior(C_ACTION_ADD_DATA, lock);
        if (xAuth) {
            dataService.addData(vo, CIPRuntime.getOperateSubject());
            msg.errorCode = CIPErrorCode.CALL_SUCCESS.code;
            msg.msg = CIPErrorCode.CALL_SUCCESS.name;
        } else {
            msg.errorCode = CIPErrorCode.ERROR_INVALID_AUTHORIZATION.code;
            msg.msg = CIPErrorCode.ERROR_INVALID_AUTHORIZATION.name;
        }
        return msg;

    }

    /******************************************************************
     * 方法：deleteData - 删除
     *
     * 变量：key - 删除key
     *
     * 方法描述:
     *     删除记录还款日志-bms_statement_repayment_log
     ******************************************************************/
    public CIPResponseMsg deleteData(BMS_statement_repayment_logKey key) {

        CIPResponseMsg msg = new CIPResponseMsg();
        boolean xAuth = true;
        // CIPAuthLock lock = CIPRuntime.authManager.getAuthLock("authObject");
        // lock.setAuthValue("authAtribute", String.valueOf(vo.getAttribute()));
        // xAuth = CIPRuntime.authManager.checkBehavior(C_ACTION_ADD_DATA, lock);
        if (xAuth) {
            dataService.deleteData(key, CIPRuntime.getOperateSubject());
            msg.errorCode = CIPErrorCode.CALL_SUCCESS.code;
            msg.msg = CIPErrorCode.CALL_SUCCESS.name;
        } else {
            msg.errorCode = CIPErrorCode.ERROR_INVALID_AUTHORIZATION.code;
            msg.msg = CIPErrorCode.ERROR_INVALID_AUTHORIZATION.name;
        }
        return msg;
    }

    /******************************************************************
     * 方法：exportData - 导出
     *
     * 变量：request - Http请求
     * 变量：response - Http响应
     *
     * 方法描述:
     *     导出记录还款日志-bms_statement_repayment_log
     ******************************************************************/
    public void exportData(HttpServletRequest request, HttpServletResponse response) {

        String exportFilePath = null;
        exportFilePath = CIPRuntimeConfigure.cip_temp_file_path;

        String conditonStr;
        try {
            conditonStr = request.getParameter("search_condition");

            //用户特定的数据权限约束
            CIPReqCondition[] otherConds = CIPRuntime.authManager.getAuthConditions(C_ACTION_EXPORTDATA, "authOrg");
            int length = 0;
            if (otherConds != null) {
                length = otherConds.length;
            }

            CIPReqCondition[] conditions = null;
            if (conditonStr != null) {
                CIPReqCondition[] tempConditions = JSONUtils.convertJson2Object(conditonStr, CIPReqCondition[].class);
                int i = 0;
                if (tempConditions != null)
                    i = tempConditions.length;

                if (i > 0) {
                    conditions = new CIPReqCondition[i + length];
                    System.arraycopy(tempConditions, 0, conditions, 0, i);
                    if (length > 0)
                        System.arraycopy(otherConds, 0, conditions, i, length);
                } else {
                    conditions = otherConds;
                }
            } else {
                conditions = otherConds;
            }

            //todo lly 转换查询条件 多表查询时 设置alias
            if (conditions != null && conditions.length > 0) {
                for (CIPReqCondition condition : conditions) {
                    if (BMS_statement_borrowingConstant.C_FIELD_SQR.equals(condition.getFieldName())
                            || BMS_statement_borrowingConstant.C_FIELD_SQBM.equals(condition.getFieldName())) {
                        condition.setAlias("borrow");
                    } else if(BMS_statement_borrowingConstant.C_FIELD_SQR_NAME.equals(condition.getFieldName())){
                        condition.setAlias("user_info");
                        condition.setFieldName("user_name");
                        condition.setOperator(CIPOperatorType.LIKE.code);
                    }

                }
            }
            //调用导出服务
            String exportFile = dataService.exportData(exportFilePath, conditions, CIPRuntime.getOperateSubject());
            if (!StringUtils.isEmpty(exportFile)) {
                CIPUtil.downloadFile(exportFile, response, false);

            } else {
                throw new CIPRuntimeException(new CIPErrorCode(999999, "导出文件生成失败！"));
            }
        } catch (IOException e) {
            throw new CIPRuntimeException(new CIPErrorCode(999999, "导出文件生成失败！"));
        }

    }

    /******************************************************************
     * 方法：getData - 查看
     *
     * 变量：key - 查看Key
     *
     * 方法描述:
     *     查看记录还款日志-bms_statement_repayment_log
     ******************************************************************/
    public CIPResponseMsg getData(BMS_statement_repayment_logKey key) {

        CIPResponseMsg msg = new CIPResponseMsg();
        boolean xAuth = true;
        // CIPAuthLock lock = CIPRuntime.authManager.getAuthLock("authObject");
        // lock.setAuthValue("authAtribute", String.valueOf(vo.getAttribute()));
        // xAuth = CIPRuntime.authManager.checkBehavior(C_ACTION_ADD_DATA, lock);
        if (xAuth) {
            msg.data = dataService.getData(key, CIPRuntime.getOperateSubject());
            msg.errorCode = CIPErrorCode.CALL_SUCCESS.code;
            msg.msg = CIPErrorCode.CALL_SUCCESS.name;
        } else {
            msg.errorCode = CIPErrorCode.ERROR_INVALID_AUTHORIZATION.code;
            msg.msg = CIPErrorCode.ERROR_INVALID_AUTHORIZATION.name;
        }
        return msg;
    }

    /******************************************************************
     * 方法：importData - 导入
     *
     * 变量：request - Http请求
     * 变量：response - Http响应
     *
     * 方法描述:
     *     导入记录还款日志-bms_statement_repayment_log
     ******************************************************************/
    public CIPResponseMsg importData(HttpServletRequest request, HttpServletResponse response) {

        CIPResponseMsg msg = new CIPResponseMsg();
        String templateName = request.getParameter("templateName");//下载模板的名字
        //参数中带了下载模板的名字则进行模板下载,否则就是处理文件导入的逻辑
        if (!StringUtils.isEmpty(templateName)) {
            try {
                templateName = URLDecoder.decode(templateName, "utf-8");
                String filePath = request.getServletContext().getRealPath("/template/" + templateName);//模板文件的存放路径

                File templateFile = new File(filePath);
                if (templateFile.exists()) {
                    //文件下载
                    CIPUtil.downloadFile(filePath, response, true);
                } else {
                    //生成模板文件
                    response.reset(); //非常重要
                    response.setContentType("application/x-msdownload");

                    response.setHeader("Content-Disposition", "attachment;filename=" + templateName);
                    OutputStream out = response.getOutputStream();

                    response.setCharacterEncoding("UTF-8");
                    SXSSFWorkbook wb = ExcelSheetParser.createWorkBook(templateName, BMS_statement_repayment_logConstant.getExcelTitle(), null);
                    wb.write(out);
                }
            } catch (Exception e) {
                throw new CIPRuntimeException(new CIPErrorCode(500, "亲,不好意思,下载模板出错了!"));
            }
        } else {
            File file = CIPUtil.uploadFile(request, response);
            dataService.importData(file, CIPRuntime.getOperateSubject());
            msg.errorCode = CIPErrorCode.CALL_SUCCESS.code;
            msg.msg = CIPErrorCode.CALL_SUCCESS.name;
        }
        return msg;

    }

    /******************************************************************
     * 方法：searchData - 查询
     *
     * 变量：parameter - 检索参数
     *
     * 方法描述:
     *     查询记录还款日志-bms_statement_repayment_log
     ******************************************************************/
    public CIPResponseQueryMsg searchData(CIPReqParameter parameter) {

        CIPResponseQueryMsg msg = new CIPResponseQueryMsg();
        CIPPageInfo page = new CIPPageInfo(parameter.getPage(), parameter.getRows());

        //用户特定的数据权限约束
        CIPReqCondition[] otherConds = CIPRuntime.authManager.getAuthConditions(C_ACTION_SEARCHDATA, "authOrg");
        int length = 0;
        if (otherConds != null) {
            length = otherConds.length;
        }

        String conditonStr = parameter.getSearch_condition();
        CIPReqCondition[] conditions = null;
        if (conditonStr != null) {
            CIPReqCondition[] tempConditions = JSONUtils.convertJson2Object(conditonStr, CIPReqCondition[].class);
            int i = 0;
            if (tempConditions != null)
                i = tempConditions.length;

            if (i > 0) {
                conditions = new CIPReqCondition[i + length];
                System.arraycopy(tempConditions, 0, conditions, 0, i);
                if (length > 0)
                    System.arraycopy(otherConds, 0, conditions, i, length);
            } else {
                conditions = otherConds;
            }
        } else {
            conditions = otherConds;
        }

        //todo lly 转换查询条件 多表查询时 设置alias
        if (conditions != null && conditions.length > 0) {
            for (CIPReqCondition condition : conditions) {
                if (BMS_statement_borrowingConstant.C_FIELD_SQR.equals(condition.getFieldName())
                        || BMS_statement_borrowingConstant.C_FIELD_SQBM.equals(condition.getFieldName())) {
                    condition.setAlias("borrow");
                }else if(BMS_statement_borrowingConstant.C_FIELD_SQR_NAME.equals(condition.getFieldName())){
                    condition.setAlias("user_info");
                    condition.setFieldName("user_name");
                    condition.setOperator(CIPOperatorType.LIKE.code);
                }

            }
        }
        msg.rows = dataService.searchData(page, conditions, CIPRuntime.getOperateSubject());

        msg.errorCode = CIPErrorCode.CALL_SUCCESS.code;
        msg.msg = CIPErrorCode.CALL_SUCCESS.name;
        msg.total = page.getTotal();

        return msg;


    }

    /******************************************************************
     * 方法：updateData - 修改
     *
     * 变量：request - 修改VO
     *
     * 方法描述:
     *     修改记录还款日志-bms_statement_repayment_log
     ******************************************************************/
    public CIPResponseMsg updateData(HttpServletRequest request) {

        CIPResponseMsg msg = new CIPResponseMsg();
        boolean xAuth = true;
        // CIPAuthLock lock = CIPRuntime.authManager.getAuthLock("authObject");
        // lock.setAuthValue("authAtribute", String.valueOf(vo.getAttribute()));
        // xAuth = CIPRuntime.authManager.checkBehavior(C_ACTION_ADD_DATA, lock);
        if (xAuth) {
            BufferedReader reader;
            StringBuffer sb = new StringBuffer();
            try {
                reader = request.getReader();
                String line;
                while ((line = reader.readLine()) != null) {
                    sb.append(line);
                }
            } catch (IOException e) {
                msg.errorCode = 999999;
                msg.msg = e.getMessage();
                return msg;
            }
            CIPUpdateParameter parameter = JSONUtils.convertDataJson2Object(sb.toString(), CIPUpdateParameter.class);
            BMS_statement_repayment_logKey keys = JSONUtils.convertDataJson2Object(parameter.keys, BMS_statement_repayment_logKey.class);
            Map<String, Object> fields = JSONUtils.convertJson2Map(parameter.fields);
            dataService.updateData(keys, fields, CIPRuntime.getOperateSubject());
            msg.errorCode = CIPErrorCode.CALL_SUCCESS.code;
            msg.msg = CIPErrorCode.CALL_SUCCESS.name;
        } else {
            msg.errorCode = CIPErrorCode.ERROR_INVALID_AUTHORIZATION.code;
            msg.msg = CIPErrorCode.ERROR_INVALID_AUTHORIZATION.name;
        }
        return msg;

    }

}

