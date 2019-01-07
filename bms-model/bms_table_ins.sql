use bms;
drop table if exists bms_statement_borrowing;

create table bms_statement_borrowing(
    lcbh                 varchar(32) comment '流程编号',
    sqrq                 date comment '申请日期',
    sqr                  varchar(20) comment '申请人',
    sqrgh                varchar(20) comment '申请人工号',
    sqrzw                varchar(20) comment '申请人职位',
    sqbm                 varchar(20) comment '申请部门',
    jzlx                 char(20) comment '借支类型',
    jtlx                 char(20) comment '具体类型',
    fkfs                 char(20) default '银行卡'  comment '付款方式',
    khhmc                varchar(255) comment '开户行名称',
    yhzh                 varchar(255) comment '银行账号',
    skrqc                varchar(20) comment '收款人全称',
    jzje                 decimal default 0  comment '借支金额',
    hkje                 decimal default 0  comment '还款金额',
    syje                 decimal default 0  comment '剩余金额',
    cnsprq               date comment '出纳审批日期',
    delete_flag          char(1) comment '删除标志',
    remark               varchar(255) comment '备注',
    op_user_id           varchar(20) comment '操作人id',
    op_user_name         varchar(20) comment '操作人',
    update_time          datetime comment '操作时间',
    creator              varchar(20) comment '创建人id',
    creator_name         varchar(20) comment '创建人',
    create_time          datetime comment '创建时间',
	primary key (lcbh)
);

alter table bms_statement_borrowing comment '借支管理报表';

drop table if exists bms_statement_repayment;

create table bms_statement_repayment(
    serial_no            varchar(32) comment '流水号',
    lcbh                 varchar(32) comment '流程编号',
    hkrq                 date comment '还款日期',
    hkfs                 varchar(20) comment '还款方式',
    hkje                 decimal default 0  comment '还款金额',
    syje                 decimal default 0  comment '剩余金额',
    hxr                  varchar(20) comment '核销人',
    cjzgzl               varchar(32) comment '冲借支工作流',
    delete_flag          char(1) comment '删除标志',
    remark               varchar(255) comment '备注',
    op_user_id           varchar(20) comment '操作人id',
    op_user_name         varchar(20) comment '操作人',
    update_time          datetime comment '操作时间',
    creator              varchar(20) comment '创建人id',
    creator_name         varchar(20) comment '创建人',
    create_time          datetime comment '创建时间',
	primary key (serial_no)
);

alter table bms_statement_repayment comment '还款报表';


delete from cip_admin_sql where object_id='bms_statement_borrowing' and sql_id='searchData';
insert into cip_admin_sql(object_id,sql_id,dao_sql,create_time,update_time,create_user)  VALUES ('bms_statement_borrowing','searchData','SELECT main.*,
    jzlx.code_name AS jzlx_name,
    fkfs.code_name AS fkfs_name
FROM bms_statement_borrowing main
    LEFT JOIN 
    cip_admin_codes jzlx ON
    jzlx.domain_id = \'jzlx\' AND 
    main.jzlx = jzlx.code_type
    LEFT JOIN 
    cip_admin_codes fkfs ON
    fkfs.domain_id = \'fkfs\' AND 
    main.fkfs = fkfs.code_type

',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
delete from cip_admin_sql where object_id='bms_statement_borrowing' and sql_id='export';
insert into cip_admin_sql(object_id,sql_id,dao_sql,create_time,update_time,create_user)  VALUES ('bms_statement_borrowing','export','SELECT \'流程编号\', \'申请日期\', \'申请人\', \'申请人工号\', \'申请人职位\', \'申请部门\', \'借支类型\', \'具体类型\', \'付款方式\', \'开户行名称\', \'银行账号\', \'收款人全称\', \'借支金额\', \'还款金额\', \'剩余金额\', \'出纳审批日期\', \'删除标志\', \'备注\', \'操作人id\', \'操作人\', \'操作时间\', \'创建人id\', \'创建人\', \'创建时间\', \'借支类型名称\', \'付款方式名称\'
UNION
 SELECT main.*,
    jzlx.code_name AS jzlx_name,
    fkfs.code_name AS fkfs_name
FROM bms.bms_statement_borrowing main
    LEFT JOIN 
    bms.cip_admin_codes jzlx ON
    jzlx.domain_id = \'jzlx\' AND 
    main.jzlx = jzlx.code_type
    LEFT JOIN 
    bms.cip_admin_codes fkfs ON
    fkfs.domain_id = \'fkfs\' AND 
    main.fkfs = fkfs.code_type

',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
delete from cip_admin_sql where object_id='bms_statement_repayment' and sql_id='searchData';
insert into cip_admin_sql(object_id,sql_id,dao_sql,create_time,update_time,create_user)  VALUES ('bms_statement_repayment','searchData','SELECT main.*
FROM bms_statement_repayment main

',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');
delete from cip_admin_sql where object_id='bms_statement_repayment' and sql_id='export';
insert into cip_admin_sql(object_id,sql_id,dao_sql,create_time,update_time,create_user)  VALUES ('bms_statement_repayment','export','SELECT \'流水号\', \'流程编号\', \'还款日期\', \'还款方式\', \'还款金额\', \'剩余金额\', \'核销人\', \'冲借支工作流\', \'删除标志\', \'备注\', \'操作人id\', \'操作人\', \'操作时间\', \'创建人id\', \'创建人\', \'创建时间\'
UNION
 SELECT main.*
FROM bms.bms_statement_repayment main

',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,'system');

