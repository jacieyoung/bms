package com.yd.bms.org.constant;

import java.util.LinkedHashMap;
import java.util.Map;

/************************************************************
 *
 * 对象：bms_org_profile 机构信息
 * 所有常量信息定义。
 *
 ************************************************************/

public class BMS_org_profileConstant {

    //机构id
    public static final String C_FIELD_ORG_ID = "org_id";
    //机构名称
    public static final String C_FIELD_ORG_NAME = "org_name";
    //机构状态
    public static final String C_FIELD_ORG_STATUS = "org_status";
    //机构负责人
    public static final String C_FIELD_RESP_USER_ID = "resp_user_id";
    //机构类型
    public static final String C_FIELD_ORG_TYPE = "org_type";
    //负责人名称
    public static final String C_FIELD_RESP_NAME = "resp_name";
    //负责人手机
    public static final String C_FIELD_RESP_MOBILE = "resp_mobile";
    //国家编码
    public static final String C_FIELD_COUNTRY_CODE = "country_code";
    //省编码
    public static final String C_FIELD_PROV_CODE = "prov_code";
    //市编码
    public static final String C_FIELD_CITY_CODE = "city_code";
    //区编码
    public static final String C_FIELD_AREA_CODE = "area_code";
    //机构地址
    public static final String C_FIELD_ORG_ADDRESS = "org_address";
    //备注
    public static final String C_FIELD_REMARK = "remark";
    //操作人
    public static final String C_FIELD_OP_USER_ID = "op_user_id";
    //操作时间
    public static final String C_FIELD_UPDATE_TIME = "update_time";
    //创建人
    public static final String C_FIELD_CREATOR = "creator";
    //创建时间
    public static final String C_FIELD_CREATE_TIME = "create_time";


    private static Map<String, String> titleMap = getExcelTitle();
    private static Map<String, String> fieldMap = getTitle2Field();

    public static Map<String, String> getExcelTitle() {
        if (titleMap == null)
            titleMap = new LinkedHashMap<String, String>();
        else
            return titleMap;
        titleMap.put("org_id", "机构id");
        titleMap.put("org_name", "机构名称");
        titleMap.put("org_status", "机构状态");
        titleMap.put("resp_user_id", "机构负责人");
        titleMap.put("org_type", "机构类型");
        titleMap.put("resp_name", "负责人名称");
        titleMap.put("resp_mobile", "负责人手机");
        titleMap.put("country_code", "国家编码");
        titleMap.put("prov_code", "省编码");
        titleMap.put("city_code", "市编码");
        titleMap.put("area_code", "区编码");
        titleMap.put("org_address", "机构地址");
        titleMap.put("remark", "备注");
        return titleMap;
    }

    public static Map<String, String> getTitle2Field() {
        if (fieldMap == null)
            fieldMap = new LinkedHashMap<String, String>();
        else
            return fieldMap;
        fieldMap.put("机构id", "org_id");
        fieldMap.put("机构名称", "org_name");
        fieldMap.put("机构状态", "org_status");
        fieldMap.put("机构负责人", "resp_user_id");
        fieldMap.put("机构类型", "org_type");
        fieldMap.put("负责人名称", "resp_name");
        fieldMap.put("负责人手机", "resp_mobile");
        fieldMap.put("国家编码", "country_code");
        fieldMap.put("省编码", "prov_code");
        fieldMap.put("市编码", "city_code");
        fieldMap.put("区编码", "area_code");
        fieldMap.put("机构地址", "org_address");
        fieldMap.put("备注", "remark");
        fieldMap.put("操作人", "op_user_id");
        fieldMap.put("操作时间", "update_time");
        fieldMap.put("创建人", "creator");
        fieldMap.put("创建时间", "create_time");
        return fieldMap;
    }
}
