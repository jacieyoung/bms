//获取所有消息渠道
function loadChannels(){
	$('#channel').combobox({
		url: appId+'/actions/mms_common_selector/getChannels.do?actionId=mms_common_selector_getChannels',
		valueField : 'chanel_code',
		textField : 'chanel_name',
		filter : function(q, row) {
			var opts = $(this).combobox('options');
			return row[opts.textField].indexOf(q) > -1;
		},
		loadFilter: function(data){
			if (data!=null && data.errorCode>0){
				if(data.msg!=null && data.msg!=""){
					$$.showJcdfMessager('提示消息', data.msg, 'warning');
				}
			}
			return data.data;
		}
	});
};

//获取所有消息类型
function loadDocTypes(){
	$('#doc_type').combobox({
		url: appId+'/actions/mms_common_selector/getDocTypes.do?actionId=mms_common_selector_getDocTypes',
		valueField : 'doc_type',
		textField : 'doc_type_name',
		filter : function(q, row) {
			var opts = $(this).combobox('options');
			return row[opts.textField].indexOf(q) > -1;
		},
		loadFilter: function(data){
			if (data!=null && data.errorCode>0){
				if(data.msg!=null && data.msg!=""){
					$$.showJcdfMessager('提示消息', data.msg, 'warning');
				}
			}
			return data.data;
		}
	});
};

//机构-人员联合下拉框
function loadOrgs(){
	$('#org_id').combobox({
		url: appId+'/actions/mms_common_selector/getOrgs.do?actionId=mms_common_selector_getOrgs',
		valueField : 'org_id',
		textField : 'org_name',
		filter : function(q, row) {
			var opts = $(this).combobox('options');
			return row[opts.textField].indexOf(q) > -1;
		},
		loadFilter: function(data){
			if (data!=null && data.errorCode>0){
				if(data.msg!=null && data.msg!=""){
					$$.showJcdfMessager('提示消息', data.msg, 'warning');
				}
			}
			return data.data;
		},
		onSelect: function(rec){
			var orgId = rec.org_id;
			loadUsers(orgId);
		}
		
	});
};

//人员下拉框，可以选多个
function loadUsers(orgId){
	$('#user_id').combobox({
		url: appId+'/actions/mms_common_selector/getUsersByOrgId.do?actionId=mms_common_selector_getUsersByOrgId&orgId='+orgId,
		valueField : 'user_id',
		textField : 'user_name',
		height: '40px',
		multiple: true,
		multiline: true,
		filter : function(q, row) {
			var opts = $(this).combobox('options');
			return row[opts.textField].indexOf(q) > -1;
		},
		loadFilter: function(data){
			if (data!=null && data.errorCode>0){
				if(data.msg!=null && data.msg!=""){
					$$.showJcdfMessager('提示消息', data.msg, 'warning');
				}
			}
			return data.data;
		}
	});
};

//机构下拉框
function loadJustOrgs(){
	$('#org_id').combobox({
		url: appId+'/actions/mms_common_selector/getOrgs.do?actionId=mms_common_selector_getOrgs',
		valueField : 'org_id',
		textField : 'org_name',
		filter : function(q, row) {
			var opts = $(this).combobox('options');
			return row[opts.textField].indexOf(q) > -1;
		},
		loadFilter: function(data){
			if (data!=null && data.errorCode>0){
				if(data.msg!=null && data.msg!=""){
					$$.showJcdfMessager('提示消息', data.msg, 'warning');
				}
			}
			return data.data;
		}
		
	});
};
//单个人员下拉框
function loadUsersSingle(){
	//找到id为org_id子元素下的隐藏元素，即时该下拉框对应的表单元素
	var orgId = $('#org_id').next().find("input[type = hidden]").val();
	
	if(orgId == null || orgId == ''){
		$$.showJcdfMessager('提示消息', '请先选择机构', 'warning');
		return;
	}
	$('#user_id').combobox({
		url: appId+'/actions/mms_common_selector/getUsersByOrgId.do?actionId=mms_common_selector_getUsersByOrgId&orgId='+orgId,
		valueField : 'user_id',
		textField : 'user_name',
		filter : function(q, row) {
			var opts = $(this).combobox('options');
			return row[opts.textField].indexOf(q) > -1;
		},
		loadFilter: function(data){
			if (data!=null && data.errorCode>0){
				if(data.msg!=null && data.msg!=""){
					$$.showJcdfMessager('提示消息', data.msg, 'warning');
				}
			}
			return data.data;
		}
	});
};