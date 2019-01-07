package com.yd.bms.org.controller;

import com.yd.bms.org.pojo.key.BMS_org_relationKey;
import com.yd.bms.org.pojo.vo.BMS_org_relation_addVO;
import com.yd.common.data.CIPReqParameter;
import com.yd.common.data.CIPResponseMsg;
import com.yd.common.data.CIPResponseQueryMsg;
import org.springframework.web.bind.annotation.RequestBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface BMS_org_relationController {


    /******************************************************************
     * 方法：addData - 新增
     *
     * 变量：vo - 新增VO
     *
     * 方法描述:
     *     新增记录机构关系-bms_org_relation
     ******************************************************************/
    public static final String C_ACTION_ADDDATA = "bms_org_relation_addData";

    public CIPResponseMsg addData(@RequestBody BMS_org_relation_addVO vo);

    /******************************************************************
     * 方法：deleteData - 删除
     *
     * 变量：key - 删除key
     *
     * 方法描述:
     *     删除记录机构关系-bms_org_relation
     ******************************************************************/
    public static final String C_ACTION_DELETEDATA = "bms_org_relation_deleteData";

    public CIPResponseMsg deleteData(@RequestBody BMS_org_relationKey key);

    /******************************************************************
     * 方法：exportData - 导出
     *
     * 变量：request - Http请求
     * 变量：response - Http响应
     *
     * 方法描述:
     *     导出记录机构关系-bms_org_relation
     ******************************************************************/
    public static final String C_ACTION_EXPORTDATA = "bms_org_relation_exportData";

    public void exportData(HttpServletRequest request, HttpServletResponse response);

    /******************************************************************
     * 方法：getData - 查看
     *
     * 变量：key - 查看Key
     *
     * 方法描述:
     *     查看记录机构关系-bms_org_relation
     ******************************************************************/
    public static final String C_ACTION_GETDATA = "bms_org_relation_getData";

    public CIPResponseMsg getData(@RequestBody BMS_org_relationKey key);

    /******************************************************************
     * 方法：importData - 导入
     *
     * 变量：request - Http请求
     * 变量：response - Http响应
     *
     * 方法描述:
     *     导入记录机构关系-bms_org_relation
     ******************************************************************/
    public static final String C_ACTION_IMPORTDATA = "bms_org_relation_importData";

    public CIPResponseMsg importData(HttpServletRequest request, HttpServletResponse response);

    /******************************************************************
     * 方法：searchData - 查询
     *
     * 变量：parameter - 检索参数
     *
     * 方法描述:
     *     查询记录机构关系-bms_org_relation
     ******************************************************************/
    public static final String C_ACTION_SEARCHDATA = "bms_org_relation_searchData";

    public CIPResponseQueryMsg searchData(CIPReqParameter parameter);

    /******************************************************************
     * 方法：updateData - 修改
     *
     * 变量：request - 修改VO
     *
     * 方法描述:
     *     修改记录机构关系-bms_org_relation
     ******************************************************************/
    public static final String C_ACTION_UPDATEDATA = "bms_org_relation_updateData";

    public CIPResponseMsg updateData(HttpServletRequest request);

}

