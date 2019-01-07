package com.yd.bms.navigation.controller.impl;

import com.yd.bms.navigation.controller.BMS_navigation_pageController;
import com.yd.common.data.CIPResponseMsg;
import com.yd.common.exception.CIPDaoException;
import com.yd.common.exception.CIPRuntimeException;
import com.yd.common.exception.CIPServiceException;
import com.yd.common.runtime.CIPErrorCode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController(value = "BMS_navigation_pageController")
@RequestMapping(value = "/actions/bms_navigation_page")
public class BMS_navigation_pageControllerImpl implements BMS_navigation_pageController {
    protected Logger log = LoggerFactory.getLogger(getClass());


    // 本地控制实现
    @Autowired
    private BMS_navigation_pageController actionComponent;


    /******************************************************************
     * 方法：getRouteTypeData - 获取路由类型
     *
     *
     * 方法描述:
     *     根据用户,获取路由类型
     ******************************************************************/
    @RequestMapping(value = "/getRouteTypeData")
    @Override
    public CIPResponseMsg getRouteTypeData() {
        CIPResponseMsg msg = null;
        try {
            msg = actionComponent.getRouteTypeData();
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

