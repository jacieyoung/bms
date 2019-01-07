package com.yd.bms.navigation.controller.local;

import com.yd.bms.navigation.controller.BMS_navigation_pageController;
import com.yd.bms.navigation.service.BMS_navigation_pageService;
import com.yd.common.data.CIPResponseMsg;
import com.yd.common.runtime.CIPErrorCode;
import com.yd.common.runtime.CIPRuntime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class LBMS_navigation_pageControllerImpl implements
        BMS_navigation_pageController {

    //
    @Autowired
    protected BMS_navigation_pageService dataService;


    /******************************************************************
     * 方法：
     *
     * 变量：vo -
     *
     * 方法描述:
     ******************************************************************/
    @Override
    public CIPResponseMsg getRouteTypeData() {

        CIPResponseMsg msg = new CIPResponseMsg();
        boolean xAuth = true;
        // CIPAuthLock lock = CIPRuntime.authManager.getAuthLock("authObject");
        // lock.setAuthValue("authAtribute", String.valueOf(vo.getAttribute()));
        // xAuth = CIPRuntime.authManager.checkBehavior(C_ACTION_ADD_DATA,
        // lock);
        if (xAuth) {
            msg.data = dataService.getRouteTypeData(CIPRuntime.getOperateSubject());
            msg.errorCode = CIPErrorCode.CALL_SUCCESS.code;
            msg.msg = CIPErrorCode.CALL_SUCCESS.name;
        } else {
            msg.errorCode = CIPErrorCode.ERROR_INVALID_AUTHORIZATION.code;
            msg.msg = CIPErrorCode.ERROR_INVALID_AUTHORIZATION.name;
        }
        return msg;

    }


}
