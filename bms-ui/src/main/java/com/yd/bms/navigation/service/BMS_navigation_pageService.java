package com.yd.bms.navigation.service;

import com.yd.common.runtime.CIPRuntimeOperator;

import java.util.Map;

public interface BMS_navigation_pageService {


    /******************************************************************
     * 方法：getData - 查看
     *
     * 变量：key - 查看key
     * 变量：user - 用户信息
     *
     * 方法描述:
     *     查看记录运输合同信息-bms_trans_contract
     ******************************************************************/
    public Map<String, Object> getRouteTypeData(CIPRuntimeOperator user);


}

