use bms;
insert ignore into cip_admin_domain (domain_id,domain_name,domain_type,is_null_flag,data_length,default_value,float_length,data_type,ref_table_id,ref_domain_id,create_time,update_time,operator) VALUES('jzlx','借支类型','1','0','32','','0','VARCHAR','cip_admin_codes','',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_domain (domain_id,domain_name,domain_type,is_null_flag,data_length,default_value,float_length,data_type,ref_table_id,ref_domain_id,create_time,update_time,operator) VALUES('fkfs','付款方式','1','0','32','','0','VARCHAR','cip_admin_codes','',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_codes(domain_id,code_type,code_name,create_time,update_time,operator)  VALUES ('jzlx','1','运输成本',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_codes(domain_id,code_type,code_name,create_time,update_time,operator)  VALUES ('jzlx','2','营销成本',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_codes(domain_id,code_type,code_name,create_time,update_time,operator)  VALUES ('jzlx','3','物料成本',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_codes(domain_id,code_type,code_name,create_time,update_time,operator)  VALUES ('jzlx','4','人力成本',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_codes(domain_id,code_type,code_name,create_time,update_time,operator)  VALUES ('jzlx','5','管理成本',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_codes(domain_id,code_type,code_name,create_time,update_time,operator)  VALUES ('jzlx','6','场地成本',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_codes(domain_id,code_type,code_name,create_time,update_time,operator)  VALUES ('jzlx','7','财税成本',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_codes(domain_id,code_type,code_name,create_time,update_time,operator)  VALUES ('jzlx','8','押金、保证金',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_codes(domain_id,code_type,code_name,create_time,update_time,operator)  VALUES ('jzlx','9','备用金申请',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_codes(domain_id,code_type,code_name,create_time,update_time,operator)  VALUES ('fkfs','1','银行卡',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_codes(domain_id,code_type,code_name,create_time,update_time,operator)  VALUES ('fkfs','2','现金',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource(resource_id,resource_name,resource_desc,sys_uri,resource_type,create_time,update_time,operator,icon_id) values('cip_change_user_pwd_form','密码修改页面','密码修改页面','/ui/view/public/cip_change_user_pwd_form.html?actionId=cip_change_user_pwd_form','P',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system','');
insert ignore into cip_admin_resource(resource_id,resource_name,resource_desc,sys_uri,resource_type,create_time,update_time,operator,icon_id) values('cip_import_form','数据导入模板','数据导入模板','ui/view/public/cip_import_form.html','P',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system','');
insert ignore into cip_admin_resource(resource_id,resource_name,resource_desc,sys_uri,resource_type,create_time,update_time,operator,icon_id) values('default','接口管控系统菜单全集','接口管控系统菜单全集','','R',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system','');
insert ignore into cip_admin_resource(resource_id,resource_name,resource_desc,sys_uri,resource_type,create_time,update_time,operator,icon_id) values('statement','报表信息','报表信息','','F',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system','');
insert ignore into cip_admin_resource(resource_id,resource_name,resource_desc,sys_uri,resource_type,create_time,update_time,operator,icon_id) values('system_changePwd','密码修改','密码修改','actions/common/user/changePwd.do','B',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system','');
insert ignore into cip_admin_resource(resource_id,resource_name,resource_desc,sys_uri,resource_type,create_time,update_time,operator,icon_id) values('system_getDomains','获取数据域','获取数据域','/actions/common/domain/getDomains.do','B',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system','');
insert ignore into cip_admin_resource(resource_id,resource_name,resource_desc,sys_uri,resource_type,create_time,update_time,operator,icon_id) values('system_getDomainValues','获取数据域2','获取数据域2','/actions/common/domain/getDomainValues.do','B',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system','');
insert ignore into cip_admin_resource(resource_id,resource_name,resource_desc,sys_uri,resource_type,create_time,update_time,operator,icon_id) values('system_getResources','获取资源信息','获取资源信息','/actions/common/user/getResources.do','B',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system','');
insert ignore into cip_admin_resource(resource_id,resource_name,resource_desc,sys_uri,resource_type,create_time,update_time,operator,icon_id) values('system_logout','退出系统','退出系统','/actions/common/user/logout.do','B',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system','');
insert ignore into cip_admin_resource(resource_id,resource_name,resource_desc,sys_uri,resource_type,create_time,update_time,operator,icon_id) values('system_refreshResources','刷新角色资源','刷新角色资源','/actions/common/user/refreshResources.do','B',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system','');
insert ignore into cip_admin_resource(resource_id,resource_name,resource_desc,sys_uri,resource_type,create_time,update_time,operator,icon_id) values('bms_statement_borrowing_add_form','借支管理报表addVO','借支管理报表addVO','ui/view/statement/bms_statement_borrowing_add_form.html?actionId=bms_statement_borrowing_add_form','P',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system','');
insert ignore into cip_admin_resource(resource_id,resource_name,resource_desc,sys_uri,resource_type,create_time,update_time,operator,icon_id) values('bms_statement_borrowing_list','借支管理报表','借支管理报表','ui/view/statement/bms_statement_borrowing_list.html?actionId=bms_statement_borrowing_list','A',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system','');
insert ignore into cip_admin_resource(resource_id,resource_name,resource_desc,sys_uri,resource_type,create_time,update_time,operator,icon_id) values('bms_statement_borrowing_query_form','借支管理报表queryVO','借支管理报表queryVO','ui/view/statement/bms_statement_borrowing_query_form.html?actionId=bms_statement_borrowing_query_form','P',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system','');
insert ignore into cip_admin_resource(resource_id,resource_name,resource_desc,sys_uri,resource_type,create_time,update_time,operator,icon_id) values('bms_statement_borrowing_update_form','借支管理报表updateVO','借支管理报表updateVO','ui/view/statement/bms_statement_borrowing_update_form.html?actionId=bms_statement_borrowing_update_form','P',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system','');
insert ignore into cip_admin_resource(resource_id,resource_name,resource_desc,sys_uri,resource_type,create_time,update_time,operator,icon_id) values('bms_statement_repayment_add_form','还款报表addVO','还款报表addVO','ui/view/statement/bms_statement_repayment_add_form.html?actionId=bms_statement_repayment_add_form','P',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system','');
insert ignore into cip_admin_resource(resource_id,resource_name,resource_desc,sys_uri,resource_type,create_time,update_time,operator,icon_id) values('bms_statement_repayment_list','还款报表','还款报表','ui/view/statement/bms_statement_repayment_list.html?actionId=bms_statement_repayment_list','A',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system','');
insert ignore into cip_admin_resource(resource_id,resource_name,resource_desc,sys_uri,resource_type,create_time,update_time,operator,icon_id) values('bms_statement_repayment_query_form','还款报表queryVO','还款报表queryVO','ui/view/statement/bms_statement_repayment_query_form.html?actionId=bms_statement_repayment_query_form','P',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system','');
insert ignore into cip_admin_resource(resource_id,resource_name,resource_desc,sys_uri,resource_type,create_time,update_time,operator,icon_id) values('bms_statement_repayment_update_form','还款报表updateVO','还款报表updateVO','ui/view/statement/bms_statement_repayment_update_form.html?actionId=bms_statement_repayment_update_form','P',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system','');
insert ignore into cip_admin_resource(resource_id,resource_name,resource_desc,sys_uri,resource_type,create_time,update_time,operator,icon_id) values('bms_statement_borrowing_addData','新增','新增','/actions/bms_statement_borrowing/addData.do','B',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system','icon-add');
insert ignore into cip_admin_resource(resource_id,resource_name,resource_desc,sys_uri,resource_type,create_time,update_time,operator,icon_id) values('bms_statement_borrowing_deleteData','删除','删除','/actions/bms_statement_borrowing/deleteData.do','B',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system','icon-remove');
insert ignore into cip_admin_resource(resource_id,resource_name,resource_desc,sys_uri,resource_type,create_time,update_time,operator,icon_id) values('bms_statement_borrowing_exportData','导出','导出','/actions/bms_statement_borrowing/exportData.do','B',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system','icon-download');
insert ignore into cip_admin_resource(resource_id,resource_name,resource_desc,sys_uri,resource_type,create_time,update_time,operator,icon_id) values('bms_statement_borrowing_getData','查看','查看','/actions/bms_statement_borrowing/getData.do','B',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system','icon-search');
insert ignore into cip_admin_resource(resource_id,resource_name,resource_desc,sys_uri,resource_type,create_time,update_time,operator,icon_id) values('bms_statement_borrowing_importData','导入','导入','/actions/bms_statement_borrowing/importData.do','B',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system','');
insert ignore into cip_admin_resource(resource_id,resource_name,resource_desc,sys_uri,resource_type,create_time,update_time,operator,icon_id) values('bms_statement_borrowing_searchData','查询','查询','/actions/bms_statement_borrowing/searchData.do','B',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system','');
insert ignore into cip_admin_resource(resource_id,resource_name,resource_desc,sys_uri,resource_type,create_time,update_time,operator,icon_id) values('bms_statement_borrowing_updateData','修改','修改','/actions/bms_statement_borrowing/updateData.do','B',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system','icon-edit');
insert ignore into cip_admin_resource(resource_id,resource_name,resource_desc,sys_uri,resource_type,create_time,update_time,operator,icon_id) values('bms_statement_repayment_addData','新增','新增','/actions/bms_statement_repayment/addData.do','B',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system','icon-add');
insert ignore into cip_admin_resource(resource_id,resource_name,resource_desc,sys_uri,resource_type,create_time,update_time,operator,icon_id) values('bms_statement_repayment_deleteData','删除','删除','/actions/bms_statement_repayment/deleteData.do','B',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system','icon-remove');
insert ignore into cip_admin_resource(resource_id,resource_name,resource_desc,sys_uri,resource_type,create_time,update_time,operator,icon_id) values('bms_statement_repayment_exportData','导出','导出','/actions/bms_statement_repayment/exportData.do','B',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system','icon-download');
insert ignore into cip_admin_resource(resource_id,resource_name,resource_desc,sys_uri,resource_type,create_time,update_time,operator,icon_id) values('bms_statement_repayment_getData','查看','查看','/actions/bms_statement_repayment/getData.do','B',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system','icon-search');
insert ignore into cip_admin_resource(resource_id,resource_name,resource_desc,sys_uri,resource_type,create_time,update_time,operator,icon_id) values('bms_statement_repayment_importData','导入','导入','/actions/bms_statement_repayment/importData.do','B',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system','');
insert ignore into cip_admin_resource(resource_id,resource_name,resource_desc,sys_uri,resource_type,create_time,update_time,operator,icon_id) values('bms_statement_repayment_searchData','查询','查询','/actions/bms_statement_repayment/searchData.do','B',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system','');
insert ignore into cip_admin_resource(resource_id,resource_name,resource_desc,sys_uri,resource_type,create_time,update_time,operator,icon_id) values('bms_statement_repayment_updateData','修改','修改','/actions/bms_statement_repayment/updateData.do','B',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system','icon-edit');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','default','',1,0,-1,0,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','default','',1,0,-1,0,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_borrowing_addData','bms_statement_borrowing_list',2,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_borrowing_addData','bms_statement_borrowing_list',2,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_borrowing_add_form','bms_statement_borrowing_list',1,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_borrowing_add_form','bms_statement_borrowing_list',1,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_borrowing_deleteData','bms_statement_borrowing_list',4,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_borrowing_deleteData','bms_statement_borrowing_list',4,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_borrowing_exportData','bms_statement_borrowing_list',7,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_borrowing_exportData','bms_statement_borrowing_list',7,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_borrowing_getData','bms_statement_borrowing_list',5,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_borrowing_getData','bms_statement_borrowing_list',5,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_borrowing_importData','bms_statement_borrowing_list',6,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_borrowing_importData','bms_statement_borrowing_list',6,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_borrowing_query_form','bms_statement_borrowing_list',1,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_borrowing_query_form','bms_statement_borrowing_list',1,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_borrowing_searchData','bms_statement_borrowing_list',1,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_borrowing_searchData','bms_statement_borrowing_list',1,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_borrowing_updateData','bms_statement_borrowing_list',3,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_borrowing_updateData','bms_statement_borrowing_list',3,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_borrowing_update_form','bms_statement_borrowing_list',1,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_borrowing_update_form','bms_statement_borrowing_list',1,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_repayment_addData','bms_statement_repayment_list',2,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_repayment_addData','bms_statement_repayment_list',2,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_repayment_add_form','bms_statement_repayment_list',1,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_repayment_add_form','bms_statement_repayment_list',1,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_repayment_deleteData','bms_statement_repayment_list',4,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_repayment_deleteData','bms_statement_repayment_list',4,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_repayment_exportData','bms_statement_repayment_list',7,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_repayment_exportData','bms_statement_repayment_list',7,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_repayment_getData','bms_statement_repayment_list',5,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_repayment_getData','bms_statement_repayment_list',5,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_repayment_importData','bms_statement_repayment_list',6,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_repayment_importData','bms_statement_repayment_list',6,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_repayment_query_form','bms_statement_repayment_list',1,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_repayment_query_form','bms_statement_repayment_list',1,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_repayment_searchData','bms_statement_repayment_list',1,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_repayment_searchData','bms_statement_repayment_list',1,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_repayment_updateData','bms_statement_repayment_list',3,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_repayment_updateData','bms_statement_repayment_list',3,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_repayment_update_form','bms_statement_repayment_list',1,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_repayment_update_form','bms_statement_repayment_list',1,0,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','cip_change_user_pwd_form','default',0,0,0,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','cip_change_user_pwd_form','default',0,0,0,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','cip_import_form','default',0,0,0,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','cip_import_form','default',0,0,0,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','statement','default',1,1,0,0,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','statement','default',1,1,0,0,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','system_changePwd','default',0,0,0,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','system_changePwd','default',0,0,0,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','system_getDomains','default',0,0,0,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','system_getDomains','default',0,0,0,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','system_getDomainValues','default',0,0,0,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','system_getDomainValues','default',0,0,0,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','system_getResources','default',0,0,0,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','system_getResources','default',0,0,0,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','system_logout','default',0,0,0,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','system_logout','default',0,0,0,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','system_refreshResources','default',0,0,0,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','system_refreshResources','default',0,0,0,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_borrowing_list','statement',1,0,1,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_borrowing_list','statement',1,0,1,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_repayment_list','statement',1,0,1,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
insert ignore into cip_admin_resource_2_resource(root_node_id,res_node_id,res_node_sup,node_order,root_flag,res_level,leaf_flag,create_time,update_time,operator) values('default','bms_statement_repayment_list','statement',1,0,1,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');