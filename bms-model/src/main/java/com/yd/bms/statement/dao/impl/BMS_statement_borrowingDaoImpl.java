package com.yd.bms.statement.dao.impl;

import com.yd.bms.common.Cip_admin_user_settingData;
import com.yd.bms.statement.dao.BMS_statement_borrowingDao;
import com.yd.bms.statement.pojo.data.BMS_statement_borrowingData;
import com.yd.bms.statement.pojo.po.BMS_statement_borrowingPO;
import com.yd.common.data.CIPOperatorType;
import com.yd.common.data.CIPPageInfo;
import com.yd.common.data.CIPReqCondition;
import com.yd.common.exception.CIPDaoException;
import com.yd.common.runtime.CIPErrorCode;
import com.yd.common.runtime.CIPRuntime;
import com.yd.common.runtime.CIPRuntimeOperator;
import com.yd.common.sql.CipSqlManager;
import com.yd.common.utils.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;

import java.lang.reflect.Field;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

public abstract class BMS_statement_borrowingDaoImpl implements BMS_statement_borrowingDao {

    // dataMapper
    protected BeanPropertyRowMapper<BMS_statement_borrowingData> dataRM;
    // poMapper
    protected BeanPropertyRowMapper<BMS_statement_borrowingPO> poRM;

    protected BeanPropertyRowMapper<Cip_admin_user_settingData> userSettingDataRM;
    // tableName
    protected String tableName;
    // tableKeys
    protected String[] tableKeys;
    // jdbcTemplate
    @Autowired
    protected JdbcTemplate jdbcTemplate;
    protected Logger log = Logger.getLogger(getClass());


    protected CipSqlManager sqlManager = null;


    public BMS_statement_borrowingDaoImpl() {
        this.tableName = "bms_statement_borrowing";
        this.tableKeys = new String[]{
                "lcbh"
        };
        this.dataRM = BeanPropertyRowMapper.newInstance(BMS_statement_borrowingData.class);
        this.poRM = BeanPropertyRowMapper.newInstance(BMS_statement_borrowingPO.class);
        this.userSettingDataRM = BeanPropertyRowMapper.newInstance(Cip_admin_user_settingData.class);
        sqlManager = CipSqlManager.getSqlManager();
    }


    /******************************************************************
     * 方法：add - 新增
     *
     * 变量：po - PO
     *
     * 方法描述:
     *     新增
     ******************************************************************/
    @Override
    public void add(BMS_statement_borrowingPO po) {

        SimpleJdbcInsert insertActor = new SimpleJdbcInsert(jdbcTemplate).withTableName(tableName);
        try {
            insertActor.execute(new BeanPropertySqlParameterSource(po));
        } catch (DataAccessException e) {
            log.error(e.getMessage(), e);
            throw new CIPDaoException(CIPErrorCode.ERROR_DATABASE_TECH_EXCEPTION);
        }
    }

    /******************************************************************
     * 方法：addBatch - 批量新增
     *
     * 变量：pos - POs
     *
     * 方法描述:
     *     批量新增
     ******************************************************************/
    @Override
    public void addBatch(List<BMS_statement_borrowingPO> pos) {

        if (pos == null || pos.size() == 0)
            return;
        SimpleJdbcInsert insertActor = new SimpleJdbcInsert(jdbcTemplate).withTableName(tableName);
        int size = pos.size();
        SqlParameterSource[] psArray = new SqlParameterSource[size];

        for (int i = 0; i < size; i++)
            psArray[i] = new BeanPropertySqlParameterSource(pos.get(i));

        try {
            insertActor.executeBatch(psArray);
        } catch (DataAccessException e) {
            log.error(e.getMessage(), e);
            throw new CIPDaoException(CIPErrorCode.ERROR_DATABASE_TECH_EXCEPTION);
        }
    }

    /******************************************************************
     * 方法：delete - 删除
     *
     * 变量：keys - keys
     *
     * 方法描述:
     *     删除
     ******************************************************************/
    @Override
    public void delete(Object... keys) {

        try {
            StringBuffer sql = new StringBuffer("delete from " + tableName + " where ");
            for (int i = 0; i < tableKeys.length; i++) {
                sql.append(tableKeys[i]).append(" = ? And ");
            }

            sql.delete(sql.length() - 5, sql.length());
            jdbcTemplate.update(sql.toString(), keys);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            throw new CIPDaoException(CIPErrorCode.ERROR_DATABASE_TECH_EXCEPTION);
        }
    }

    /******************************************************************
     * 方法：getPOs - 属性查询
     *
     * 变量：conditions - 属性列表
     *
     * 方法描述:
     *     属性查询
     ******************************************************************/
    @Override
    public List<BMS_statement_borrowingPO> getPOs(Map<String, Object> conditions) {

        if (conditions == null)
            return null;
        StringBuffer sql = new StringBuffer();
        sql.append("select * from ").append(tableName).append(" where ");

        try {
            Set<String> keys = conditions.keySet();
            List<Object> values = new ArrayList<Object>(keys.size());
            for (String key : keys) {
                sql.append(key).append(" = ? and ");
                values.add(conditions.get(key));
            }

            sql.delete(sql.length() - 5, sql.length() - 1);
            return jdbcTemplate.query(sql.toString(), values.toArray(), poRM);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            throw new CIPDaoException(CIPErrorCode.ERROR_DATABASE_TECH_EXCEPTION);
        }
    }

    /******************************************************************
     * 方法：getSingle - 查看
     *
     * 变量：keys - keys
     *
     * 方法描述:
     *     查看
     ******************************************************************/
    @Override
    public BMS_statement_borrowingPO getSingle(Object... keys) {

        try {
            StringBuffer sql = new StringBuffer("select * from " + tableName + " where ");
            for (int i = 0; i < tableKeys.length; i++) {
                sql.append(tableKeys[i]).append(" = ? And ");
            }

            sql.delete(sql.length() - 5, sql.length());
            List<BMS_statement_borrowingPO> pos = jdbcTemplate.query(sql.toString(), keys, poRM);
            if (pos != null && pos.size() > 0)
                return pos.get(0);

            return null;
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            throw new CIPDaoException(CIPErrorCode.ERROR_DATABASE_TECH_EXCEPTION);
        }
    }

    /******************************************************************
     * 方法：searchData - 查询
     *
     * 变量：page - 分页信息
     * 变量：conditions - 查询条件
     *
     * 方法描述:
     *     查询
     ******************************************************************/
    @Override
    public List<BMS_statement_borrowingData> searchData(CIPPageInfo page, CIPReqCondition[] conditions) {
        CIPRuntimeOperator user = CIPRuntime.getOperateSubject();// 系统用户信息
        String userId = user.getSubject_id();
        try {
            List<Object> params = new ArrayList<Object>();
            StringBuffer countSql = new StringBuffer();
            StringBuffer querySql = new StringBuffer();
            querySql.append(sqlManager.getSQL(tableName, "searchData"));
            countSql.append("SELECT COUNT(1) from ( ").append(sqlManager.getSQL(tableName, "searchData"));
            StringBuffer whereSql = new StringBuffer().append(" where ");
            if (conditions != null && conditions.length > 0) {
                int operator;
                String alias;
                for (int i = 0; i < conditions.length; i++) {
                    operator = conditions[i].getOperator();
                    alias = conditions[i].getAlias();
                    if (StringUtils.isEmpty(alias)) {
                        alias = "main";
                    }
                    alias += ".";
                    if (operator == CIPOperatorType.EQUAL.code) {
                        whereSql.append(alias).append(conditions[i].getFieldName()).append(" = ? and ");
                        params.add(conditions[i].getLowValue());
                    } else if (operator == CIPOperatorType.GREAT_EQUAL.code) {
                        whereSql.append(alias).append(conditions[i].getFieldName()).append(" >= ? and ");
                        params.add(conditions[i].getLowValue());
                    } else if (operator == CIPOperatorType.GREAT_THAN.code) {
                        whereSql.append(alias).append(conditions[i].getFieldName()).append(" > ? and ");
                        params.add(conditions[i].getLowValue());
                    } else if (operator == CIPOperatorType.LESS_EQUAL.code) {
                        whereSql.append(alias).append(conditions[i].getFieldName()).append(" <= ? and ");
                        params.add(conditions[i].getHighValue());
                    } else if (operator == CIPOperatorType.LESS_THAN.code) {
                        whereSql.append(alias).append(conditions[i].getFieldName()).append(" < ? and ");
                        params.add(conditions[i].getHighValue());
                    } else if (operator == CIPOperatorType.LIKE.code) {
                        whereSql.append(alias).append(conditions[i].getFieldName()).append(" like ? and ");
                        params.add("%"+conditions[i].getLowValue()+"%");
                    } else if (operator == CIPOperatorType.BETWEEN.code) {
                        whereSql.append(alias).append(conditions[i].getFieldName()).append(" BETWEEN ? and ? and ");
                        params.add(conditions[i].getLowValue());
                        params.add(conditions[i].getHighValue());
                    } else if (operator == CIPOperatorType.IN.code) {
                        whereSql.append(alias).append(conditions[i].getFieldName()).append(" IN ( ");
                        String[] values = conditions[i].getValues();
                        for (int j = 0; j < values.length; j++) {
                            if (j < values.length - 1)
                                whereSql.append("?, ");
                            else
                                whereSql.append("? ) and ");
                            params.add(values[j]);
                        }
                    }
                }
                String whereStr = whereSql.substring(0, whereSql.length() - 4);
                querySql.append(whereStr);
                countSql.append(whereStr);
            }

            //todo lly 增加数据权限

            //*****数据权限开始 *****//
            //过滤字段：org_id
            String whereStartOrgIdStr = "";
            String userSettingSql = "select user_value from cip_admin_user_setting where user_key = 'settle' and user_id = '" + userId + "'";
            List<Cip_admin_user_settingData> settingData = jdbcTemplate.query(userSettingSql, userSettingDataRM);


            if(conditions != null){
                if(settingData != null && settingData.size() > 0){
                   whereStartOrgIdStr = " and main.sqbm in (" + settingData.get(0).getUserValue() + ") ";
                }else{
                    whereStartOrgIdStr = " and main.sqbm in (" + user.getSubject_org() + ") ";
                }
            }else{
                if(settingData != null && settingData.size() > 0){
                        whereStartOrgIdStr = " where main.sqbm in (" + settingData.get(0).getUserValue() + ") ";
                }else {
                    whereStartOrgIdStr = " where main.sqbm in (" + user.getSubject_org() + ") ";
                }
            }
            querySql.append(whereStartOrgIdStr);
            countSql.append(whereStartOrgIdStr);
            //*****数据权限结束*****//

            countSql.append(" ) ct");
            querySql.append(" limit ? offset ?");

            int total = jdbcTemplate.queryForObject(countSql.toString(), params.toArray(), Integer.class);
            page.setTotal(total);

            params.add(page.getRows());
            params.add(page.getStartRecord());

            return jdbcTemplate.query(querySql.toString(), params.toArray(), dataRM);
        } catch (DataAccessException e) {
            log.error(e.getMessage(), e);
            throw new CIPDaoException(CIPErrorCode.ERROR_DATABASE_TECH_EXCEPTION);
        }
    }

    /******************************************************************
     * 方法：update - 修改
     *
     * 变量：po - PO
     *
     * 方法描述:
     *     修改
     ******************************************************************/
    @Override
    public void update(BMS_statement_borrowingPO po) {

        StringBuffer sql = new StringBuffer("update " + tableName + " set ");

        Field[] fields = po.getClass().getDeclaredFields();
        List<Object> values = new ArrayList<Object>();
        Field field;
        String fieldName;
        int i = 0;
        int j = 0;
        int len = tableKeys.length;
        boolean keyFlag = false;
        try {
            for (i = 0; i < fields.length; i++) {
                field = fields[i];
                fieldName = field.getName();
                keyFlag = false;
                if (fieldName.equals("create_time"))
                    continue;
                if (fieldName.equals("create_user"))
                    continue;

                for (j = 0; j < len; j++) {
                    if (fieldName.equals(tableKeys[j])) {
                        keyFlag = true;
                        break;
                    }
                }
                if (keyFlag) {
                    continue;
                }

                sql.append(fieldName + " = ?,");
                field.setAccessible(true);
                values.add(field.get(po));
            }

            sql.deleteCharAt(sql.length() - 1);
            sql.append(" where ");
            Object[] keys = po.toKeys();
            for (i = 0; i < tableKeys.length; i++) {
                sql.append(tableKeys[i]).append(" = ? And ");
                values.add(keys[i]);
            }

            sql.delete(sql.length() - 5, sql.length());
            jdbcTemplate.update(sql.toString(), values.toArray());
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            throw new CIPDaoException(CIPErrorCode.ERROR_DATABASE_TECH_EXCEPTION);
        }
    }

    /******************************************************************
     * 方法：updateKV - 修改具体字段
     *
     * 变量：fields - 修改字段
     * 变量：keys - keys
     *
     * 方法描述:
     *     修改具体字段
     ******************************************************************/
    @Override
    public void updateKV(Map<String, Object> fields, Object... keys) {

        try {
            List<Object> values = new ArrayList<Object>();
            StringBuffer sql = new StringBuffer("update " + tableName + " set ");
            Set<String> columns = fields.keySet();

            for (String key : columns) {
                sql.append(key).append(" = ?,");
                values.add(fields.get(key));
            }

            sql.deleteCharAt(sql.length() - 1);
            sql.append(" where ");
            for (int i = 0; i < tableKeys.length; i++) {
                sql.append(tableKeys[i]).append(" = ? And ");
                values.add(keys[i]);
            }
            sql.delete(sql.length() - 5, sql.length());
            jdbcTemplate.update(sql.toString(), values.toArray());
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            throw new CIPDaoException(CIPErrorCode.ERROR_DATABASE_TECH_EXCEPTION);
        }

    }

    /******************************************************************
     * 方法：updateKVBatch - 批量修改具体字段
     *
     * 变量：updateFields - 修改字段
     *
     * 方法描述:
     *     批量修改具体字段
     ******************************************************************/
    @Override
    public void updateKVBatch(Map<Object[], Map<String, Object>> updateFields) {

        if (null == updateFields || updateFields.size() == 0) {
            return;
        }
        Map<String, Object> fields = updateFields.values().iterator().next();

        StringBuffer sql = new StringBuffer("update " + tableName + " set ");
        Set<String> columns = fields.keySet();

        for (String key : columns) {
            sql.append(key).append(" = ?,");
        }

        sql.deleteCharAt(sql.length() - 1);
        sql.append(" where ");
        for (int i = 0; i < tableKeys.length; i++) {
            sql.append(tableKeys[i]).append(" = ? and ");
        }
        sql.delete(sql.length() - 5, sql.length());
        final List<List<Object>> paramValues = new ArrayList<>();
        for (Map.Entry<Object[], Map<String, Object>> entry : updateFields.entrySet()) {
            Map<String, Object> params = entry.getValue();
            Object[] keyParams = entry.getKey();
            List<Object> paramsList = new ArrayList<>();

            for (Map.Entry<String, Object> paramsEntry : params.entrySet()) {
                paramsList.add(paramsEntry.getValue());
            }
            for (Object key : keyParams) {
                paramsList.add(key);
            }
            paramValues.add(paramsList);

        }
        jdbcTemplate.batchUpdate(sql.toString(), new BatchPreparedStatementSetter() {

            @Override
            public void setValues(PreparedStatement ps, int i) throws SQLException {
                List<Object> objects = paramValues.get(i);
                int index = 1;
                for (Object obj : objects) {
                    ps.setObject(index, obj);
                    index++;
                }
            }

            @Override
            public int getBatchSize() {
                return paramValues.size();
            }
        });
    }

}

