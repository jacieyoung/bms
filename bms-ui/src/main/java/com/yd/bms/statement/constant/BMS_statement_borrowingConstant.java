package com.yd.bms.statement.constant;

import java.util.LinkedHashMap;
import java.util.Map;

/************************************************************
* 
* 对象：bms_statement_borrowing 借支管理报表
* 所有常量信息定义。
* 
************************************************************/

public class BMS_statement_borrowingConstant {

    //流程编号
    public static final String  C_FIELD_LCBH = "lcbh";
    //申请日期
    public static final String  C_FIELD_SQRQ = "sqrq";
    //申请人
    public static final String  C_FIELD_SQR = "sqr";
    public static final String  C_FIELD_SQR_NAME = "sqr_name";
    //申请人工号
    public static final String  C_FIELD_SQRGH = "sqrgh";
    //申请人职位
    public static final String  C_FIELD_SQRZW = "sqrzw";
    //申请部门
    public static final String  C_FIELD_SQBM = "sqbm";
    //借支类型
    public static final String  C_FIELD_JZLX = "jzlx";
    //具体类型
    public static final String  C_FIELD_JTLX = "jtlx";
    //付款方式
    public static final String  C_FIELD_FKFS = "fkfs";
    //开户行名称
    public static final String  C_FIELD_KHHMC = "khhmc";
    //银行账号
    public static final String  C_FIELD_YHZH = "yhzh";
    //收款人全称
    public static final String  C_FIELD_SKRQC = "skrqc";
    //借支金额
    public static final String  C_FIELD_JZJE = "jzje";
    //还款金额
    public static final String  C_FIELD_HKJE = "hkje";
    //剩余金额
    public static final String  C_FIELD_SYJE = "syje";
    //出纳审批日期
    public static final String  C_FIELD_CNSPRQ = "cnsprq";
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
		titleMap.put("lcbh", "流程编号");
		titleMap.put("sqrq", "申请日期");
		titleMap.put("sqr", "申请人");
		titleMap.put("sqrgh", "申请人工号");
		titleMap.put("sqrzw", "申请人职位");
		titleMap.put("sqbm", "申请部门");
		titleMap.put("jzlx", "借支类型");
		titleMap.put("jtlx", "具体类型");
		titleMap.put("fkfs", "付款方式");
		titleMap.put("khhmc", "开户行名称");
		titleMap.put("yhzh", "银行账号");
		titleMap.put("skrqc", "收款人全称");
		titleMap.put("jzje", "借支金额");
		titleMap.put("hkje", "还款金额");
		titleMap.put("syje", "剩余金额");
		titleMap.put("cnsprq", "出纳审批日期");
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
		fieldMap.put("流程编号", "lcbh");
		fieldMap.put("申请日期", "sqrq");
		fieldMap.put("申请人", "sqr");
		fieldMap.put("申请人工号", "sqrgh");
		fieldMap.put("申请人职位", "sqrzw");
		fieldMap.put("申请部门", "sqbm");
		fieldMap.put("借支类型", "jzlx");
		fieldMap.put("具体类型", "jtlx");
		fieldMap.put("付款方式", "fkfs");
		fieldMap.put("开户行名称", "khhmc");
		fieldMap.put("银行账号", "yhzh");
		fieldMap.put("收款人全称", "skrqc");
		fieldMap.put("借支金额", "jzje");
		fieldMap.put("还款金额", "hkje");
		fieldMap.put("剩余金额", "syje");
		fieldMap.put("出纳审批日期", "cnsprq");
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
