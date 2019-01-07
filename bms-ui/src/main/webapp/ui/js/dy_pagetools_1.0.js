//dy 页面公用js

//给输入框附提示信息，需要通过window.onload页面再次加载	
function comboInputPlaceholder(){
	$(".easyui-combobox").each(function(i){
	var span = $(this).siblings("span")[0];
	var targetInput = $(span).find("input:first");
	if(targetInput){
	$(targetInput).attr("placeholder", $(this).attr("placeholder"));
		$(targetInput).attr("onfocus", $(this).attr("onfocus"));
	 }
  });
	$(".easyui-validatebox").each(function(i){
		var span = $(this).siblings("span")[0];
		var targetInput = $(span).find("input:first");
		if(targetInput){
		$(targetInput).attr("placeholder", $(this).attr("placeholder"));
		 }
	  });
}

//numberbox支持maxlength、onblur属性
function numberboxMaxlength(){
	$(".easyui-numberbox").each(function(i){
		var span = $(this).siblings("span")[0];
		var targetInput = $(span).find("input:first");
		if(targetInput){
		$(targetInput).attr("maxlength", $(this).attr("maxlength"));
		$(targetInput).attr("onblur", $(this).attr("onblur"));
		$(targetInput).attr("oninput", $(this).attr("oninput"));
		 }
	  });
}

//按↓键时弹出下拉框
function showPanel(id){
	$("input",$("#"+id).next("span")).keyup(function (e) {
        if (e.keyCode == 40) {
        	$("#"+id).combobox("showPanel");
        }
    });
}

/*自动消失弹框
title：标题
msg：提示信息
timeout：存在时间（毫秒表示），为0时不自动关闭
*/
function autoDisappear(title,msg,timeout){
	$.messager.show({
		title:title,
		msg:msg,
		timeout:timeout,
		showType:'show',
		style:{
			right:'',
			top:document.body.scrollTop+document.documentElement.scrollTop,
			bottom:''
		}
	});
}

//补全自动发送请求
function ComboDataLoader(param, success, error,searchMeta,url) {
    var q = param.q;  
    if (q == undefined || q == "" || q == null)  
        return false; 
    var params = $$.serializeToJson(formTemplate);
    var conditions = [];
	var search;
	for(var i=0; i<searchMeta.length;i++){
		var condition = {};
		search = searchMeta[i];
		if(search.searchFlag=='='){
			if(search.replaceField!=''&&search.replaceField!=undefined){
				condition.fieldName=search.replaceField;
			}else{
				condition.fieldName=search.field;
			}
			condition.operator=0;
			condition.lowValue=params[search.field];
			if(!params[search.field])
				continue;
		}
		conditions.push(condition);
	}	
	var json = {"search_condition" : JSON.stringify(conditions) };
    
    $.ajax({  
        url: url,  
        type: "POST",  
        data: json,  
        dataType: "json",  
        success: function (data) {  
            success(data);
        },  
        //异常处理  
        error: function (xml, text, msg) {  
            error.apply(this, arguments);  
        }  
    });  
}     
function fillValue(field,fieldClass,value){
	var fieldId = field;
    var fieldClass = fieldClass;
    switch (fieldClass) {
    case "easyui-validatebox":
    	$('#'+fieldId).attr('value',value);
        break;
    case "easyui-numberbox":
    	$('#'+fieldId).numberbox('setValue',value);
        break;
    case "easyui-combobox":
    	$('#'+fieldId).combobox('setValue',value);
    	break;
    default:
        break;
    }
};

//combox输入自动补全
function loadQueryDataCombobox(fields,url,link){
	var field_value=fields['valueField'];
	var field_text=fields['textField'];
	var fieldId=fields['fieldId'];
	var msg = fields['msg'];
	var searchMeta = fields['searchMeta'];
	var hiddenFlag=false;
	if(fields['hasHidden']){
		var hiddenFieldId = fields['hiddenFieldId'];
		var hiddenClass = fields['hiddenClass'];
		hiddenFlag=fields['hasHidden'];
	}
	var flag=false;
	if(fields){
	$('#'+fieldId).combobox({
		valueField : field_value,
		textField : field_text,
		mode: "remote", //定义文本改变时读取数据,remote为远程,用户输入的数据以参数名为q的数据请求到服务器, 
		loader: function(param, success, error){
			ComboDataLoader(param, success, error,searchMeta,url);
		}, 		
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
		onSelect: function (record) {
			var sup_manager_id='';
			if(hiddenFlag){
				fillValue(hiddenFieldId,hiddenClass,record[field_value]);
			}
			if(link){
				for(var z=0;z<link.length;z++){
					var va = link[z];
					if(va=='cust_sj_mg_id'){
						$('#cust_sj_mg_id').attr('value',record.sup_manager_id);
					}else{
						$('#'+va).attr('value',record[va]);
					}
				}
			}
			flag=true;
        },
		onHidePanel:function(){
			var value=$("#"+fieldId).combobox('getText');
			var values=$("#"+fieldId).combobox('getData');
			if(values!=null&&values!=undefined){
				var size=values.length;
				if(flag==false){
				for (var i = 0; i < size;i++){
					if(value!=null&&value!=undefined&&value!=''){
					if(values[i][field_text]==value){
						if(hiddenFlag){
							fillValue(hiddenFieldId,hiddenClass,record[field_value]);
						}
						flag=true;						
					}
					}
				}}}
			if(flag==false){
				alert(msg);
				$("#"+fieldId).combobox('setValue','');
			}
			flag=false;
		}
	});
	}else{
		throw '没有定义完整的数据fields';
	}
}
//----------------------省市区三级联动,该方法适合选择省、市时触发----------------------------------
//--------------------------------------------------省市区----------------------------------------------
function load(param, success, error,url,parentCode,childCode){
	var conditions = [];
	var condition = {};
	condition.fieldName=parentCode;
	condition.operator=0;
	condition.lowValue=param;
	conditions.push(condition);
	var json = {"search_condition" : JSON.stringify(conditions) };
	$.ajax({  
        url: url,  
        type: "POST",  
        data: json,  
        dataType: "json",  
        success: function(data) {  
            success(data);
            showPanel(childCode)
            comboInputPlaceholder();
        },  
        //异常处理  
        error: function (xml, text, msg) {  
            error.apply(this, arguments);  
        }  
    });  
}
function loadAddress(parentCode,childCode,childName,url){
	$('#'+parentCode).combobox({ 
		onSelect: function(rec){
			var prefix = parentCode.substring(0,parentCode.length-9);//前缀
			var prov_code = parentCode.substring(parentCode.length-9,parentCode.length);//截取parentCode值，为后9个字符
			var child_code = childCode.substring(childCode.length-9,childCode.length);//截取childCode值，为后9个字符
			var child_name = childName.substring(childName.length-14,childName.length);//截取childName值，为后14个字符
			if(prov_code == "prov_code"){
				var para = rec.code_type;
				if(para == undefined || para == "" || para == null){
					para = rec[parentCode];
				}
				$('#'+prefix+"area_code").combobox('setValue','');
				$('#'+prefix+"area_code").combobox({
		        	 valueField: 'area_code',
					 textField: 'area_code_name',
					 editable:false,
					 loader: function(param, success, error){
							load(para, success, error,url,prov_code,childCode);

					 },
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
				$('#'+childCode).combobox({
					valueField: child_code,
					textField: child_name,
					editable:false,
					loader: function(param, success, error){
						load(para, success, error,url,prov_code,childCode);
						
					},
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
			}else{
				var para = rec[prov_code];
				if(para == undefined || para == "" || para == null){
					para = rec[prov_code];
				}
				$('#'+childCode).combobox({
					valueField: child_code,    
					textField: child_name,
					editable:false,
					loader: function(param, success, error){
						load(para, success, error,url,prov_code,childCode);
						
					},
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
			}
        }
	})  
}

//----------------------------------------------------------------------------------------------

/*//----------------------------------------------自定义查询条件框- 原版有线框--------------------------------------------------
//初始化创建查询区域
function initSearch(data,formSearchTemplate) {
	  var myForm = "<form id='"+formSearchTemplate+"' class='search-form' method='post'>";
	  var table_mode='normal';
	  var mytable="";
	  //常规自定义表头
	  var table_head_normal="<table id='searchTable' border='1'style='border-collapse:collapse;padding:3px;marign:3px' width='400px'><tr><td align=center>选中</td><td align=center>名称</td><td align=center>符号</td><td align=center>值</td></tr>";
	  //自定义表头(额外增加1列)
	  var table_head_custom="<table id='searchTable' border='1'style='border-collapse:collapse;padding:3px;marign:3px' width='400px'><tr><td align=center>选中</td><td align=center>名称</td><td align=center>符号</td><td align=center>值</td><td align=center>操作</td></tr>";
	  //var table_body="";
	  for (i = 0; i < data.length; i++) {
		  if(data[i].ctrlType=='easyui-datetimebox'||data[i].ctrlType=='easyui-datebox'){
			  mytable = mytable + "<tr>";
			  mytable = mytable + "<td align=center width=10%>" + "<input id='checked_" + i + "' type='checkbox'  />" + "</td>";     
			  mytable = mytable + "<td align=center width=30%>" + data[i].name+"(开始)" + "</td><td align=center width=10%>" + data[i].searchFlag + "</td>";
			  mytable = mytable + "<td align=left width=40%>" + "<input type='text' id='" + data[i].field+"_f" + "' name='" + data[i].field+"_f" +"' class='"+data[i].ctrlType+"' style='width:200px;height:30px;' /></td>";
			  mytable = mytable + "</tr>";
			  mytable = mytable + "<tr>";
			  mytable = mytable + "<td align=center width=10%>" + "<input id='checked_" + i + "' type='checkbox'  />" + "</td>";     
			  mytable = mytable + "<td align=center width=30%>" + data[i].name+"(结束)" + "</td><td align=center width=10%>" + data[i].searchFlag + "</td>";
			  mytable = mytable + "<td align=left width=40%>" + "<input type='text' id='" + data[i].field+"_t" + "' name='" + data[i].field+"_t" +"' class='"+data[i].ctrlType+"' style='width:200px;height:30px;' /></td>";
			  mytable = mytable + "</tr>";
	      }else{
	    	  mytable = mytable + "<tr>";
	    	  mytable = mytable + "<td align=center width=10%>" + "<input id='checked_" + i + "' type='checkbox'  />" + "</td>";     
	    	  mytable = mytable + "<td align=center width=30%>" + data[i].name+"</td><td align=center width=10%>" + data[i].searchFlag + "</td>";
	    	  mytable = mytable + "<td align=left width=40%>" + "<input type='text' id='" + data[i].field + "' name='" + data[i].field +"' class='"+data[i].ctrlType+"' style='width:200px;height:30px;' /></td>";
		      if (data[i].inittype=='find'){ 
		    	  mytable = mytable +"<td align=left width=10%>" + "<div type='button' id='btn_"+data[i].field+"'></div>"+ "</td>";
		    	  table_mode='custom';
		      }
		      mytable = mytable + "</tr>";
	      }
	  }
	  mytable = mytable + "</table>";
	  mytable = mytable+"</from>"
	  switch(table_mode){
	  		case 'normal':
	  			mytable = myForm+table_head_normal+mytable;
	  			break;
	  		case 'custom':
	  			mytable = myForm+table_head_custom+mytable;
	  			break;
	  		default:
	  			break;
	  }
	  $("#mycx").append(mytable);
	  $("#searchTable").css('display','none');	  
	//设置
	};*/

//----------------------------------------------自定义查询条件框 - 无框线的框---------------------------------------------------
//初始化创建查询区域
function initSearch(data,formSearchTemplate) {
	  var myForm = "<form id='"+formSearchTemplate+"' class='search-form' method='post'>";
	  var table_mode='normal';
	  var mytable="";
	  //常规自定义表头
	  var table_head_normal="<table id='searchTable' border='0'style='border-collapse:collapse;padding:3px;marign:3px' width='400px'>";
	  //自定义表头(额外增加1列)
	  var table_head_custom="<table id='searchTable' border='0'style='border-collapse:collapse;padding:3px;marign:3px' width='400px'>";
	  //var table_body="";
	  for (i = 0; i < data.length; i++) {
		  if(data[i].ctrlType=='easyui-datetimebox'||data[i].ctrlType=='easyui-datebox'){
			  mytable = mytable + "<tr>";
			  mytable = mytable + "<td align=right width=30%>" + data[i].name+"(开始)" + "</td>";
			  mytable = mytable + "<td align=right width=5%>" +"</td>";
			  mytable = mytable + "<td align=left width=40%>" + "<input type='text' id='" + data[i].field+"_f" + "' name='" + data[i].field+"_f" +"' class='"+data[i].ctrlType+"' style='width:200px;height:30px;' /></td>";
			  mytable = mytable + "</tr>";
			  mytable = mytable + "<tr>";
			  mytable = mytable + "<td align=right width=30%>" + data[i].name+"(结束)" + "</td>";
			  mytable = mytable + "<td align=right width=5%>" +"</td>";
			  mytable = mytable + "<td align=left width=40%>" + "<input type='text' id='" + data[i].field+"_t" + "' name='" + data[i].field+"_t" +"' class='"+data[i].ctrlType+"' style='width:200px;height:30px;' /></td>";
			  mytable = mytable + "</tr>";
	      }else{
	    	  mytable = mytable + "<tr>";
	    	  mytable = mytable + "<td align=right width=30%>" + data[i].name+"</td>";
	    	  mytable = mytable + "<td align=right width=5%>" +"</td>";
	    	  mytable = mytable + "<td align=left width=40%>" + "<input type='text' id='" + data[i].field + "' name='" + data[i].field +"' class='"+data[i].ctrlType+"' style='width:200px;height:30px;' /></td>";
		      if (data[i].inittype=='find'){ 
		    	  mytable = mytable +"<td align=left width=10%>" + "<div type='button' id='btn_"+data[i].field+"'></div>"+ "</td>";
		    	  table_mode='custom';
		      }
		      mytable = mytable + "</tr>";
	      }
	  }
	  mytable = mytable + "</table>";
	  mytable = mytable+"</from>"
	  switch(table_mode){
	  		case 'normal':
	  			mytable = myForm+table_head_normal+mytable;
	  			break;
	  		case 'custom':
	  			mytable = myForm+table_head_custom+mytable;
	  			break;
	  		default:
	  			break;
	  }
	  $("#mycx").append(mytable);
	  $("#searchTable").css('display','none');	  
	//设置
    //重新渲染
    $.parser.parse("#searchTable");
	};



// 初始化弹框查询 --- 专用
function initSearchDialog(fields,formSearchTemplate){

    var myForm = "<form id='"+formSearchTemplate+"' class='search-form' method='post'>";
    var table_mode='normal';
    var mytable="";
    //常规自定义表头
    var table_head_normal="<table id='searchTable' border='0'style='border-collapse:collapse;padding:3px;marign:3px' width='400px'>";
    //自定义表头(额外增加1列)
    var table_head_custom="<table id='searchTable' border='0'style='border-collapse:collapse;padding:3px;marign:3px' width='400px'>";

    //初始化弹框样式
    for(var i=0;i<fields.length;i++){
        var ctrlType = fields[i].ctrlType;
        var oprator = fields[i].searchFlag;//操作符
        if('>='==oprator){
            mytable = mytable + "<tr>";
            mytable = mytable + "<td align=right width=30%>" + fields[i].name+"(开始)" + "</td>";
            mytable = mytable + "<td align=right width=5%>" +"</td>";
            mytable = mytable + "<td align=left width=40%>" + "<input type='text' id='" + fields[i].field+"_f" + "' name='" + fields[i].field+"_f" +"' class='"+fields[i].ctrlType+"' style='width:200px;height:30px;' /></td>";
            mytable = mytable + "</tr>";
            continue;
        }

        if('<='==oprator){
            mytable = mytable + "<tr>";
            mytable = mytable + "<td align=right width=30%>" + fields[i].name+"(结束)" + "</td>";
            mytable = mytable + "<td align=right width=5%>" +"</td>";
            mytable = mytable + "<td align=left width=40%>" + "<input type='text' id='" + fields[i].field+"_t" + "' name='" + fields[i].field+"_t" +"' class='"+fields[i].ctrlType+"' style='width:200px;height:30px;' /></td>";
            mytable = mytable + "</tr>";
            continue;
        }
        //没有开始和结束的走下面
        mytable = mytable + "<tr>";
        mytable = mytable + "<td align=right width=30%>" + fields[i].name+"</td>";
        mytable = mytable + "<td align=right width=5%>" +"</td>";
        mytable = mytable + "<td align=left width=40%>" + "<input type='text' id='" + fields[i].field + "' name='" + fields[i].field +"' class='"+fields[i].ctrlType+"' style='width:200px;height:30px;' /></td>";
        if (fields[i].inittype=='find'){
            mytable = mytable +"<td align=left width=10%>" + "<div type='button' id='btn_"+fields[i].field+"'></div>"+ "</td>";
            table_mode='custom';
        }
        mytable = mytable + "</tr>";

    }//for循环结束

    //添加元素到页面 默认隐藏
    mytable = mytable + "</table>";
    mytable = mytable+"</form>"
    switch(table_mode){
        case 'normal':
            mytable = myForm+table_head_normal+mytable;
            break;
        case 'custom':
            mytable = myForm+table_head_custom+mytable;
            break;
        default:
            break;
    }
    $("#mycx").append(mytable);
    $("#searchTable").css('display','none');


    //加载数据 必须在上面 元素添加到页面后才有效
    for(var j=0;j<fields.length;j++){
        var ctrlType = fields[j].ctrlType;
        if('N' == fields[j].display){
            $("#"+fields[j].field).parent().parent().hide();
        }

        if('easyui-datebox' == ctrlType){

            if(fields[j].searchFlag=='>='){

                $("#"+fields[j].field+"_f").datebox({editable:true});

            }else if(fields[j].searchFlag=='<='){

                $("#"+fields[j].field+"_t").datebox({editable:true});

            }else{

                $("#"+fields[j].field).datebox({editable:true});
            }
        }

        if('easyui-datetimebox' == ctrlType && fields[j].searchFlag=='>='){
            $("#"+fields[j].field+"_f").datetimebox({
                editable:true
            });

            //默认不可修改时间
            if(!fields[j].changeTime){
                $("#"+fields[j].field+"_f").datetimebox('spinner').timespinner({
                    formatter:function(dt){
                        return "00:00:00";
                    }
                });
            }
        }
        if('easyui-datetimebox' == ctrlType && fields[j].searchFlag=='<='){
            $("#"+fields[j].field+"_t").datetimebox({
                editable:true
            });

            if(!fields[j].changeTime){
                $("#"+fields[j].field+"_t").datetimebox('spinner').timespinner({
                    formatter:function(dt){
                        return "23:59:59";
                    }
                });
            }
        }

        if('easyui-combobox'== ctrlType){
            $("#"+fields[j].field).combobox({
                editable:true
            });

            if(fields[j].ddicTable && fields[j].ddicTable){
                //加载code值
                loadCombobox(fields[j].ddicTable,fields[j].domainId, fields[j].field);
            }
        }

        if('easyui-combotree'== ctrlType){
            $("#"+fields[j].field).combotree({
                editable:true
            });
        }


    }

    //重新渲染
    $.parser.parse("#searchTable");
};
//初始化弹框查询 --- 专用
/**
 *
 * @param fields
 * @param formSearchTemplate
 * @param tdNum 查询条件分行 几个条件为一行 lly 注意这里不能有隐藏的查询条件
 */
function initSearchDialogRow(fields,formSearchTemplate,tdNum){

    var myForm = "<form id='"+formSearchTemplate+"' class='search-form' method='post'>";
    var table_mode='normal';
    var mytable="";
    //常规自定义表头
    var table_head_normal="<table id='searchTable' border='0'style='border-collapse:collapse;padding:3px;marign:3px' >";
    //自定义表头(额外增加1列)
    var table_head_custom="<table id='searchTable' border='0'style='border-collapse:collapse;padding:3px;marign:3px' >";

    var pos = 0;
    var splitRow = 1;
    if(tdNum) {
    	splitRow = tdNum;
    }
    //初始化弹框样式
    for(var i=0;i<fields.length;i++){
        var ctrlType = fields[i].ctrlType;
        var oprator = fields[i].searchFlag;//操作符
		pos = (i+1) % splitRow;//索引从0开始
        if('>='==oprator){
        	if(pos == 1) {
                mytable = mytable + "<tr>";
            }
            mytable = mytable + "<td align=right >" + fields[i].name+"(开始)" + "</td>";
            mytable = mytable + "<td align=right >" +"&nbsp&nbsp</td>";
            mytable = mytable + "<td align=left >" + "<input type='text' id='" + fields[i].field+"_f" + "' name='" + fields[i].field+"_f" +"' class='"+fields[i].ctrlType+"' style='width:200px;height:30px;' /></td>";
            if(pos == 0) {
                mytable = mytable + "</tr>";
            }
            continue;
        }

        if('<='==oprator){
            if(pos == 1) {
                mytable = mytable + "<tr>";
            }
            mytable = mytable + "<td align=right >" + fields[i].name+"(结束)" + "</td>";
            mytable = mytable + "<td align=right >" +"&nbsp&nbsp</td>";
            mytable = mytable + "<td align=left >" + "<input type='text' id='" + fields[i].field+"_t" + "' name='" + fields[i].field+"_t" +"' class='"+fields[i].ctrlType+"' style='width:200px;height:30px;' /></td>";
            if(pos == 0) {
                mytable = mytable + "</tr>";
            }
            continue;
        }
        //没有开始和结束的走下面
        if(pos == 1) {
            mytable = mytable + "<tr>";
        }
        mytable = mytable + "<td align=right >" + fields[i].name+"</td>";
        mytable = mytable + "<td align=right >" +"&nbsp&nbsp</td>";
        mytable = mytable + "<td align=left >" + "<input type='text' id='" + fields[i].field + "' name='" + fields[i].field +"' class='"+fields[i].ctrlType+"' style='width:200px;height:30px;' /></td>";
        if (fields[i].inittype=='find'){
            mytable = mytable +"<td align=left >" + "<div type='button' id='btn_"+fields[i].field+"'></div>"+ "&nbsp&nbsp</td>";
            table_mode='custom';
        }
        if(pos == 0) {
            mytable = mytable + "</tr>";
        }

    }//for循环结束

    //添加元素到页面 默认隐藏
    mytable = mytable + "</table>";
    mytable = mytable+"</form>"
    switch(table_mode){
        case 'normal':
            mytable = myForm+table_head_normal+mytable;
            break;
        case 'custom':
            mytable = myForm+table_head_custom+mytable;
            break;
        default:
            break;
    }
    $("#mycx").append(mytable);
    $("#searchTable").css('display','none');


    //加载数据 必须在上面 元素添加到页面后才有效
    for(var j=0;j<fields.length;j++){
        var ctrlType = fields[j].ctrlType;
        if('N' == fields[j].display){
            $("#"+fields[j].field).parent().parent().hide();
        }

        if('easyui-datebox' == ctrlType){

            if(fields[j].searchFlag=='>='){

                $("#"+fields[j].field+"_f").datebox({editable:true});

            }else if(fields[j].searchFlag=='<='){

                $("#"+fields[j].field+"_t").datebox({editable:true});

            }else{

                $("#"+fields[j].field).datebox({editable:true});
            }
        }

        if('easyui-datetimebox' == ctrlType && fields[j].searchFlag=='>='){
            $("#"+fields[j].field+"_f").datetimebox({
                editable:true
            });

            //默认不可修改时间
            if(!fields[j].changeTime){
                $("#"+fields[j].field+"_f").datetimebox('spinner').timespinner({
                    formatter:function(dt){
                        return "00:00:00";
                    }
                });
            }
        }
        if('easyui-datetimebox' == ctrlType && fields[j].searchFlag=='<='){
            $("#"+fields[j].field+"_t").datetimebox({
                editable:true
            });

            if(!fields[j].changeTime){
                $("#"+fields[j].field+"_t").datetimebox('spinner').timespinner({
                    formatter:function(dt){
                        return "23:59:59";
                    }
                });
            }
        }

        if('easyui-combobox'== ctrlType){
            $("#"+fields[j].field).combobox({
                editable:true
            });

            if(fields[j].ddicTable && fields[j].ddicTable){
                //加载code值
                loadCombobox(fields[j].ddicTable,fields[j].domainId, fields[j].field);
            }
        }

        if('easyui-combotree'== ctrlType){
            $("#"+fields[j].field).combotree({
                editable:true
            });
        }


    }

    //重新渲染
    $.parser.parse("#searchTable");
};

/**
 *
 * @param fields 字段数据源
 * @param formSearchTemplate
 * @param searchTableId tableId 这里可以随机也可以指定
 * @param appendDiv 默认为mycxs 多个必须指定
 */
function initSearchDialogs(fields,formSearchTemplate,searchTableId,appendDiv){

    var myForm = "<form id='"+formSearchTemplate+"' class='search-form' method='post'>";
    var table_mode='normal';
    var s_table = !searchTableId?'searchTables':searchTableId;
    var d_div = appendDiv?appendDiv:'mycxs';
    var s_prev_id = d_div + ' #'+formSearchTemplate +' #'+s_table;
    // var s_prev = '#'+d_div + ' #'+formSearchTemplate +' #'+s_table;
    var s_prev = '#'+s_prev_id;
    var mytable="";
    //常规自定义表头
    var table_head_normal="<table id='"+s_table+"' border='0'style='border-collapse:collapse;padding:3px;marign:3px' width='400px'>";
    //自定义表头(额外增加1列)
    var table_head_custom="<table id='"+s_table+"' border='0'style='border-collapse:collapse;padding:3px;marign:3px' width='400px'>";

    //初始化弹框样式
    for(var i=0;i<fields.length;i++){
        var ctrlType = fields[i].ctrlType;
        var oprator = fields[i].searchFlag;//操作符
        if('>='==oprator){
            mytable = mytable + "<tr>";
            mytable = mytable + "<td align=right width=30%>" + fields[i].name+"(开始)" + "</td>";
            mytable = mytable + "<td align=right width=5%>" +"</td>";
            mytable = mytable + "<td align=left width=40%>" + "<input type='text' id='" + fields[i].field+"_f" + "' name='" + fields[i].field+"_f" +"' class='"+fields[i].ctrlType+"' style='width:200px;height:30px;' /></td>";
            mytable = mytable + "</tr>";
            continue;
        }

        if('<='==oprator){
            mytable = mytable + "<tr>";
            mytable = mytable + "<td align=right width=30%>" + fields[i].name+"(结束)" + "</td>";
            mytable = mytable + "<td align=right width=5%>" +"</td>";
            mytable = mytable + "<td align=left width=40%>" + "<input type='text' id='" + fields[i].field+"_t" + "' name='" + fields[i].field+"_t" +"' class='"+fields[i].ctrlType+"' style='width:200px;height:30px;' /></td>";
            mytable = mytable + "</tr>";
            continue;
        }
        //没有开始和结束的走下面
        mytable = mytable + "<tr>";
        mytable = mytable + "<td align=right width=30%>" + fields[i].name+"</td>";
        mytable = mytable + "<td align=right width=5%>" +"</td>";
        mytable = mytable + "<td align=left width=40%>" + "<input type='text' id='" + fields[i].field + "' name='" + fields[i].field +"' class='"+fields[i].ctrlType+"' style='width:200px;height:30px;' /></td>";
        if (fields[i].inittype=='find'){
            mytable = mytable +"<td align=left width=10%>" + "<div type='button' id='btn_"+fields[i].field+"'></div>"+ "</td>";
            table_mode='custom';
        }
        mytable = mytable + "</tr>";

    }//for循环结束

    //添加元素到页面 默认隐藏
    mytable = mytable + "</table>";
    mytable = mytable+"</form>"
    switch(table_mode){
        case 'normal':
            mytable = myForm+table_head_normal+mytable;
            break;
        case 'custom':
            mytable = myForm+table_head_custom+mytable;
            break;
        default:
            break;
    }
    $("#"+d_div).append(mytable);
    $("#"+s_table).css('display','none');


    //加载数据 必须在上面 元素添加到页面后才有效
    for(var j=0;j<fields.length;j++){
        var ctrlType = fields[j].ctrlType;
        if('N' == fields[j].display){
            $(s_prev+" #"+fields[j].field).parent().parent().hide();
        }

        if('easyui-datebox' == ctrlType){

            if(fields[j].searchFlag=='>='){

                $(s_prev+" #"+fields[j].field+"_f").datebox({editable:true});

            }else if(fields[j].searchFlag=='<='){

                $(s_prev+" #"+fields[j].field+"_t").datebox({editable:true});

            }else{

                $(s_prev+" #"+fields[j].field).datebox({editable:true});
            }
        }

        if('easyui-datetimebox' == ctrlType && fields[j].searchFlag=='>='){
            $(s_prev+" #"+fields[j].field+"_f").datetimebox({
                editable:true
            });

            //默认不可修改时间
            if(!fields[j].changeTime){
                $(s_prev+" #"+fields[j].field+"_f").datetimebox('spinner').timespinner({
                    formatter:function(dt){
                        return "00:00:00";
                    }
                });
            }
        }
        if('easyui-datetimebox' == ctrlType && fields[j].searchFlag=='<='){
            $(s_prev+" #"+fields[j].field+"_t").datetimebox({
                editable:true
            });

            if(!fields[j].changeTime){
                $(s_prev+" #"+fields[j].field+"_t").datetimebox('spinner').timespinner({
                    formatter:function(dt){
                        return "23:59:59";
                    }
                });
            }
        }

        if('easyui-combobox'== ctrlType){
            $(s_prev+" #"+fields[j].field).combobox({
                editable:true
            });

            if(fields[j].ddicTable && fields[j].ddicTable){
                //加载code值
                loadCombobox(fields[j].ddicTable,fields[j].domainId, s_prev_id + ' #'+fields[j].field);
            }
        }

        if('easyui-combotree'== ctrlType){
            $(s_prev+" #"+fields[j].field).combotree({
                editable:true
            });
        }

    }
    //重新渲染
    $.parser.parse("#"+s_table);

};


//初始化输入框控件
function initControlTool(fields){
		var ctrlType;
		for(var i=0;i<fields.length;i++){
			ctrlType = fields[i].ctrlType;
				if('N' == fields[i].display){
					$("#"+fields[i].field).parent().parent().hide();
				}
				if('easyui-datebox' == ctrlType){
					$("#"+fields[i].field+"_f").datebox({
		          		editable:true
		          	});
					$("#"+fields[i].field+"_t").datebox({
		          		editable:true
		          	});
				} else if('easyui-datetimebox' == ctrlType){
					$("#"+fields[i].field+"_f").datetimebox({
		          		editable:true
		          	});
					$("#"+fields[i].field+"_t").datetimebox({
		          		editable:true
		          	});
				}else if('easyui-combobox'== ctrlType){
					$("#"+fields[i].field).combobox({
						editable:true
					});
					//loadCombobox(fields[i].ddicTable,fields[i].domainId, fields[i].field);
				}
		}
	};
//异步加载下拉框数据
	function initSearchComboboxData(fields){
		setTimeout(function(){
			var ctrlType;
			for(var i=0;i<fields.length;i++){
				ctrlType = fields[i].ctrlType;
				if('easyui-combobox'==ctrlType){
					loadCombobox(fields[i].ddicTable,fields[i].domainId,fields[i].field);
				}
			}
		},2000);
	}
//查询会话框	
function Search(param,width,height){
	  var width;
	  var height;
	  if(width == null||width == undefined){
		width = 460;
	  }
	  if(height == null||height == undefined){
		height = 350;
	  }
	  $("#searchTable").css('display','block');
	  $('#mycx').dialog({
	  	title:"请输入查询条件",
	  	modal:true,
	  	width:width,
	  	height:height,
	  	buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:function(){
					$("#searchTable").css('display','');
					$('#mycx').dialog('close');
					doAction(param);
				}
			},{
				text:'取消',
				iconCls:'icon-cancel',
				handler:function(){
					 $("#searchTable").css('display','');
					$('#mycx').dialog('close');
				}
			},{
				text:'清空',
				iconCls:'icon-reload',
				handler:function(){
					searchReset();
				}
			}]
	  });
	}

//---------------------------------------------验证方法区域--------------------------------------------
//身份证验证
var aCity={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"}
function isCardID(sId){
	var iSum=0 ;
    var info="";
    if(!/^\d{17}(\d|x)$/i.test(sId))return false;
    sId=sId.replace(/x$/i,"a");
    if(aCity[parseInt(sId.substr(0,2))]==null) return false;   
    sBirthday=sId.substr(6,4)+"-"+Number(sId.substr(10,2))+"-"+Number(sId.substr(12,2));   
    var d=new Date(sBirthday.replace(/-/g,"/")) ;  
    if(sBirthday!=(d.getFullYear()+"-"+ (d.getMonth()+1) + "-" + d.getDate()))return false;   
    for(var i = 17;i>=0;i --) iSum += (Math.pow(2,i) % 11) * parseInt(sId.charAt(17 - i),11) ;  
    if(iSum%11!=1) return false;
    
    return true;
}   

$.extend($.fn.validatebox.defaults.rules, {     
idcared: {     
    validator: function(value,param){    
        var flag= isCardID(value);  
        return flag==true?true:false;    
    },     
    message: '不是有效的身份证号码'    
},
//新增145、147、170、176...手机号
mobileNo:{
    validator : function(value){ 
    return /^1([38]\d|4[57]|5[0-35-9]|7[06-8]|8[89])\d{8}$/.test(value); 
	},
	message : '请输入有效的手机号码' 
}
}); 
//-------------------------------------------------------------------------------------------------


var loadAllOrgUrl = '/bms/actions/bms_org_profile/loadAllOrg.do?actionId=bms_org_person_loaderData';
function loadAllOrg(comboboxId){
    $.ajax({
        type: 'POST',
        url: loadAllOrgUrl,
        dataType: 'json',
        // data: JSON.stringify(resultData),
        contentType: 'application/json',
        success: function (data) {
            $$.closeProcessingDialog();
            if (data && data.errorCode == 0) {
                $('#'+comboboxId).combobox('setValue', '');
                $('#'+comboboxId).combobox('loadData', data);
            } else {
                $$.showJcdfMessager('提示消息', data.msg + '(' + data.errorCode + ')', 'warning');
            }
        }
    });

}
