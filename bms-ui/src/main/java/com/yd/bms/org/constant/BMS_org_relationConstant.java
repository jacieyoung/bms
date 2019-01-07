package com.yd.bms.org.constant;

import java.util.LinkedHashMap;
import java.util.Map;

/************************************************************
 *
 * 对象：bms_org_relation 机构关系
 * 所有常量信息定义。
 *
 ************************************************************/

public class BMS_org_relationConstant {

    //上级机构id
    public static final String C_FIELD_SUP_ORG_ID = "sup_org_id";
    //机构id
    public static final String C_FIELD_ORG_ID = "org_id";
    //根机构id
    public static final String C_FIELD_ROOT_ORG_ID = "root_org_id";
    //机构层级数
    public static final String C_FIELD_ORG_LEVEL = "org_level";
    //层级顺序数
    public static final String C_FIELD_LEVEL_ORDER = "level_order";
    //机构层级链
    public static final String C_FIELD_ORG_REL_LINK = "org_rel_link";
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
        titleMap.put("sup_org_id", "上级机构id");
        titleMap.put("org_id", "机构id");
        titleMap.put("root_org_id", "根机构id");
        titleMap.put("org_level", "机构层级数");
        titleMap.put("level_order", "层级顺序数");
        titleMap.put("org_rel_link", "机构层级链");
        titleMap.put("remark", "备注");
        return titleMap;
    }

    public static Map<String, String> getTitle2Field() {
        if (fieldMap == null)
            fieldMap = new LinkedHashMap<String, String>();
        else
            return fieldMap;
        fieldMap.put("上级机构id", "sup_org_id");
        fieldMap.put("机构id", "org_id");
        fieldMap.put("根机构id", "root_org_id");
        fieldMap.put("机构层级数", "org_level");
        fieldMap.put("层级顺序数", "level_order");
        fieldMap.put("机构层级链", "org_rel_link");
        fieldMap.put("备注", "remark");
        fieldMap.put("操作人", "op_user_id");
        fieldMap.put("操作时间", "update_time");
        fieldMap.put("创建人", "creator");
        fieldMap.put("创建时间", "create_time");
        return fieldMap;
    }
}
