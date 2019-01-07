package com.yd.bms.navigation.service.local;

import com.yd.bms.navigation.service.impl.BMS_navigation_pageServiceImpl;
import com.yd.common.runtime.CIPRuntimeOperator;
import com.yd.common.utils.StringUtils;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service(value = "BMS_navigation_pageServiceImpl")
public class LBMS_navigation_pageServiceImpl extends BMS_navigation_pageServiceImpl {


    /******************************************************************
     * 方法：getRouteTypeData - 获取路由信息
     *
     * 变量：user - 用户信息
     *
     * 方法描述:  获取路由信息
     ******************************************************************/
    @Override
    public Map<String, Object> getRouteTypeData(CIPRuntimeOperator user) {
        Map<String, Object> result = new HashMap<>();
        //todo lly
        String orgId = user.getSubject_org();
        String orgName = user.getSubject_org_name();
        if (StringUtils.isEmpty(orgName)) {
            orgName = "未知机构名称";
        }
        String orgIdName = orgName + "(" + orgId + ")";
        result.put("org_id", orgId);
        result.put("org_name", orgName);
        result.put("org_id_name", orgIdName);

        return result;

    }


}
