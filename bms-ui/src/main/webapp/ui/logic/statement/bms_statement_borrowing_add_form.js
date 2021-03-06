//-------------------- 代码可变区
//-------------------- 代码可变区
var formTemplate = '#form_bms_statement_borrowing';
var fields = 
				[
				{field:'lcbh',name:'流程编号',ctrlType:'easyui-validatebox',ddicTable:'',domainId:'',display:'Y',mustFlag:'Y',minLen:0,maxLen:32,precise:0,readOnly:'N',defaultValue:''},
				{field:'sqrq',name:'申请日期',ctrlType:'easyui-datebox',ddicTable:'',domainId:'',display:'Y',mustFlag:'N',minLen:0,maxLen:0,precise:0,readOnly:'N',defaultValue:''},
				{field:'sqr',name:'申请人',ctrlType:'easyui-validatebox',ddicTable:'',domainId:'',display:'Y',mustFlag:'N',minLen:0,maxLen:20,precise:0,readOnly:'N',defaultValue:''},
				{field:'sqrgh',name:'申请人工号',ctrlType:'easyui-validatebox',ddicTable:'',domainId:'',display:'Y',mustFlag:'N',minLen:0,maxLen:20,precise:0,readOnly:'N',defaultValue:''},
				{field:'sqrzw',name:'申请人职位',ctrlType:'easyui-validatebox',ddicTable:'',domainId:'',display:'Y',mustFlag:'N',minLen:0,maxLen:20,precise:0,readOnly:'N',defaultValue:''},
				{field:'sqbm',name:'申请部门',ctrlType:'easyui-validatebox',ddicTable:'',domainId:'',display:'Y',mustFlag:'N',minLen:0,maxLen:20,precise:0,readOnly:'N',defaultValue:''},
				{field:'jzlx',name:'借支类型',ctrlType:'easyui-combobox',ddicTable:'cip_admin_codes',domainId:'jzlx',display:'Y',mustFlag:'N',minLen:0,maxLen:20,precise:0,readOnly:'N',defaultValue:''},
				{field:'jtlx',name:'具体类型',ctrlType:'easyui-combobox',ddicTable:'',domainId:'',display:'Y',mustFlag:'N',minLen:0,maxLen:20,precise:0,readOnly:'N',defaultValue:''},
				{field:'fkfs',name:'付款方式',ctrlType:'easyui-combobox',ddicTable:'cip_admin_codes',domainId:'fkfs',display:'Y',mustFlag:'N',minLen:0,maxLen:20,precise:0,readOnly:'N',defaultValue:'银行卡'},
				{field:'khhmc',name:'开户行名称',ctrlType:'easyui-validatebox',ddicTable:'',domainId:'',display:'Y',mustFlag:'N',minLen:0,maxLen:255,precise:0,readOnly:'N',defaultValue:''},
				{field:'yhzh',name:'银行账号',ctrlType:'easyui-validatebox',ddicTable:'',domainId:'',display:'Y',mustFlag:'N',minLen:0,maxLen:255,precise:0,readOnly:'N',defaultValue:''},
				{field:'skrqc',name:'收款人全称',ctrlType:'easyui-validatebox',ddicTable:'',domainId:'',display:'Y',mustFlag:'N',minLen:0,maxLen:20,precise:0,readOnly:'N',defaultValue:''},
				{field:'jzje',name:'借支金额',ctrlType:'easyui-numberbox',ddicTable:'',domainId:'',display:'Y',mustFlag:'N',minLen:0,maxLen:0,precise:0,readOnly:'N',defaultValue:0},
				{field:'hkje',name:'还款金额',ctrlType:'easyui-numberbox',ddicTable:'',domainId:'',display:'Y',mustFlag:'N',minLen:0,maxLen:0,precise:0,readOnly:'N',defaultValue:0},
				{field:'syje',name:'剩余金额',ctrlType:'easyui-numberbox',ddicTable:'',domainId:'',display:'Y',mustFlag:'N',minLen:0,maxLen:0,precise:0,readOnly:'N',defaultValue:0},
				{field:'cnsprq',name:'出纳审批日期',ctrlType:'easyui-datebox',ddicTable:'',domainId:'',display:'Y',mustFlag:'N',minLen:0,maxLen:0,precise:0,readOnly:'N',defaultValue:''},
				{field:'delete_flag',name:'删除标志',ctrlType:'easyui-combobox',ddicTable:'',domainId:'',display:'Y',mustFlag:'N',minLen:0,maxLen:1,precise:0,readOnly:'N',defaultValue:''},
				{field:'remark',name:'备注',ctrlType:'easyui-validatebox',ddicTable:'',domainId:'',display:'Y',mustFlag:'N',minLen:0,maxLen:255,precise:0,readOnly:'N',defaultValue:''},
				{field:'op_user_name',name:'操作人',ctrlType:'easyui-validatebox',ddicTable:'',domainId:'',display:'Y',mustFlag:'N',minLen:0,maxLen:20,precise:0,readOnly:'N',defaultValue:''},
				{field:'creator',name:'创建人id',ctrlType:'easyui-validatebox',ddicTable:'',domainId:'',display:'Y',mustFlag:'N',minLen:0,maxLen:20,precise:0,readOnly:'N',defaultValue:''},
				{field:'creator_name',name:'创建人',ctrlType:'easyui-validatebox',ddicTable:'',domainId:'',display:'Y',mustFlag:'N',minLen:0,maxLen:20,precise:0,readOnly:'N',defaultValue:''},
				];



//初始化控件信息

//--------------------- 代码不变区 
var callUrl;
var tableId;
var pageId;
function init(){
	var urlParam = $$.getParameters();
	var techParam = urlParam.technical; 
	pageId=techParam.srcPageId;
	tableId=techParam.srcTableId;
	callUrl = techParam.refActionUrl + '?actionId=' + techParam.refActionId; 
	
	initControlSetting(fields);
	
	//保存按钮单击事件
	$('#btn_save').bind('click', function() {
		submitData();	
	});
	//取消按钮单击事件
	$('#btn_cancel').bind('click', function(){
		$$.closeJcdfDialog();
	});
};

function transform2Backend(data){
	var column;
	var backendData = {};
	for(var i = 0 ; i<fields.length; i++){
		column = fields[i];
		if(data[column.field]){
			if(column.ctrlType=='easyui-datetimebox' || column.ctrlType=='easyui-datebox'){
				backendData[column.field] = getString2Date(data[column.field]);
			}
			else 
				backendData[column.field] = data[column.field];
		}
	}
	return backendData;
}

//提交数据
function submitData(){
	if (!$(formTemplate).form('validate')) {
		return false;
	}
	var jsonData = $$.serializeToJson(formTemplate);
	if(!jsonData) return false;
	//如果数据验证通过(即数据合法)
	$$.openProcessingDialog();
	var resultData = transform2Backend(jsonData);
	//ajax提交数据
	$.ajax({
		type : 'POST',
		url : callUrl,
		dataType : 'json',
		data : JSON.stringify(resultData),
		contentType: 'application/json',
		success : function(data) {
			$$.closeProcessingDialog();
			if (data && data.errorCode==0) {
				$$.showJcdfMessager('提示消息', '操作成功', 'info');
				$$.closeJcdfDialog();
				$$.refreshJcdfDatagrid(pageId,tableId);
			} else {
				$$.showJcdfMessager('提示消息', data.msg+'('+data.errorCode+')', 'warning');
			}
		}
	});
};
