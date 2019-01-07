package com.yd.bms.statement.constant;

import java.util.LinkedHashMap;
import java.util.Map;

/************************************************************
* 
* 对象：bms_statement_repayment_log 还款日志
* 所有常量信息定义。
* 
************************************************************/

public class BMS_statement_repayment_logConstant {

    //流水号
    public static final String  C_FIELD_SERIAL_NO = "serial_no";
    //流程编号
    public static final String  C_FIELD_LCBH = "lcbh";
    //还款日期
    public static final String  C_FIELD_HKRQ = "hkrq";
    //还款方式
    public static final String  C_FIELD_HKFS = "hkfs";
    //核销金额
    public static final String  C_FIELD_HXJE = "hxje";
    //剩余金额
    public static final String  C_FIELD_SYJE = "syje";
    //核销人
    public static final String  C_FIELD_HXR = "hxr";
    //冲借支工作流
    public static final String  C_FIELD_CJZGZL = "cjzgzl";
    //删除标志
    public static final String  C_FIELD_DELETE_FLAG = "delete_flag";
    //备注
    public static final String  C_FIELD_REMARK = "remark";
    //操作人id
    public static final String  C_FIELD_OP_USER_ID = "op_user_id";
    //操作人
    public static final String  C_FIELD_OP_USER_NAME = "op_user_name";
    //操作时间
    public static final String  C_FIELD_UPDATE_TIME = "update_time";
    //创建人id
    public static final String  C_FIELD_CREATOR = "creator";
    //创建人
    public static final String  C_FIELD_CREATOR_NAME = "creator_name";
    //创建时间
    public static final String  C_FIELD_CREATE_TIME = "create_time";


	private static Map<String, String> titleMap = getExcelTitle();
	private static Map<String, String> fieldMap = getTitle2Field();

	public static Map<String, String> getExcelTitle() {
		if (titleMap == null)
			titleMap = new LinkedHashMap<String, String>();
		else
			return titleMap;
		titleMap.put("serial_no", "流水号");
		titleMap.put("lcbh", "流程编号");
		titleMap.put("hkrq", "还款日期");
		titleMap.put("hkfs", "还款方式");
		titleMap.put("hxje", "核销金额");
		titleMap.put("syje", "剩余金额");
		titleMap.put("hxr", "核销人");
		titleMap.put("cjzgzl", "冲借支工作流");
		titleMap.put("delete_flag", "删除标志");
		titleMap.put("remark", "备注");
		titleMap.put("op_user_name", "操作人");
		titleMap.put("creator_name", "创建人");
		return titleMap;
	}

	public static Map<String, String> getTitle2Field() {
		if (fieldMap == null)
			fieldMap = new LinkedHashMap<String, String>();
		else
			return fieldMap;
		fieldMap.put("流水号", "serial_no");
		fieldMap.put("流程编号", "lcbh");
		fieldMap.put("还款日期", "hkrq");
		fieldMap.put("还款方式", "hkfs");
		fieldMap.put("核销金额", "hxje");
		fieldMap.put("剩余金额", "syje");
		fieldMap.put("核销人", "hxr");
		fieldMap.put("冲借支工作流", "cjzgzl");
		fieldMap.put("删除标志", "delete_flag");
		fieldMap.put("备注", "remark");
		fieldMap.put("操作人id", "op_user_id");
		fieldMap.put("操作人", "op_user_name");
		fieldMap.put("操作时间", "update_time");
		fieldMap.put("创建人id", "creator");
		fieldMap.put("创建人", "creator_name");
		fieldMap.put("创建时间", "create_time");
		return fieldMap;
	}
}
