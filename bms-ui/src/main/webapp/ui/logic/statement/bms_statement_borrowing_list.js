//-------------------- 代码可变区
//---------- 数据定义区
var authActions = {}; 
var isDatagridLoaded = false;
var listTemplate = '#bms_statement_borrowing_list';
var formSearchTemplate = '#bms_statement_borrowing_searchForm';
var formSearchTemplate_id = 'bms_statement_borrowing_searchForm';
var gridMenuId = '#bms_statement_borrowing_list_menu';
//当前用户需要特殊处理的按钮，不在menubar上显示的 
var metaData = {
		objectId:'bms_statement_borrowing_list',
		objectName:'借支管理报表',
		objectKeys:['lcbh'],
		objectFields:
				[
				{field:'lcbh',name:'流程编号',ctrlType:'easyui-validatebox',hidden:false},
				{field:'sqrq',name:'申请日期',ctrlType:'easyui-datebox',hidden:false},
				{field:'sqr',name:'申请人',ctrlType:'easyui-validatebox',hidden:true},
				{field:'sqr_name',name:'申请人',ctrlType:'easyui-validatebox',hidden:false},
				{field:'sqrgh',name:'申请人工号',ctrlType:'easyui-validatebox',hidden:false},
				{field:'sqrzw',name:'申请人职位',ctrlType:'easyui-validatebox',hidden:true},
				{field:'sqrzw_name',name:'申请人职位',ctrlType:'easyui-validatebox',hidden:false},
				{field:'sqbm',name:'申请部门',ctrlType:'easyui-validatebox',hidden:true},
				{field:'sqbm_name',name:'申请部门',ctrlType:'easyui-validatebox',hidden:false},
                {field:'jzlx',name:'借支类型',ctrlType:'easyui-combobox',hidden:true},
                {field:'jzlx_name',name:'借支类型',ctrlType:'easyui-validatebox',hidden:false},
				{field:'jtlx',name:'具体类型',ctrlType:'easyui-combobox',hidden:true},
				{field:'jtlx_name',name:'具体类型',ctrlType:'easyui-combobox',hidden:false},
                {field:'fkfs',name:'付款方式',ctrlType:'easyui-combobox',hidden:true},
                {field:'fkfs_name',name:'付款方式',ctrlType:'easyui-validatebox',hidden:false},
				{field:'khhmc',name:'开户行名称',ctrlType:'easyui-validatebox',hidden:false},
				{field:'yhzh',name:'银行账号',ctrlType:'easyui-validatebox',hidden:false},
				{field:'skrqc',name:'收款人全称',ctrlType:'easyui-validatebox',hidden:false},
				{field:'jzje',name:'借支金额',ctrlType:'easyui-numberbox',hidden:false},
				{field:'hkje',name:'还款金额',ctrlType:'easyui-numberbox',hidden:false},
				{field:'syje',name:'剩余金额',ctrlType:'easyui-numberbox',hidden:false},
				{field:'cnsprq',name:'出纳审批日期',ctrlType:'easyui-datebox',hidden:false},
				// {field:'delete_flag',name:'删除标志',ctrlType:'easyui-combobox',hidden:false},
				// {field:'remark',name:'备注',ctrlType:'easyui-validatebox',hidden:false},
				// {field:'op_user_id',name:'操作人id',ctrlType:'easyui-validatebox',hidden:false},
				// {field:'op_user_name',name:'操作人',ctrlType:'easyui-validatebox',hidden:false},
				// {field:'update_time',name:'操作时间',ctrlType:'easyui-datetimebox',hidden:false},
				// {field:'creator',name:'创建人id',ctrlType:'easyui-validatebox',hidden:false},
				// {field:'creator_name',name:'创建人',ctrlType:'easyui-validatebox',hidden:false},
				// {field:'create_time',name:'创建时间',ctrlType:'easyui-datetimebox',hidden:false}
				],
		actionForms:{
			'bms_statement_borrowing_addData':{formId:'bms_statement_borrowing_add_form',formUrl:'ui/view/statement/bms_statement_borrowing_add_form.html?actionId=bms_statement_borrowing_add_form'},
			'bms_statement_borrowing_getData':{formId:'bms_statement_borrowing_query_form',formUrl:'ui/view/statement/bms_statement_borrowing_query_form.html?actionId=bms_statement_borrowing_query_form'},
			'bms_statement_borrowing_updateData':{formId:'bms_statement_borrowing_update_form',formUrl:'ui/view/statement/bms_statement_borrowing_update_form.html?actionId=bms_statement_borrowing_update_form'}
			},
		expellActions:{
			'bms_statement_borrowing_searchData':'',
			'bms_statement_borrowing_exportEntities':''
			}

};
var searchMeta = [
	{field:'lcbh',name:'流程编号',ctrlType:'easyui-validatebox',ddicTable:'',domainId:'',searchFlag:'=',mustFlag:'Y',defaultValue:''},
	{field:'sqr_name',name:'申请人',ctrlType:'easyui-validatebox',ddicTable:'',domainId:'',searchFlag:'=',mustFlag:'Y',defaultValue:''},
	{field:'sqrq',name:'申请日期',ctrlType:'easyui-datebox',ddicTable:'',domainId:'',searchFlag:'>=',mustFlag:'Y',defaultValue:''},
	{field:'sqrq',name:'申请日期',ctrlType:'easyui-datebox',ddicTable:'',domainId:'',searchFlag:'<=',mustFlag:'Y',defaultValue:''},
	{field:'jzje',name:'借支金额',ctrlType:'easyui-numberbox',ddicTable:'',domainId:'',searchFlag:'=',mustFlag:'Y',defaultValue:''},
    {field:'fkfs',name:'付款方式',ctrlType:'easyui-combobox',ddicTable:'cip_admin_codes',domainId:'fkfs',searchFlag:'=',mustFlag:'Y',defaultValue:''},
    {field:'syje',name:'剩余金额',ctrlType:'easyui-numberbox',ddicTable:'',domainId:'',searchFlag:'>=',mustFlag:'Y',defaultValue:''},
    {field:'syje',name:'剩余金额',ctrlType:'easyui-numberbox',ddicTable:'',domainId:'',searchFlag:'<=',mustFlag:'Y',defaultValue:''},
	{field:'cnsprq',name:'出纳审批日期',ctrlType:'easyui-datebox',ddicTable:'',domainId:'',searchFlag:'>=',mustFlag:'Y',defaultValue:''},
	{field:'cnsprq',name:'出纳审批日期',ctrlType:'easyui-datebox',ddicTable:'',domainId:'',searchFlag:'<=',mustFlag:'Y',defaultValue:''},
	{field:'jzlx',name:'借支类型',ctrlType:'easyui-combobox',ddicTable:'cip_admin_codes',domainId:'jzlx',searchFlag:'=',mustFlag:'Y',defaultValue:''},
	{field:'jtlx',name:'具体类型',ctrlType:'easyui-combobox',ddicTable:'cip_admin_codes',domainId:'jtlx',searchFlag:'=',mustFlag:'Y',defaultValue:''},
	{field:'sqbm',name:'申请部门',ctrlType:'easyui-combobox',ddicTable:'',domainId:'',searchFlag:'=',mustFlag:'Y',defaultValue:''}

];
var bda_data_str_field = {
            bms_statement_borrowing_addData : function (buttonId,actionUrl){
				var form = metaData.actionForms[buttonId];							
	    			if(!form){
	    				throw '行为'+buttonId + ',尚未配置要打开的表单信息';
	    			}
				var techParam = {
						appId:appId,
						srcPageId:metaData.objectId,
						srcTableId:metaData.objectId
				};
				techParam.actionId = form.formId;
				techParam.mode = 'add';
				techParam.refActionUrl = actionUrl;
				techParam.refActionId = buttonId;
				
				var callUrl = $$.buildPageUrl(form.formUrl,techParam, null);
		   		$$.openJcdfDialog(callUrl, '新增'+metaData.objectName, 800, 1050);

            },
            bms_statement_borrowing_deleteData : function (buttonId,actionUrl){
				var selectRow = $$.getSingleSelectRow(metaData.objectId, "请选择你要删除的"+metaData.objectName);
		    	if(selectRow){
		    		var title = "确认";
		    		var msg = "确定删除所选的"+metaData.objectName+"?";
		    		
		    		$.messager.confirm(title, msg, function(r){
		    			if (r){
		    				$$.openProcessingDialog();
		    				var business = {};
							var size = metaData.objectKeys.length;
							var key;
							for(var i=0 ; i< size;i++){
								key = metaData.objectKeys[i];
								business[key] = selectRow[key];
							} 
		    				$.ajax({
		    				   type: "POST",
		    				   url: actionUrl+"?actionId="+buttonId,
		    				   dataType:"json",
		    				   data : JSON.stringify(business),
		    				   contentType: "application/json",
		    				   success: function(data){
		    				   	 	$$.closeProcessingDialog();
		    						if (data && data.errorCode == 0) {
		    							$$.showJcdfMessager('提示消息', '操作成功', 'info');
		    							$$.refreshJcdfDatagrid(metaData.objectId,metaData.objectId);
		    						} else {
		    							$$.showJcdfMessager('提示消息', data.msg, 'warning');
		    						}
		    				   }
		    				});
		    			}
		    		});
		    	}

            },
            bms_statement_borrowing_exportData : function (buttonId,actionUrl){
            	$.messager.confirm("确认","确定导出"+metaData.objectName+"?",function(r){
            		if(r){
            			var params = $$.serializeToJson(formSearchTemplate);
        				var conditions = [];
        				var search;
        				for(var i=0; i<searchMeta.length;i++){//封装请求参数
        					var condition = {};
        					search = searchMeta[i];
        					if(search.searchFlag=='='){
        						condition.fieldName=search.field;
        						condition.operator=0;
        						condition.lowValue=params[search.field];
        						if(!params[search.field])
        							continue;
        					}else if(search.searchFlag=='BW'){
        						condition.fieldName=search.field;
        						condition.operator=6;
        						condition.lowValue=params[search.field+'_f'];
        						condition.highValue=params[search.field+'_t'];
        						if(condition.highValue==''){
        							condition.operator=0;
        						}
        						if(!condition.lowValue)
        							continue;
        					}
                            else if(search.searchFlag=='>='){
                                condition.fieldName=search.field;
                                condition.operator=3;
                                condition.lowValue=params[search.field+'_f'];
                                if(!condition.lowValue)
                                    continue;
                            }
                            else if(search.searchFlag=='<='){
                                condition.fieldName=search.field;
                                condition.operator=4;
                                condition.HighValue=params[search.field+'_t'];
                                if(!condition.HighValue)
                                    continue;
                            }
        					conditions.push(condition);
        				}
        				
        				$(formSearchTemplate).form('submit',{    
        				    url:actionUrl+"?actionId="+buttonId,    
        				    onSubmit: function(param){
        				    	param.search_condition = JSON.stringify(conditions)
        				    },
        				    success: function(data){   
        				    	var oData = JSON.parse(data);
        				        if (oData&&oData.errorCode){   
        				        	$$.showJcdfMessager('提示消息', oData.msg, 'warning');   
        				        }    
        				    } 
        				}); 
        				
            		}
            	});

            },
            bms_statement_borrowing_getData : function (buttonId,actionUrl){
				var selectRow = $$.getSingleSelectRow(metaData.objectId, "请选择你要查看的"+metaData.objectName);

		    		if(selectRow){
					var form = metaData.actionForms[buttonId];							
		    			if(!form){
		    				throw '行为'+buttonId + ',尚未配置要打开的表单信息';
		    			}
		    		
					//build business parameters
					var business = {};
					var size = metaData.objectKeys.length;
					var key;
					for(var i=0 ; i< size;i++){
						key = metaData.objectKeys[i];
						business[key] = selectRow[key];
					} 
					
					//build technical parameters 
					var techParam = {
						appId:appId,
						srcPageId:metaData.objectId,
						srcTableId:metaData.objectId
					};
					techParam.actionId = form.formId;
					techParam.mode = 'display';
					techParam.refActionUrl = actionUrl;
					techParam.refActionId = buttonId;
					
					var callUrl = $$.buildPageUrl(form.formUrl,techParam,business);
	   				$$.openJcdfDialog(callUrl, '查看'+metaData.objectName, 800, 1050);
		    		}

            },
            bms_statement_borrowing_importData : function (buttonId,actionUrl){
            	var form = {};							
            	form.formId = "cip_import_form";
            	form.formUrl = "ui/view/public/cip_import_form.html?actionId=cip_import_form";
            	
    			var techParam = {
						appId:appId,
						srcPageId:metaData.objectId,
						srcTableId:metaData.objectId
					};
				techParam.actionId = form.formId;
				techParam.templateName = metaData.objectId + '.xlsx';//需要优化
				techParam.objectName = metaData.objectName;
				techParam.refActionUrl = actionUrl;
				techParam.refActionId = buttonId;
    			var callUrl = $$.buildPageUrl(form.formUrl,techParam,null);
   				$$.openJcdfDialog(callUrl, '导入'+metaData.objectName, 250, 600);

            },
            bms_statement_borrowing_searchData : function (buttonId,actionUrl){
				var params = $$.serializeToJson(formSearchTemplate);
				var conditions = [];
				var search;
				for(var i=0; i<searchMeta.length;i++){
					var condition = {};
					search = searchMeta[i];
					if(search.searchFlag=='='){
						condition.fieldName=search.field;
						condition.operator=0;
						condition.lowValue=params[search.field];
						if(!params[search.field])
							continue;
					}
					else if(search.searchFlag=='BW'){
						condition.fieldName=search.field;
						condition.operator=6;
						condition.lowValue=params[search.field+'_f'];
						condition.highValue=params[search.field+'_t'];
						if(condition.highValue==''){
							condition.operator=0;
						}
						if(!condition.lowValue)
							continue;
					}
					else if(search.searchFlag=='>='){
                        condition.fieldName=search.field;
                        condition.operator=3;
                        condition.lowValue=params[search.field+'_f'];
                        if(!condition.lowValue)
                            continue;
                    }
                    else if(search.searchFlag=='<='){
                        condition.fieldName=search.field;
                        condition.operator=4;
                        condition.HighValue=params[search.field+'_t'];
                        if(!condition.HighValue)
                            continue;
                    }
					conditions.push(condition);
				}
				
				var json = {"search_condition" : JSON.stringify(conditions) };
				
				if(isDatagridLoaded){
					$(listTemplate).datagrid('load', json );
				}else{
					$(listTemplate).datagrid({
						queryParams: json,
						url : actionUrl+"?actionId="+buttonId
					});
					isDatagridLoaded = true;
				}	

            },
            bms_statement_borrowing_updateData : function (buttonId,actionUrl){
			var selectRow = $$.getSingleSelectRow(metaData.objectId, "请选择你要编辑的"+metaData.objectName);
		    	if(selectRow){
		    		var form = metaData.actionForms[buttonId];							
		    		if(!form){
		    			throw '行为'+buttonId + ',尚未配置要打开的表单信息';
		    		}
					//build business parameters
					var business = {};
					var size = metaData.objectKeys.length;
					var key;
					for(var i=0 ; i< size;i++){
						key = metaData.objectKeys[i];
						business[key] = selectRow[key];
					}
					
					//build technical parameters 
					var techParam = {
						appId:appId,
						srcPageId:metaData.objectId,
						srcTableId:metaData.objectId
					};
					techParam.initActionUrl = appId + authActions['bms_statement_borrowing_getData'];
					techParam.initActionId = 'bms_statement_borrowing_getData';
					techParam.actionId = form.formId;
					techParam.mode = 'edit';
					techParam.refActionUrl = actionUrl;
					techParam.refActionId = buttonId;
					
					var callUrl = $$.buildPageUrl(form.formUrl,techParam,business);
	   				$$.openJcdfDialog(callUrl, '编辑'+metaData.objectName, 800, 1050);
		    	}

            },
    		bms_statement_borrowing_repayData : function (buttonId,actionUrl){
			var selectRow = $$.getSingleSelectRow(metaData.objectId, "请选择你要编辑的"+metaData.objectName);
		    	if(selectRow){
		    		//核销
					clickRow(selectRow)
		    	}

            },
};


///////////--------------------- 代码区；

function init(){
    initSearchDialogRow(searchMeta,formSearchTemplate_id,2);
	// initControlSetting(searchMeta);
	getAuthButtons(metaData.objectId,gridMenuId,authActions,metaData.expellActions);
	initDatagrid();


    loadCombobox('cip_admin_codes','hkfs_manual','hkfs');
    //批量核销提交
    $('#btn_save').bind('click', function() {
        //TODO 获取数据并提交核销数据
        clearData();
    });

    //批量核销取消
    $('#btn_cancel').bind('click', function() {
        $("#hkje").attr("value",'');
        $("#remark").attr("value",'');
        $("#hkfs").combobox('clear');
        $('#batch_clear').dialog('close');
    });

    $('#jzlx').combobox({
        onChange:function(newValue,oldValue){
            setFliter(newValue);
        }
    });
    $('#hkfs').combobox({
        editable:false
    });

    $('#sqrq_f').datebox('textbox').attr('readonly','readonly');
    $('#sqrq_t').datebox('textbox').attr('readonly','readonly');
    $('#cnsprq_f').datebox('textbox').attr('readonly','readonly');
    $('#cnsprq_t').datebox('textbox').attr('readonly','readonly');
    $('#hkrq').datebox('textbox').attr('readonly','readonly');

    $('#sqbm').combobox({
        valueField: 'code_type',
        textField: 'code_name',
        filter: function (q, row) {
            var opts = $(this).combobox('options');
            return row[opts.textField].indexOf(q) > -1;
        },
        loadFilter: function (data) {
            if (data != null && data.errorCode > 0) {
                if (data.msg != null && data.msg != "") {
                    $$.showJcdfMessager('提示消息', data.msg, 'warning');
                }
            }
            return data['data'];
        }
    });
    loadAllOrg('sqbm');

};

//////--------------------------- 函数区
function doAction(buttonId){
	var actionUrl = authActions[buttonId];
	if(actionUrl){
		if(bda_data_str_field[buttonId])
			bda_data_str_field[buttonId](buttonId,appId+actionUrl);
		else {
			//调用通用Action方法，如果需要调用特定表单，需要自己增强函数体
			alert('尚未定义按钮的响应方法:'+buttonId);
		}
	}
	else {
		alert('当前用户没有该操作授权:'+buttonId);
	}
};

function searchReset(){
	$(formSearchTemplate).form('reset');
};
		
//初始化datagrid
function initDatagrid() {
	$(listTemplate).datagrid({
		height:$$.getDatagridHeight(),
		width:$$.getDatagridWidth(),
		border: true,
		nowrap: true,
		striped: true,
		idField:'',
		columns:buildDataGridFields(),
		onBeforeLoad:function(){$$.clearSelect(metaData.objectId);},
		queryParams:$$.serializeToJson(formSearchTemplate),
		pagination:true,
		rownumbers:true,
		singleSelect:true,
		pageSize : $$.pageSize,
		pageList : $$.pageList,
		toolbar: gridMenuId,
		loadFilter: function(data){
			if (data!=null && data.errorCode>0){
				if(data.msg!=null && data.msg!=''){
					$$.showJcdfMessager('提示消息', data.msg, 'warning');
				}
			}
			return data; 
		},
        // onDblClickRow:function (index,row) {
            // $("#lcbh").val(row['lcbh']);
            // $("#sqr").val(row['sqr']);
            // $("#sqrgh").val(row['sqrgh']);
            // $("#sqbm_name").val(row['sqbm_name']);
            // $("#jzlx_name").val(row['jzlx_name']);
            // $("#jtlx_name").val(row['jtlx_name']);
            // $("#fkfs_name").val(row['fkfs_name']);
            // $("#jzje").val(row['jzje']);
            // $("#syje").val(row['syje']);
            // //todo lly
            // $("#hkfs").combobox('setValue');
            // $("#hkrq").datebox('setValue',formatDate(new Date()));
            // //重新渲染
            // // $.parser.parse('#batch_clear');
            // $('#batch_clear').dialog('open');
            // clickRow(index, row);
        // }
	});
};

function buildDataGridFields(){
	if(metaData&&metaData.objectFields){
		var size = metaData.objectFields.length;
		var columns=[];
		var objectField;
		for(var i=0;i<size;i++){
			var column = {};
			objectField = metaData.objectFields[i];
			column['field'] = objectField.field;
			column['title'] = objectField.name;
			column['width'] = $$.fillsize(0.1);
			column['align'] = 'center';
			column['hidden']=objectField.hidden;
			if(objectField.ctrlType=='easyui-datetimebox'){
				column['formatter']=function(value,row,index){
	  				var ftime = new Date(value); 
	               return formatDate(ftime);
	  			}
			}
			columns.push(column);
		}
		return [columns];
	}
	else {
		throw '没有定义完整的数据metaData';
	}
};


//TODO 提交批量核销的数据
var clearUrl = appId +'/actions/bms_statement_borrowing/repayData.do?actionId=bms_statement_borrowing_repayData';

function clearData() {

    if (!$('#form_bms_statement_borrowing_clear_form').form('validate')) {
        return false;
    }
    var jsonData = $$.serializeToJson('#form_bms_statement_borrowing_clear_form');
    if(!jsonData) return false;
    var syje = parseFloat(parseFloat($("#syje").attr("value")).toFixed(2));
    var hkje = parseFloat(parseFloat($("#hkje").attr("value")).toFixed(2));
    // if(hkje > syje){
    //     autoDisappear("提示","还款金额不能大于剩余金额!",2000);
    //     return false;
    // }
    if(hkje == 0 ||hkje == 0.0){
        autoDisappear("提示","还款金额不能为0",2000);
        return false;
    }
	var json = {'keys':{'lcbh':jsonData['lcbh']},'fields':jsonData};
    //如果数据验证通过(即数据合法)
    $$.openProcessingDialog();
    //ajax提交数据
    $.ajax({
        type : 'POST',
        url : clearUrl,
        dataType : 'json',
        data : JSON.stringify(json),
        contentType: 'application/json',
        success : function(data) {
            $$.closeProcessingDialog();
            if (data && data.errorCode==0) {
                $$.showJcdfMessager('提示消息', '操作成功', 'info');
                $('#batch_clear').dialog('close');

                //TODO 核销完成刷新页面
                $("#hkje").attr("value",'');
                $("#remark").attr("value",'');
                $("#hkfs").combobox('clear');

                $('#bms_statement_borrowing_list').datagrid('reload');
            } else {
                $$.showJcdfMessager('提示消息', data.msg+'('+data.errorCode+')', 'warning');
            }
        }
    });

}

function checkFee(obj){
    // obj.value = obj.value.replace(/[^\d]/g,"");  //清除“数字”以外的字符
    obj.value = obj.value.replace(/[^\d.]/g,"");  //清除“数字”和“.”以外的字符
    obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的
    obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
    obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3');//只能输入2个小数
//    obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d\d).*$/,'$1$2.$3');//只能输入3个小数
    if(obj.value.indexOf(".")< 0 && obj.value !=""){//以上已经过滤，此处控制的是如果没有小数点，首位不能为类似于 01、02的金额
        obj.value= parseFloat(obj.value);
    }
    if(obj.value == ""){//当没有值时，赋予0
        obj.value = 0;
    }
    // var bal_amount = parseFloat($("#total_bal_amount").attr("value"));
    // if(obj.value > bal_amount){
    //     obj.value = bal_amount.toFixed(2);
    // }
}

function clickRow(row) {
    $("#lcbh").val(row['lcbh']);
    $("#sqr").val(row['sqr']);
    $("#sqrgh").val(row['sqrgh']);
    $("#sqbm_name").val(row['sqbm_name']);
    $("#jzlx_name").val(row['jzlx_name']);
    $("#jtlx_name").val(row['jtlx_name']);
    $("#fkfs_name").val(row['fkfs_name']);
    $("#jzje").val(row['jzje']);
    $("#syje").val(row['syje']);
    //todo lly
    $("#hkfs").combobox('setValue');
    $("#hkrq").datebox('setValue',formatDate(new Date()));

    //设置下拉框联动
    var jzlx = row['jzlx'];
    if(!jzlx) {
        $$.showJcdfMessager('提示消息', '借支类型不存在!', 'warn');
        return;
    }
    // setFliter(jzlx);




    //重新渲染
    // $.parser.parse('#batch_clear');
    $('#batch_clear').dialog('open');
}

function setFliter(jzlx){
    $('#jtlx').combobox({
        loadFilter:function (datas) {
            var data = datas.data;
            var length = data.length;
            var result = [];
            var t_data = filter[jzlx];
            for(var i=0;i<t_data.length;i++){

                for(var j=0;j<length;j++){
                    var tp = data[j]['code_type'];
                    if(tp == t_data[i]){
                        result.push(data[j]);
                    }
                }
            }
            return  result;
        }
    });

}

//下拉框联动关系
var filter = {
    '0':['0','1','2','3','4','5'],
    '1':['6','7'],
    '2':['8'],
    '3':['9','10','11','12','31'],
    '4':['13','14','16','17','18','19','20','21','22','29'],
    '5':['23'],
    '6':['24','25','26','27'],
    '7':['28'],
    '8':['30']
};

