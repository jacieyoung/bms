//geo信息的url
var geoCountryUrl = "/ddic/ajax/ddic_geo_ajax/getCountry.do";
var geoProvinceUrl = "/ddic/ajax/ddic_geo_ajax/getProvinceByCountry.do?countryCode";
var geoCityUrl = "/ddic/ajax/ddic_geo_ajax/getCityByProvince.do?provinceCode";
var geoZoomUrl = "/ddic/ajax/ddic_geo_ajax/getAreaByCity.do?cityCode";

var geoUrlMap={"country":geoCountryUrl, "province":geoProvinceUrl, "city":geoCityUrl, "zoom":geoZoomUrl};

//org信息的url
var rootOrgUrl = "/ddic/ajax/ddic_org_ajax/getRootOrg.do";
var leafOrgUrl = "/ddic/ajax/ddic_org_ajax/getOrgBySup.do?supId";
var userUrl = "/ddic/ajax/ddic_org_ajax/getUserByOrgId.do?orgId";
var orgUrlMap={"root": rootOrgUrl, "leaf": leafOrgUrl, "user": userUrl};

//ddic信息的url
var getDdicDomain = "/ddic/ajax/ddic_ddic_ajax/getDomain.do";
var getDdicByDomain = "/ddic/ajax/ddic_ddic_ajax/getDdicByDomain.do";
var getDdicCodeValue = "/ddic/ajax/ddic_ddic_ajax/getDdicCodeValue.do";

//functionMap
var functionMap={"org": buildOrg, "geo": buildGeo,"ddic": buildDdic};

var host = document.location.href.split(document.location.pathname)[0];

jQuery.ddictable = {
    sethost : function (newhost) {
		console.info(host)
		host = "http://"+newhost;
		console.info(host)
	},
	//ddictable主函数
	create : function (config) {
		if (typeof config != typeof {}) {
			console.error('configuration must be a Map object');
		}
		if (typeof config.hierarchy != typeof [] || !config.hierarchy) {
			console.error("hierarchy must be a list");
		}

		var buildFunction = functionMap[config.type];
		if (!buildFunction) {
			console.error("no type like " + config.type);
			return;
		}
		buildFunction(this, config);

		return;
	},
    getUserOrgInfoByUserId: function(userId){
        var url = "/ddic/ajax/ddic_org_ajax/getOrgSupsByUserId.do?userId="+userId;
        return ajaxPost(url);
    },
    getGeoInfo: function(type, code){
        var url = "/ddic/ajax/ddic_geo_ajax/getGeoInfo.do?type="+type+"&code="+code;
        return ajaxPost(url);
    }
}

/******************地理信息*****************/
function buildGeo(obj, config){
	var hierarchy = config.hierarchy;
	
	//加载第一个下拉框,如果第一个下拉框配置了默认选项defaultOption，那么根据默认配置加载第二个下拉框,并隐藏第一个下拉框
	var firstItem = hierarchy[0];
	var url = geoUrlMap[firstItem.level];
	if(firstItem.defaultOption){
		var defaultOption = firstItem.defaultOption;
		$(firstItem.selector).css("display","none");
		firstItem = hierarchy[1];
		url = geoUrlMap[firstItem.level]+"="+defaultOption.code;
	}
	
	var data = ajaxPost(url);
	$(firstItem.selector).html(buildSelector(data, firstItem));
	//绑定选项变化事件
	for(var i=0; i<hierarchy.length; i++) {
        var item = hierarchy[i];
        bindGeoChange(item, hierarchy, i);
	}
    for(var i=0; i<hierarchy.length; i++) {
    	if(!hierarchy[i].defaultValue)continue;
        var item = hierarchy[i];
        bindDefaultValue(item, hierarchy, i);
    }

	return;
}
/******************组织信息*****************/
function buildOrg(obj, config){
	var hierarchy = config.hierarchy;
	//加载第一个下拉框,如果第一个下拉框配置了默认选项defaultOption，那么根据默认配置加载第二个下拉框,并隐藏第一个下拉框
	var firstItem = hierarchy[0];
	var url = orgUrlMap[firstItem.level];
	if(firstItem.defaultOption){
		var defaultOption = firstItem.defaultOption;
		$(firstItem.selector).css("display","none");
		firstItem = hierarchy[1];
		url =orgUrlMap[firstItem.level]+"="+defaultOption.code;
	}
	
	var data = ajaxPost(url);
	data.forEach(function(item, index){
		item.code = item.org_id;
		item.name = item.org_name;
	})
	$(firstItem.selector).html(buildSelector(data, firstItem))
	//绑定选项变化事件
	for(var i=0; i<hierarchy.length; i++){
		var item = hierarchy[i];
		bindOrgChange(item, hierarchy, i);
	}
    for(var i=0; i<hierarchy.length; i++) {
        if (hierarchy[i].defaultValue){
            var item = hierarchy[i];
            bindDefaultValue(item, hierarchy, i);
        }
    }
	return;
}
/******************码表信息*****************/
function buildDdic(obj, config){
	var ddicType = config.ddicType;
	var systemId =  config.systemId;
	var domain = config.domain;
    var hierarchy = config.hierarchy;
    if(typeof hierarchy != typeof [] || !hierarchy){
        console.error("hierarchy must be a list");
        return;
    }
    if (ddicType == 'text'){
    	//文本翻译
		ddicText(hierarchy, systemId, domain);
	}else if (ddicType == 'validate'){
        //输入验证
        ddicValidate(hierarchy, systemId, domain);
    }else if (ddicType == 'select'){
        //下拉框
        ddicSelect(hierarchy, systemId, domain);
    }else{
        console.error("ddicType is illegal:"+ddicType);
        return;
    }
	return;
}

/**
 * 字典翻译
 * @param hierarchy
 * @param systemId
 * @param domain
 * @returns
 */
function ddicText(hierarchy, systemId, domain){
    hierarchy.forEach(function (t, index) {

    	var sys = (t.systemId == null || t.systemId == '') ? systemId:t.systemId;
    	var dom = (t.domain == null || t.domain == '') ? domain:t.domain;
        if (sys == null || sys == '' || dom == null || dom == ''){
    		console.error("未指定systemId或者数据域");
    		return;
		}
		if(systemId == "ddicGeo"){
            var url;
            var paraName;
            if (dom == "country"){
            	url = "/ddic/actions/ddic_geo_country/getData.do?actionId=ddic_geo_country_getData";
                paraName = "country_code";
			}else if(dom == "province"){
                url = "/ddic/actions/ddic_geo_province/getData.do?actionId=ddic_geo_province_getData";
                paraName = "prov_code";
			}else if(dom == "city"){
                url = "/ddic/actions/ddic_geo_city/getData.do?actionId=ddic_geo_city_getData";
                paraName = "city_code";
            }else if(dom == "zoom"){
                url = "/ddic/actions/ddic_geo_area/getData.do?actionId=ddic_geo_area_getData";
                paraName = "area_code";
            }else{
            	return;
			}

            $(t.selector).each(function(index, it){
                var text = $(it).text().replace(/[\r\n]/g,"").replace(/[ ]/g,"");
                if (text == '' || text.indexOf("编码") >= 0){
                	return;
				}
                var jsonData = {};
                jsonData[paraName] = text;
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: url,
                    data: JSON.stringify(jsonData),
                    contentType: 'application/json',
                    async:true,
                    cache: true,
                    success: function(data){
                        if (data.errorCode == 0 && data.data != null){
                            for (var key in data.data)
                            {
                                if (key.indexOf("name") >= 0){
                                	console.info(key +"-----"+data.data[key]);
                                    $(it).text(data.data[key]);
								}
                            }
                        }
                    }
                })
            });
		}else if(systemId == "ddicOrg"){
            url = "/ddic/actions/ddic_org_profile/getData.do?actionId=ddic_org_profile_getData";
            $(t.selector).each(function(index, it){
                var text = $(it).text().replace(/[\r\n]/g,"").replace(/[ ]/g,"");
                if (text == '' || text.indexOf("机构") >= 0){
                    return;
                }
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: url,
                    data: JSON.stringify({org_id : text}),
                    contentType: 'application/json',
                    async:true,
                    cache: true,
                    success: function(data){
                        if (data.errorCode == 0 && data.data != null){
							$(it).text(data.data.org_name);
                        }
                    }
                })
            });
		}else{
            $(t.selector).each(function(index, it){
                var text = $(it).text().replace(/[\r\n]/g,"").replace(/[ ]/g,"");
                if (!text || text == ''){
                	return;
				}
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: getDdicCodeValue,
                    data: {systemId:sys, domain:dom, codeType:text},
                    async:true,
                    cache: true,
                    success: function(data){
                        if (data.errorCode == 0 && data.data != null){
                            $(it).text(data.data.code_name);
                        }
                    }
                })
            });
		}
	});
}

/**
 * 字典校验
 * @param hierarchy
 * @param systemId 系统id
 * @param domain 数据域
 * @returns
 */
function ddicValidate(hierarchy, systemId, domain) {
    hierarchy.forEach(function (t, index) {

        var sys = (t.systemId == null || t.systemId == '') ? systemId:t.systemId;
        var dom = (t.domain == null || t.domain == '') ? domain:t.domain;
        if (sys == null || sys == '' || dom == null || dom == ''){
            console.error("未指定systemId或者数据域");
            return;
        }
        $(t.selector).each(function(index, it){
            $.ajax({
                type: "POST",
                dataType: "json",
                url: host + getDdicDomain,
                data: {systemId:sys, domain:dom},
                async:true,
                cache: true,
                success: function(data){
                    if (data.errorCode == 0 && data.data != null){
                    	if (data.data.default_value != null){
                            $(it).attr("placeholder", data.data.default_value);
						}
                        if (data.data.data_length != null){
                            $(it).attr("maxlength", data.data.data_length);
                        }
                        $(it).change(function(){
							var val = $(this).val();
							var msg = validate(data.data, val);

							if (msg != ''){
                            	if (t.errorHandler != null && jQuery.isFunction(t.errorHandler)){
                            		t.errorHandler($(this), msg);
								}else{
                                    alert(msg);
								}
							}
                        });
                    }
                }
            })
        });
    });
}

/**
 * 数据检验
 * @param data
 * @param val
 * @returns
 */
function validate(data, val){
	var msg = '';
    if (data.is_null_flag == 'N'){
        if (val == null || val == ''){
            msg = '该字段不可为空！';
            return msg;
        }
    }
    if (data.data_format != null && data.data_format != ''){
        var reg = new RegExp(data.data_format);
        if (reg.test(val) == false){
            msg = '字段格式错误！';
            return msg
        }
    }
    return msg;
}

/**
 * 字典下拉框
 * @param hierarchy
 * @param systemId
 * @param domain
 * @returns
 */
function ddicSelect(hierarchy, systemId, domain) {
    hierarchy.forEach(function (t, index) {

        var sys = (t.systemId == null || t.systemId == '') ? systemId:t.systemId;
        var dom = (t.domain == null || t.domain == '') ? domain:t.domain;
        if (sys == null || sys == '' || dom == null || dom == ''){
            console.error("未指定systemId或者数据域");
            return;
        }
        $(t.selector).each(function(index, it){
            $.ajax({
                type: "POST",
                dataType: "json",
                url: host + getDdicByDomain,
                data: {systemId:sys, domain:dom},
                async:true,
                cache: true,
                success: function(data){
                    if (data.errorCode == 0 && data.data != null){
                        var list_map = new Array();
                        data.data.forEach(function(t, index){
                            var option = {"code":"", "name":""};
                            option.code = t.code_type;
                            option.name = t.code_name;
                            list_map.push(option);
						});
                        $(it).html(buildSelector(list_map, t));
                        bindDefaultValue(t);
                    }
                }
            })
        });
    });
}
/**
 * 构建下拉框options
 * @param options 数据list
 * @param target select对象
 * @returns
 */
function buildSelector(options, target){
	if(options.length <= 0){
		return;
	}
	var result = "";
	var optionHtml = "<option value='code'>name</option>";
	if(target.optionClass){//自定义的样式
		optionHtml = "<option class='"+target.optionClass+"' value='code'>name</option>";
	}
	
	
	result += optionHtml.replace("code", '').replace("name", "请选择");
	for(var i=0; i<options.length; i++){
		result += optionHtml.replace("code", options[i].code).replace("name", options[i].name);
	}
	return result;
}
/**
 * 绑定地理信息下拉框变动的方法
 * @param target 方法绑定的对象
 * @param allTargets 所有的对象的list
 * @param index 当前绑定对象的索引
 * @returns
 */
function bindGeoChange(target, allTargets, index){
	var selector = target.selector;
	$(selector).change(function(){
		//清空所有下级的数据
		for(var i=index+1; i<allTargets.length; i++){
			$(allTargets[i].selector).html("");
		}
		//选中的值
		if (this.options.length > 0){
            var value = this.options[this.options.selectedIndex].value;
            $(this).attr("value", value);//为selector设值
		}

		if(allTargets.length == index+1){//如果是最后一个，不用加载下级下拉框，直接返回
			return;
		}
		var childTarget = allTargets[index+1];
		var url = geoUrlMap[childTarget.level]+"="+value;
		
		var data = ajaxPost(url);
		$(childTarget.selector).html(buildSelector(data, childTarget));
	})
}

function bindDefaultValue(target, allTargets, index){
    var selector = target.selector;
    console.info(target.defaultValue)
    if (target.defaultValue){
        $(selector).find("option[value='"+target.defaultValue+"']").attr("selected",true);
        $(selector).change();
	}
}

/**
 * 绑定组织信息下拉框变动的方法
 * @param target 方法绑定的对象
 * @param allTargets 所有的对象的list
 * @param index 当前绑定对象的索引
 * @returns
 */
function bindOrgChange(target, allTargets, index){
	var selector = target.selector;
	$(selector).change(function(){
		//清空所有下级的数据
		for(var i=index+1; i<allTargets.length; i++){
			$(allTargets[i].selector).html("");
		}
		//选中的值
		var value = this.options[this.options.selectedIndex].value;
		$(this).attr("value", value);//为selector设值
		if(allTargets.length == index+1){//如果是最后一个，不用加载下级下拉框，直接返回
			return;
		}
		var url = leafOrgUrl+"="+value;
		var data;
		var childTarget = allTargets[index+1];
		//如果下级是用户下拉框
		if(childTarget.level == "user"){
			url = userUrl+"="+value;
			var data = ajaxPost(url);
			data.forEach(function(item, index){
				item.code = item.user_id;
				item.name = item.peson_name;//这里数据库字段拼写有误
			})
		}else{
			data = ajaxPost(url);
			data.forEach(function(item, index){
				item.code = item.org_id;
				item.name = item.org_name;
			})
		}
		$(childTarget.selector).html(buildSelector(data, childTarget));
	})
}
 
/**
 * ajax的post方法
 * @param url
 * @returns
 */
function ajaxPost(url){
	var result;
	$.ajax({
		type: "POST",
		dataType: "json",
		async: false,
		url: host + url,
		success: function(data){
			if(data.errorCode == 0){
				result = data.data;
			}else{
				console.error("get data failed from "+url);
			}
		}
	})
	return result;
}