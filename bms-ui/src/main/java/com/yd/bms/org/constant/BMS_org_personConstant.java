package com.yd.bms.org.constant;

import java.util.LinkedHashMap;
import java.util.Map;

/************************************************************
 *
 * 对象：bms_org_person 人员信息
 * 所有常量信息定义。
 *
 ************************************************************/

public class BMS_org_personConstant {

    //人员编码
    public static final String C_FIELD_PERSON_ID = "person_id";
    //身份证号
    public static final String C_FIELD_PERSON_CODE = "person_code";
    //人员状态
    public static final String C_FIELD_PERSON_STATUS = "person_status";
    //人员类型
    public static final String C_FIELD_PERSON_TYPE = "person_type";
    //人员名称
    public static final String C_FIELD_PESON_NAME = "peson_name";
    //人员手机
    public static final String C_FIELD_PERSON_MOBILE = "person_mobile";
    //人员微信
    public static final String C_FIELD_PERSON_WX = "person_wx";
    //人员邮件
    public static final String C_FIELD_PERSON_MAIL = "person_mail";
    //常用住址
    public static final String C_FIELD_PERSON_ADDR = "person_addr";
    //入职日期
    public static final String C_FIELD_JOIN_DATE = "join_date";
    //转正日期
    public static final String C_FIELD_ACCEPT_DATE = "accept_date";
    //离职日期
    public static final String C_FIELD_LEAVE_DATE = "leave_date";
    //工种类型
    public static final String C_FIELD_WORK_TYPE = "work_type";
    //用户id
    public static final String C_FIELD_USER_ID = "user_id";
    //归属机构
    public static final String C_FIELD_ORG_ID = "org_id";
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
        titleMap.put("person_id", "人员编码");
        titleMap.put("person_code", "身份证号");
        titleMap.put("person_status", "人员状态");
        titleMap.put("person_type", "人员类型");
        titleMap.put("peson_name", "人员名称");
        titleMap.put("person_mobile", "人员手机");
        titleMap.put("person_wx", "人员微信");
        titleMap.put("person_mail", "人员邮件");
        titleMap.put("person_addr", "常用住址");
        titleMap.put("join_date", "入职日期");
        titleMap.put("accept_date", "转正日期");
        titleMap.put("leave_date", "离职日期");
        titleMap.put("work_type", "工种类型");
        titleMap.put("user_id", "用户id");
        titleMap.put("org_id", "归属机构");
        titleMap.put("remark", "备注");
        return titleMap;
    }

    public static Map<String, String> getTitle2Field() {
        if (fieldMap == null)
            fieldMap = new LinkedHashMap<String, String>();
        else
            return fieldMap;
        fieldMap.put("人员编码", "person_id");
        fieldMap.put("身份证号", "person_code");
        fieldMap.put("人员状态", "person_status");
        fieldMap.put("人员类型", "person_type");
        fieldMap.put("人员名称", "peson_name");
        fieldMap.put("人员手机", "person_mobile");
        fieldMap.put("人员微信", "person_wx");
        fieldMap.put("人员邮件", "person_mail");
        fieldMap.put("常用住址", "person_addr");
        fieldMap.put("入职日期", "join_date");
        fieldMap.put("转正日期", "accept_date");
        fieldMap.put("离职日期", "leave_date");
        fieldMap.put("工种类型", "work_type");
        fieldMap.put("用户id", "user_id");
        fieldMap.put("归属机构", "org_id");
        fieldMap.put("备注", "remark");
        fieldMap.put("操作人", "op_user_id");
        fieldMap.put("操作时间", "update_time");
        fieldMap.put("创建人", "creator");
        fieldMap.put("创建时间", "create_time");
        return fieldMap;
    }
}
