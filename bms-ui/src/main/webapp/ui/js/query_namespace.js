var queryNameSpace = (function() {
    var validateResult = "SUCCESS";
    var metaData = {};
    var searchMeta = [];
    var listTemplate;
    var gridMenuId;
    var isDatagridLoaded = false;
    var queryId = '';
    var directList = {};
    var jumpFlagParams = [];
    var groupTotalFlag = '';
    var totalType = '';

    var otherComboBox = [];
    var defaultPageSize = 15;
    var downLoadType = '1';    //1后台linux下载,2后台windows下载,3js下载
    var isPage = true;
    var singleSelect=true;

    var setSingleSelect = function setSingleSelect(b){
        singleSelect = b;
    }

//初始化查询页面
    var init = function init(query, template, menu, isAutoLoad, page, pageSize) {
        queryId = query;
        listTemplate = template;
        gridMenuId = menu;
        if (page == false){
            isPage = false;
        }
        if (pageSize){
            defaultPageSize = pageSize;
        }
        //queryId = $.getUrlParam('queryId');
        $("#icon-search").click(function () {
            searchQuery();
        });

        getColumns(queryId);
        getSearchConditions(queryId);
        //initSearchByQuery(searchMeta,queryId);
        initControlSetting(searchMeta);
        initDatagrid();
        loadDirectList(queryId);
        initOtherCombobox(searchMeta);
        $("#icon-download").click(function () {
            if (downLoadType == '3') {
                downLoadByJs();
            } else {
                downQuery();
            }
        });

        if (isAutoLoad){
            queryResult();
        }
    }

//js下载
    function downLoadByJs() {
        $.messager.confirm("确认", "确定导出?", function (r) {
            if (r) {
                JSONToCSVConvertor($(listTemplate).datagrid('getRows'), metaData, false);
            }
        });
    }

    function JSONToCSVConvertor(JSONData, metaData, ShowLabel) {
        var arrData = typeof JSONData != 'object' ? JSON.parse(JSONData) : JSONData;
        var size = metaData.objectFields.length;
        var ReportTitle = "";
        for (var j = 0; j < size; j++) {
            if (!metaData.objectFields[j].hidden) {
                ReportTitle += metaData.objectFields[j].name + ",";
            }
        }
        var CSV = '';
        CSV += ReportTitle + '\r\n';
        if (ShowLabel) {
            var row = "";

            for (var j = 0; j < size; j++) {
                if (!metaData.objectFields[j].hidden) {
                    row += arrData[0][j] + ',';
                }
            }
            row = row.slice(0, -1);
            CSV += row + '\r\n';
        }
        for (var i = 0; i < arrData.length; i++) {
            var row = "";
            for (var j = 0; j < size; j++) {
                if (!metaData.objectFields[j].hidden) {
                    if (metaData.objectFields[j].ctrlType == 'easyui-datetimebox') {
                        var ftime = new Date(arrData[i][metaData.objectFields[j].field]);
                        if (ftime == 'Invalid Date') {
                            row += '"",';
                        } else {
                            row += '"' + ftime.Format("yyyy-MM-dd hh:mm:ss") + '",';
                        }
                    } else {
                        var value = arrData[i][metaData.objectFields[j].field];
                        if (typeof(value) != 'undefined') {
                            if (typeof(metaData.objectFields[j].ddicId) != 'undefined' && metaData.objectFields[j].ddicId != null && metaData.objectFields[j].ddicId != '') {
                                var key = metaData.objectFields[j].ddicId;
                                var directValue = directList[key];
                                if (typeof(directValue) != 'undefined' && typeof(directValue[value]) != 'undefined') {
                                    value = directValue[value];
                                }
                            }
                            if (!value && value != 0) {
                                value = " ";
                            } else if (!isNaN(value)) {
                                var tempValue = value + "";
                                if (tempValue.length > 15 || tempValue.indexOf("0") == 0) {
                                    row += '="' + value + '",';
                                    continue;
                                }
                            }

                            row += '"' + value + '",';

                        } else {
                            row += '" ",';
                        }


                    }
                }
            }
            row.slice(0, row.length - 1);
            CSV += row + '\r\n';
        }

        if (CSV == '') {
            alert("Invalid data");
            return;
        }

        var fileName = "result";
        var uri = 'data:text/csv;charset=utf-8,\uFEFF' + encodeURI(CSV);

        var link = document.createElement("a");
        link.href = uri;
        link.style = "visibility:hidden";
        link.download = fileName + ".csv";
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
    }

//初始化展示列
    function getColumns(queryId) {
        var actionUrl = "/query/actions/query_api/getSearchColumns.do?actionId=query_getSearchColumns&query_id=" + queryId;
        $.ajax({
            type: "post",
            url: actionUrl,
            dataType: "json",
            async: false,
            contentType: "application/json",
            success: function (data) {
                var resp = data.data;
                var array = new Array();
                for (var i = 0; i < resp.length; i++) {
                    var object = new Object();
                    object.field = resp[i].ui_column_id;
                    object.name = resp[i].ui_column_name;
                    object.width = resp[i].ui_width;
                    if ("Y" == resp[i].hide_flag) {
                        object.hidden = true;
                    } else {
                        object.hidden = false;
                    }
                    //如果需要分组合计remark设置为T,TN为合计显示行，PS:100为默认显示行数，
                    if ("T" == resp[i].remark) {
                        object.group = 'Y';
                        groupTotalFlag = 'Y';
                    }
                    if ("appendRow" == resp[i].remark || "reloadFooter" == resp[i].remark) {
                        totalType = resp[i].remark;
                    } else if ("TN" == resp[i].remark) {
                        object.totalName = 'Y';
                    } else if (resp[i].remark != null && resp[i].remark.indexOf("PS:") >= 0) {//配置默认显示行数
                        var size = resp[i].remark.replace("PS:", "");
                        if (!isNaN(size)) {
                            defaultPageSize = size;
                        } else {
                            object.remark = resp[i].remark;
                        }
                    } else if (resp[i].remark != null && resp[i].remark.indexOf("DL:") >= 0) {
                        var type = resp[i].remark.replace("DL:", "");
                        if (!isNaN(type)) {
                            downLoadType = type;
                        } else {
                            object.remark = resp[i].remark;
                        }
                    } else {
                        object.remark = resp[i].remark;
                    }
                    object.totalFlag = resp[i].total_flag;
                    object.ddicId = resp[i].column_ddic_id;
                    if ("Y" == resp[i].jump_flag) {
                        jumpFlagParams.push(resp[i].ui_column_id);
                    }
                    array[i] = object;
                }
                metaData.objectFields = array;

            }
        });
    }


    function initOtherCombobox(searchMeta) {
        if (otherComboBox.length > 0) {
            var url = "/query/actions/other_direct/otherDirectSearch.do?actionId=query_other_direct";
            for (var i = 0; i < otherComboBox.length; i++) {
                $('#' + otherComboBox[i].id).combobox({
                    url: url + "&queryId=" + otherComboBox[i].table,
                    valueField: 'keyName',
                    textField: 'valueName',
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
                        return data.data;
                    }
                });
            }
        }
    }


//获取字典表数据
    function loadDirectList(queryId) {
        var actionUrl = "/query/actions/query_direct/doDirectSearch.do?actionId=query_direct_list&query_id=" + queryId;
        $.ajax({
            type: "post",
            url: actionUrl,
            dataType: "json",
            async: false,
            contentType: "application/json",
            success: function (data) {
                directList = data.data;
            }
        });
    }

//初始化请求条件
    function getSearchConditions(queryId) {
        var actionUrl = "/query/actions/query_api/getSearchConditions.do?actionId=query_getSearchConditions&query_id=" + queryId;
        var obj = new Object();
        $.ajax({
            type: "post",
            url: actionUrl,
            dataType: "json",
            async: false,
            contentType: "application/json",
            success: function (data) {
                var resp = data.data;
                var array = new Array();
                for (var i = 0; i < resp.length; i++) {
                    var object = new Object();
                    object.field = resp[i].ui_column_id;
                    object.name = resp[i].ui_column_name;
                    object.ctrlType = resp[i].ui_control;
                    object.searchFlag = resp[i].query_operator;
                    object.remark = resp[i].remark;
                    object.width = resp[i].ui_width;
                    object.height = resp[i].ui_height;
                    object.mustFlag = resp[i].must_flag;
                    object.ddicTable = '';
                    if (resp[i].column_ddic_id != null && resp[i].column_ddic_id != '') {
                        if (resp[i].column_ddic_id.indexOf(".") > 0) {
                            var combox = {};
                            combox.id = object.field;
                            combox.table = resp[i].column_ddic_id;
                            otherComboBox.push(combox);
                        } else {
                            object.ddicTable = "cip_admin_codes";
                        }
                    }
                    object.domainId = resp[i].column_ddic_id;
                    object.defaultValue = resp[i].default_value;
                    object.hidden = resp[i].hide_flag;
                    array[i] = object;
                }
                obj.data = array;
            }
        });
        searchMeta = obj.data;
    }

//初始化查询页面
    function initSearchByQuery(data, queryId) {
        var myForm = "<form id='" + queryId + "' class='form' method='post'>";
        var table_mode = 'normal';
        var mytable = "";
        //常规自定义表头
        var table_head_normal = "<table id='searchTable' border='0'style='border-collapse:collapse;padding:3px;marign:3px' width='400px'>";
        //自定义表头(额外增加1列)
        var table_head_custom = "<table id='searchTable' border='0'style='border-collapse:collapse;padding:3px;marign:3px' width='400px'>";
        //设置默认开始结束时间
        var timeDefaults = [];
        var d = new Date();
        var today = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate() + " ";
        for (var i = 0; i < data.length; i++) {
            var width = "200";
            var height = "25";
            var mustFlag = data[i].mustFlag;
            var dataOptions = '';
            var missingMessage = "该选项为必输项";
            var defaultValue = '';
            var hidden = '';
            if (data[i].ctrlType == null || data[i].ctrlType == '') {
                data[i].ctrlType = "easyui-validatebox";
            }

            if (data[i].remark != '' && data[i].remark != null) {
                missingMessage = data[i].remark;
            }
            if (data[i].width != '' && data[i].width != '0') {
                width = data[i].width;
            }
            if (data[i].height != '' && data[i].height != '0') {
                height = data[i].height;
            }
            if (mustFlag == 'Y') {
                dataOptions = 'required:true';
            }

            if (data[i].defaultValue != null && data[i].defaultValue != '') {
                defaultValue = data[i].defaultValue;
                //时间默认格式
                if (data[i].ctrlType == 'easyui-datetimebox') {
                    var bTimeDefault = {};
                    bTimeDefault.id = data[i].field + "_f";
                    bTimeDefault.time = today + data[i].defaultValue;
                    timeDefaults.push(bTimeDefault);
                    var eTimeDefault = {};
                    eTimeDefault.id = data[i].field + "_t";
                    eTimeDefault.time = today + "23:59:59";
                    timeDefaults.push(eTimeDefault);

                }
            }
            if (data[i].hidden == 'Y') {
                hidden = "hidden='true' ";
            }

            if (data[i].searchFlag == '6') {
                mytable = mytable + "<tr " + hidden + ">";
                mytable = mytable + "<td align=right width=30%>" + data[i].name + "(开始)" + "</td>";
                mytable = mytable + "<td align=right width=5%>" + "</td>";
                mytable = mytable + "<td align=left width=40%>" + "<input type='text' id='" + data[i].field + "_f" + "' name='" + data[i].field + "_f" + "' class='" + data[i].ctrlType + "' style='width:" + width + "px;height:" + height + "px;'" +
                    " data-options='" + dataOptions + "' missingMessage='" + missingMessage + "'  value='" + defaultValue + "' /></td>";
                mytable = mytable + "</tr>";
                mytable = mytable + "<tr " + hidden + ">";
                mytable = mytable + "<td align=right width=30%>" + data[i].name + "(结束)" + "</td>";
                mytable = mytable + "<td align=right width=5%>" + "</td>";
                mytable = mytable + "<td align=left width=40%>" + "<input type='text' id='" + data[i].field + "_t" + "' name='" + data[i].field + "_t" + "' class='" + data[i].ctrlType + "' style='width:" + width + "px;height:" + height + "px;'" +
                    " data-options='" + dataOptions + "' missingMessage='" + missingMessage + "'  value='" + defaultValue + "' /></td>";
                mytable = mytable + "</tr>";

            } else {
                mytable = mytable + "<tr " + hidden + ">";
                mytable = mytable + "<td align=right width=30%>" + data[i].name + "</td>";
                mytable = mytable + "<td align=right width=5%>" + "</td>";
                mytable = mytable + "<td align=left width=40%>" + "<input type='text' id='" + data[i].field + "' name='" + data[i].field + "' class='" + data[i].ctrlType + "' style='width:" + width + "px;height:" + height + "px;' " +
                    " data-options='" + dataOptions + "' missingMessage='" + missingMessage + "'  value='" + defaultValue + "' /></td>";
                if (data[i].inittype == 'find') {
                    mytable = mytable + "<td align=left width=10%>" + "<div type='button' id='btn_" + data[i].field + "'></div>" + "</td>";
                    table_mode = 'custom';
                }
                mytable = mytable + "</tr>";
            }
        }
        mytable = mytable + "</table>";
        mytable = mytable + "</form>";
        switch (table_mode) {
            case 'normal':
                mytable = myForm + table_head_normal + mytable;
                break;
            case 'custom':
                mytable = myForm + table_head_custom + mytable;
                break;
            default:
                break;
        }
        $("#mycx").append(mytable);
        $("#searchTable").css('display', 'none');
        //js设置的easyui插件必须重新渲染
        $.parser.parse();
        //给时间框赋予默认时间
        for (var i = 0; i < timeDefaults.length; i++) {
            $("#" + timeDefaults[i].id).datetimebox('setValue', timeDefaults[i].time);
        }

    };

//查询会话框
    function searchQuery() {
        var width = 460;
        var height = 350;
        $("#searchTable").css('display', 'block');
        $('#mycx').dialog({
            title: "请输入查询条件",
            modal: true,
            width: width,
            height: height,
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: function () {
                    $("#searchTable").css('display', '');
                    queryResult();
                    if ("SUCCESS" == validateResult) {
                        $('#mycx').dialog('close');
                    }
                }
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $("#searchTable").css('display', '');
                    $('#mycx').dialog('close');
                }
            }, {
                text: '清空',
                iconCls: 'icon-reload',
                handler: function () {
                    searchReset();
                }
            }]
        });
//		  searchReset();//暂时先不开发
    }

//下载查询结果
    var downQuery = function downQuery() {
        $.messager.confirm("确认", "确定导出", function (r) {
            if (r) {
                var params = $$.serializeToJson("#" + queryId);
                var conditions = initParams(params);
                var json = {};
                json.search_condition = JSON.stringify(conditions);
                // var json = {"search_condition": JSON.stringify(conditions)};
                var urlAdress = "/query/actions/query_api/doGenericExport.do?actionId=query_doGenericExport&query_id=" + queryId;

                if (downLoadType == '2') {
                    urlAdress += "&download_type=" + downLoadType;
                }
                // $('#' + queryId).form('submit', {
                //     url: urlAdress,
                //     method: "post",
                //     onSubmit: function (param) {
                //         //param.search_condition = JSON.stringify(conditions);
                //     },
                //     success: function (data) {
                //         var oData = JSON.parse(data);
                //         if (oData && oData.errorCode) {
                //             $$.showJcdfMessager('提示消息', oData.msg, 'warning');
                //         }
                //     }
                // });
                $.ajax({
                    type: "post",
                    url: urlAdress,
                    dataType: "json",
                    data: json,
                    async: false,
                    success: function (data) {
                        var oData = JSON.parse(data);
                        if (oData && oData.errorCode) {
                            $$.showJcdfMessager('提示消息', oData.msg, 'warning');
                        }
                    }
                });
            }
        });
    }

    var searchReset = function searchReset() {
        var formSearchTemplate = "#" + queryId;
        $(formSearchTemplate).form('reset');
        $("[class^=easyui-datetimebox]").each(function () {
            $(this).datetimebox('setValue', '');
            ;
        });
    };

//获取数据查询结果
    var queryResult = function queryResult() {
        var formSearchTemplate = "#" + queryId;
        if (validate){
            if (!$(formSearchTemplate).form('validate')) {
                validateResult = "FAIL";
                return;
            }
        }

        var params = $$.serializeToJson(formSearchTemplate);
        if (paramFunction){
            params = paramFunction(params);
        }

        var conditions = initParams(params);
        var json = {"search_condition": JSON.stringify(conditions)};

        if (isDatagridLoaded) {
            $(listTemplate).datagrid('load', json);
        } else {
            $(listTemplate).datagrid({
                queryParams: json,
                url: "/query/actions/query_api/doGenericSearch.do?actionId=query_doGenericSearch&query_id=" + queryId
            });
            isDatagridLoaded = true;
        }
        if (queryResultFunction){
            queryResultFunction();
        }


    };

//初始化请求参数
    var initParams = function(params) {
        var search;
        var conditions = [];
        for (var i = 0; i < searchMeta.length; i++) {
            var condition = {};
            search = searchMeta[i];
            if (search.searchFlag == '0') {
                condition.fieldName = search.field;
                condition.operator = 0;
                condition.lowValue = params[search.field];
                if (!params[search.field])
                    continue;
            } else if (search.searchFlag == '5') {
                condition.fieldName = search.field;
                condition.operator = 5;
                condition.lowValue = params[search.field];
                if (!params[search.field])
                    continue;
            } else if (search.searchFlag == '7') {
                condition.fieldName = search.field;
                condition.operator = 7;
                var value = params[search.field];
                if (value) {
                    var values = value.split(",");
                    var temp = [];
                    for (var j = 0; j < values.length; j++) {
                        temp.push(values[j]);
                    }
                    condition.values = temp;
                }
                if (!params[search.field])
                    continue;
            }
            else if (search.searchFlag == '6') {
                condition.fieldName = search.field;
                condition.operator = 6;
                condition.lowValue = params[search.field + '_f'];
                condition.highValue = params[search.field + '_t'];
                if (condition.highValue == '') {
                    condition.operator = 0;
                }
                if (condition.highValue == '') {
                    condition.operator = 3;
                    if (!condition.lowValue)
                        continue;
                }
                if (condition.lowValue == '') {
                    condition.operator = 4;
                    if (!condition.highValue)
                        continue;
                }
                if (!condition.lowValue && !condition.highValue)
                    continue;
            } else if (search.searchFlag == '8') {
                condition.fieldName = search.field;
                condition.operator = 8;
                condition.lowValue = "%" + params[search.field] + "%";
                if (!params[search.field])
                    continue;
            }
            conditions.push(condition);
        }
        return conditions;
    }

//初始化datagrid
    function initDatagrid() {
        var formSearchTemplate = "#" + queryId;
        $(listTemplate).datagrid({
            height: $$.getDatagridHeight(),
            width: $$.getDatagridWidth(),
            border: true,
            nowrap: true,
            striped: true,
            idField: '',
            remoteSort: false,
            showFooter: true,
            columns: buildDataGridFields(),
            onBeforeLoad: function () {
                $$.clearSelect(metaData.objectId);
            },
            queryParams: $$.serializeToJson(formSearchTemplate),
            pagination: isPage,
            rownumbers: true,
            singleSelect: singleSelect,
            // onLoadSuccess: function () {
            //     if (groupTotalFlag == 'Y') {
            //         appendTotalRow("query_base_list", metaData);
            //         if (totalType) {
            //             totalAll("query_base_list", metaData, totalType);
            //         }
            //     } else {
            //         $(listTemplate).datagrid('statistics'); //合计
            //     }
            // },
            onDblClickRow: function (rowIndex, rowData) {
                if (jumpFlagParams.length > 0) {
                    var params = '';
                    for (var i = 0; i < jumpFlagParams.length; i++) {
                        if (i == jumpFlagParams.length - 1) {
                            params += jumpFlagParams[i] + ":" + rowData[jumpFlagParams[i]];
                        } else {
                            params += jumpFlagParams[i] + ":" + rowData[jumpFlagParams[i]] + ";";
                        }
                    }
                    params = "searchCondition=" + params;
                    validJumpHtml(params);

                }
                if (dbClickRowFunction){
                    dbClickRowFunction(rowIndex, rowData)
                }
            },
            pageSize: defaultPageSize,
            pageList: [15, 20, 30, 50, 100, 500, 1000, 2000],
            toolbar: gridMenuId,
            loadFilter: function (data) {
                if (data != null && data.errorCode > 0) {
                    if (data.msg != null && data.msg != '') {
                        $$.showJcdfMessager('提示消息', data.msg, 'warning');
                    }
                }
                return data;
            },
            onClickRow: function(index, row) {
                if (clickRowFunction){
                    clickRowFunction(index, row)
                }
            }
        });
    };


//页面显示字段处理
    function buildDataGridFields() {
        if (metaData && metaData.objectFields) {
            var size = metaData.objectFields.length;
            var columns = [];
            var objectField;
            for (var i = 0; i < size; i++) {
                var column = {};
                objectField = metaData.objectFields[i];
                column['field'] = objectField.field;
                column['title'] = objectField.name;
                column['totalFlag'] = objectField.totalFlag;
                column['sortable'] = true;
                column['sorter'] = sortColumn;
                var width = $$.fillsize(0.1);
                if (objectField.width != 0) {
                    width = objectField.width;
                }
                column['width'] = width;
                column['align'] = 'center';
                column['hidden'] = objectField.hidden;
                if (objectField.ctrlType == 'easyui-datetimebox') {
                    column['formatter'] = function (value, row, index) {
                        var ftime = new Date(value);
                        return ftime.toLocaleString();
                    };
                }
                if (column['field'] == 'ck'){
                    column['checkbox'] = true;

                }
                if (objectField.ddicId) {
                    column['ddicId'] = objectField.ddicId;
                    column['formatter'] = function (value, row, index) {
                        if (typeof(value) == 'undefined') {
                            return;
                        }
                        var key = this.ddicId;
                        var direct = directList[key];
                        if (typeof(direct) == 'undefined') {
                            return value;
                        }
                        var returnValue = direct[value];
                        if (typeof(returnValue) != 'undefined')
                            return returnValue;
                        return value;
                    };
                }


                columns.push(column);
            }
            return [columns];
        }
        else {
            throw '没有定义完整的数据metaData';
        }
    };

    function sortColumn(a, b) {
        if (a != null && b != null && !isNaN(a) && !isNaN(b)) {
            var number1 = parseFloat(a);
            var number2 = parseFloat(b);
            return (number1 > number2 ? 1 : -1);
        }
        if (a && !b) {
            return 1;
        }
        //数字开头排序
        if (a != null && b != null) {
            return firstWordCompare(a, b);
        }
        return (a > b ? 1 : -1);
    }

    function firstWordCompare(a, b) {
        if (a == b) {
            return 1;
        }
        if (!isNaN(a.substr(0, 1)) && !isNaN(b.substr(0, 1))) {
            var number1 = null;
            var number2 = null;
            var lastA = null;
            var lastB = null;
            for (var i = 0; i < a.length; i++) {
                if (isNaN(a.substr(i, 1))) {
                    number1 = a.substr(0, i);
                    lastA = a.substr(i, a.length);
                    break;
                }
                //都是数字
                if (i == a.length - 1) {
                    number1 = a.substr(0, a.length);
                }

            }
            for (var i = 0; i < b.length; i++) {
                if (isNaN(b.substr(i, 1))) {
                    number2 = b.substr(0, i);
                    lastB = b.substr(i, b.length);
                    break;
                }

                if (i == b.length - 1) {
                    number2 = b.substr(0, b.length);
                }

            }
            number1 = number1.replace(/ /g, '');
            number2 = number2.replace(/ /g, '');
            number1 = parseFloat(number1);
            number2 = parseFloat(number2);
            if (number1 == number2) {
                return firstWordCompare(lastA, lastB);
            }
            return (number1 > number2 ? 1 : -1);
        } else if (isNaN(a.substr(0, 1)) && isNaN(b.substr(0, 1))) {
            var length = a.length > b.length ? b.length : a.length;
            for (var i = 0; i < length; i++) {
                var tempA = a.substr(i, 1);
                var tempB = b.substr(i, 1);
                if (!isNaN(tempA) && !isNaN(tempB)) {
                    tempA = a.substr(i, a.length);
                    tempB = b.substr(i, b.length);
                    return arguments.callee(tempA, tempB);
                } else {
                    if (tempA != tempB) {
                        return (tempA > tempB ? 1 : -1);
                    }
                }
            }
        } else {
            return (a > b ? 1 : -1);
        }
    }

//校验跳转页面是配置
    function validJumpHtml(params, conditions) {
        var actionUrl = "/query/actions/query_api/validJumpHtml.do?actionId=query_valid_jump&query_id=" + queryId + "&" + params;
        $.ajax({
            type: "post",
            url: actionUrl,
            dataType: "json",
            contentType: "application/json",
            async: false,
            success: function (data) {
                if (data.msg != null && data.msg != '' && data.errorCode != '0') {
                    $$.showJcdfMessager('提示消息', data.msg, 'warning');
                } else {
                    var targetData = data.data;
                    var targetId = '';
                    var conditon = '';
                    for (var field in targetData) {
                        if ("targetId" == field) {
                            targetId = targetData[field];
                        } else {
                            conditon += field + ":" + targetData[field] + ";";
                        }
                    }
                    var searchCondition = "searchCondition=" + conditon.substr(0, conditon.length - 1);

                    var callUrl = "/query/ui/view/query/query_base_jump.html?actionId=query_base_jump&targetId=" + targetId + "&" + searchCondition;
                    $$.openJcdfDialog(callUrl, '查看', 400, 1100);
                }
            }
        });
    }

//获取url请求参数
    (function ($) {
        $.getUrlParam = function (name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]);
            return null;
        };
    })(jQuery);

    var paramFunction;
    var setParamFunction = function setParamFunction(f){
        if ($.isFunction(f)){
            paramFunction = f;
        }
    }

    var clickRowFunction;
    var setClickRowFunction = function setClickRowFunction(f){
        if ($.isFunction(f)){
            clickRowFunction = f;
        }
    }

    var dbClickRowFunction;
    var setDbClickRowFunction = function setDbClickRowFunction(f){
        if ($.isFunction(f)){
            dbClickRowFunction = f;
        }
    }

    var queryResultFunction;
    var setQueryResultFunction = function setQueryResultFunction(f){
        if ($.isFunction(f)){
            queryResultFunction = f;
        }
    }

    var validate = false;
    var setValidate = function setValidate(v){
        validate = v;
    }

    return {init: init,
        queryResult: queryResult,
        setQueryResultFunction: setQueryResultFunction,
        setValidate: setValidate,
        searchReset: searchReset,
        setParamFunction: setParamFunction,
        setClickRowFunction: setClickRowFunction,
        setDbClickRowFunction: setDbClickRowFunction,
        initParams: initParams,
        setSingleSelect: setSingleSelect,
        downQuery: downQuery};
})
