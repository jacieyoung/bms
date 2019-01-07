package com.yd.bms.statement.controller.impl;

import com.yd.bms.statement.controller.BMS_statement_repayment_logController;
import com.yd.bms.statement.pojo.key.BMS_statement_repayment_logKey;
import com.yd.bms.statement.pojo.vo.BMS_statement_repayment_log_addVO;
import com.yd.common.data.CIPReqParameter;
import com.yd.common.data.CIPResponseMsg;
import com.yd.common.data.CIPResponseQueryMsg;
import com.yd.common.exception.CIPDaoException;
import com.yd.common.exception.CIPRuntimeException;
import com.yd.common.exception.CIPServiceException;
import com.yd.common.runtime.CIPErrorCode;
import com.yd.common.utils.JSONUtils;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController(value="BMS_statement_repayment_logController")
@RequestMapping(value = "/actions/bms_statement_repayment_log")
public class BMS_statement_repayment_logControllerImpl  implements BMS_statement_repayment_logController{
    protected Logger log = Logger.getLogger(getClass());



    // 本地控制实现
    @Autowired
    private BMS_statement_repayment_logController actionComponent;




    /******************************************************************
    * 方法：addData - 新增
    *
    * 变量：vo - 新增VO
    *
    * 方法描述:
    *     新增记录还款日志-bms_statement_repayment_log
    ******************************************************************/
    @RequestMapping(value="/addData")
    public CIPResponseMsg addData(@RequestBody BMS_statement_repayment_log_addVO vo){

        CIPResponseMsg msg = null;
        try {
            msg = actionComponent.addData(vo);
        } catch (CIPServiceException e) {
            log.error(e.getMessage(), e);
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (CIPDaoException e) {
            log.error(e.getMessage(), e);
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (CIPRuntimeException e) {
            log.error(e.getMessage(), e);
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            msg = new CIPResponseMsg();
            msg.errorCode = 9999;
            msg.msg = "未知错误,请联系管理员!";
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
    @RequestMapping(value="/deleteData")
    public CIPResponseMsg deleteData(@RequestBody BMS_statement_repayment_logKey key){

        CIPResponseMsg msg = null;
        try {
            msg = actionComponent.deleteData(key);
        } catch (CIPServiceException e) {
            log.error(e.getMessage(), e);
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (CIPDaoException e) {
            log.error(e.getMessage(), e);
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (CIPRuntimeException e) {
            log.error(e.getMessage(), e);
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            msg = new CIPResponseMsg();
            msg.errorCode = 9999;
            msg.msg = "未知错误,请联系管理员!";
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
    @RequestMapping(value="/exportData")
    public void exportData( HttpServletRequest request,  HttpServletResponse response){

        CIPResponseMsg msg = null;
        try {
            actionComponent.exportData(request,response);
            return;
        } catch (CIPServiceException e) {
            log.error(e.getMessage(), e);
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (CIPDaoException e) {
            log.error(e.getMessage(), e);
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (CIPRuntimeException e) {
            log.error(e.getMessage(), e);
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            msg = new CIPResponseMsg();
            msg.errorCode = 9999;
            msg.msg = "未知错误,请联系管理员!";
        }

		try {
			response.setHeader("Content-type", "text/html;charset=UTF-8");
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(JSONUtils.convertObject2Json(msg));
			response.getWriter().flush();
		} catch (Exception e) {
           log.error(e.getMessage(), e);
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
    @RequestMapping(value="/getData")
    public CIPResponseMsg getData(@RequestBody BMS_statement_repayment_logKey key){

        CIPResponseMsg msg = null;
        try {
            msg = actionComponent.getData(key);
        } catch (CIPServiceException e) {
            log.error(e.getMessage(), e);
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (CIPDaoException e) {
            log.error(e.getMessage(), e);
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (CIPRuntimeException e) {
            log.error(e.getMessage(), e);
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            msg = new CIPResponseMsg();
            msg.errorCode = 9999;
            msg.msg = "未知错误,请联系管理员!";
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
    @RequestMapping(value="/importData")
    public CIPResponseMsg importData( HttpServletRequest request,  HttpServletResponse response){

        CIPResponseMsg msg = null;
        try {
            msg = actionComponent.importData(request,response);
        } catch (CIPServiceException e) {
            log.error(e.getMessage(), e);
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (CIPDaoException e) {
            log.error(e.getMessage(), e);
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (CIPRuntimeException e) {
            log.error(e.getMessage(), e);
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            msg = new CIPResponseMsg();
            msg.errorCode = 9999;
            msg.msg = "未知错误,请联系管理员!";
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
    @RequestMapping(value="/searchData")
    public CIPResponseQueryMsg searchData( CIPReqParameter parameter){

        CIPResponseQueryMsg msg = null;
        try {
            msg = actionComponent.searchData(parameter);
        } catch (CIPServiceException e) {
            log.error(e.getMessage(), e);
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseQueryMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (CIPDaoException e) {
            log.error(e.getMessage(), e);
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseQueryMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (CIPRuntimeException e) {
            log.error(e.getMessage(), e);
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseQueryMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            msg = new CIPResponseQueryMsg();
            msg.errorCode = 9999;
            msg.msg = "未知错误,请联系管理员!";
        }

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
    @RequestMapping(value="/updateData")
    public CIPResponseMsg updateData( HttpServletRequest request){

        CIPResponseMsg msg = null;
        try {
            msg = actionComponent.updateData(request);
        } catch (CIPServiceException e) {
            log.error(e.getMessage(), e);
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (CIPDaoException e) {
            log.error(e.getMessage(), e);
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (CIPRuntimeException e) {
            log.error(e.getMessage(), e);
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            msg = new CIPResponseMsg();
            msg.errorCode = 9999;
            msg.msg = "未知错误,请联系管理员!";
        }

        return msg;

    }

}

