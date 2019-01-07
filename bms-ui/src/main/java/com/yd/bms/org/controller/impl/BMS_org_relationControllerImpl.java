package com.yd.bms.org.controller.impl;

import com.yd.bms.org.controller.BMS_org_relationController;
import com.yd.bms.org.pojo.key.BMS_org_relationKey;
import com.yd.bms.org.pojo.vo.BMS_org_relation_addVO;
import com.yd.common.data.CIPReqParameter;
import com.yd.common.data.CIPResponseMsg;
import com.yd.common.data.CIPResponseQueryMsg;
import com.yd.common.exception.CIPDaoException;
import com.yd.common.exception.CIPRuntimeException;
import com.yd.common.exception.CIPServiceException;
import com.yd.common.runtime.CIPErrorCode;
import com.yd.common.utils.JSONUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RestController(value = "BMS_org_relationController")
@RequestMapping(value = "/actions/bms_org_relation")
public class BMS_org_relationControllerImpl implements BMS_org_relationController {
    protected Logger log = LoggerFactory.getLogger(getClass());


    // 本地控制实现
    @Autowired
    private BMS_org_relationController actionComponent;


    /******************************************************************
     * 方法：addData - 新增
     *
     * 变量：vo - 新增VO
     *
     * 方法描述:
     *     新增记录机构关系-bms_org_relation
     ******************************************************************/
    @RequestMapping(value = "/addData")
    public CIPResponseMsg addData(@RequestBody BMS_org_relation_addVO vo) {

        CIPResponseMsg msg = null;
        try {
            msg = actionComponent.addData(vo);
        } catch (CIPServiceException e) {
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (CIPDaoException e) {
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (CIPRuntimeException e) {
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        }

        return msg;

    }

    /******************************************************************
     * 方法：deleteData - 删除
     *
     * 变量：key - 删除key
     *
     * 方法描述:
     *     删除记录机构关系-bms_org_relation
     ******************************************************************/
    @RequestMapping(value = "/deleteData")
    public CIPResponseMsg deleteData(@RequestBody BMS_org_relationKey key) {

        CIPResponseMsg msg = null;
        try {
            msg = actionComponent.deleteData(key);
        } catch (CIPServiceException e) {
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (CIPDaoException e) {
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (CIPRuntimeException e) {
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
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
     *     导出记录机构关系-bms_org_relation
     ******************************************************************/
    @RequestMapping(value = "/exportData")
    public void exportData(HttpServletRequest request, HttpServletResponse response) {

        CIPResponseMsg msg = null;
        try {
            actionComponent.exportData(request, response);
            return;
        } catch (CIPServiceException e) {
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (CIPDaoException e) {
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (CIPRuntimeException e) {
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        }

        try {
            response.setHeader("Content-type", "text/html;charset=UTF-8");
            response.setCharacterEncoding("utf-8");
            response.getWriter().write(JSONUtils.convertObject2Json(msg));
            response.getWriter().flush();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /******************************************************************
     * 方法：getData - 查看
     *
     * 变量：key - 查看Key
     *
     * 方法描述:
     *     查看记录机构关系-bms_org_relation
     ******************************************************************/
    @RequestMapping(value = "/getData")
    public CIPResponseMsg getData(@RequestBody BMS_org_relationKey key) {

        CIPResponseMsg msg = null;
        try {
            msg = actionComponent.getData(key);
        } catch (CIPServiceException e) {
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (CIPDaoException e) {
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (CIPRuntimeException e) {
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
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
     *     导入记录机构关系-bms_org_relation
     ******************************************************************/
    @RequestMapping(value = "/importData")
    public CIPResponseMsg importData(HttpServletRequest request, HttpServletResponse response) {

        CIPResponseMsg msg = null;
        try {
            msg = actionComponent.importData(request, response);
        } catch (CIPServiceException e) {
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (CIPDaoException e) {
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (CIPRuntimeException e) {
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        }

        return msg;

    }

    /******************************************************************
     * 方法：searchData - 查询
     *
     * 变量：parameter - 检索参数
     *
     * 方法描述:
     *     查询记录机构关系-bms_org_relation
     ******************************************************************/
    @RequestMapping(value = "/searchData")
    public CIPResponseQueryMsg searchData(CIPReqParameter parameter) {

        CIPResponseQueryMsg msg = null;
        try {
            msg = actionComponent.searchData(parameter);
        } catch (CIPServiceException e) {
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseQueryMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (CIPDaoException e) {
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseQueryMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (CIPRuntimeException e) {
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseQueryMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        }

        return msg;

    }

    /******************************************************************
     * 方法：updateData - 修改
     *
     * 变量：request - 修改VO
     *
     * 方法描述:
     *     修改记录机构关系-bms_org_relation
     ******************************************************************/
    @RequestMapping(value = "/updateData")
    public CIPResponseMsg updateData(HttpServletRequest request) {

        CIPResponseMsg msg = null;
        try {
            msg = actionComponent.updateData(request);
        } catch (CIPServiceException e) {
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (CIPDaoException e) {
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        } catch (CIPRuntimeException e) {
            CIPErrorCode error = e.getErrorCode();
            msg = new CIPResponseMsg();
            msg.errorCode = error.code;
            msg.msg = error.name;
        }

        return msg;

    }

}

