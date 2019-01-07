package com.yd.bms.navigation.controller;

import com.yd.common.data.CIPResponseMsg;

public interface BMS_navigation_pageController {


    /******************************************************************
     * 方法：
     *
     * 变量：
     *
     * 方法描述:
     *
     ******************************************************************/
    public static final String C_ACTION_GETROUTETYPEDATA = "bms_navigation_getRouteTypeData";

    public CIPResponseMsg getRouteTypeData();

}

