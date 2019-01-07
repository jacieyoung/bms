package com.yd.bms.org.dao.impl;

import com.yd.bms.org.dao.BMS_org_profileDao;
import com.yd.bms.org.pojo.data.BMS_org_profileData;
import com.yd.bms.org.pojo.po.BMS_org_profilePO;
import com.yd.common.data.CIPOperatorType;
import com.yd.common.data.CIPPageInfo;
import com.yd.common.data.CIPReqCondition;
import com.yd.common.exception.CIPDaoException;
import com.yd.common.function.domain.data.CIPDomainValueData;
import com.yd.common.runtime.CIPErrorCode;
import com.yd.common.sql.CipSqlManager;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

public abstract class BMS_org_profileDaoImpl implements BMS_org_profileDao {

    // dataMapper
    protected BeanPropertyRowMapper<BMS_org_profileData> dataRM;
    // jdbcTemplate
    @Autowired
    protected JdbcTemplate jdbcTemplate;
    // poMapper
    protected BeanPropertyRowMapper<BMS_org_profilePO> poRM;
    // tableKeys
    protected String[] tableKeys;
    // tableName
    protected String tableName;
    protected Logger log = org.slf4j.LoggerFactory.getLogger(getClass());


    protected CipSqlManager sqlManager = null;


    public BMS_org_profileDaoImpl() {
        this.tableName = "bms_org_profile";
        this.tableKeys = new String[]{
                "org_id"
        };
        this.dataRM = BeanPropertyRowMapper.newInstance(BMS_org_profileData.class);
        this.poRM = BeanPropertyRowMapper.newInstance(BMS_org_profilePO.class);
        sqlManager = CipSqlManager.getSqlManager();
    }


    /******************************************************************
     * 方法：add - 新增
     *
     * 变量：po - 机构信息PO
     *
     * 方法描述:
     *     新增
     ******************************************************************/
    @Override
    public void add(BMS_org_profilePO po) {

        SimpleJdbcInsert insertActor = new SimpleJdbcInsert(jdbcTemplate).withTableName(tableName);
        try {
            insertActor.execute(new BeanPropertySqlParameterSource(po));
        } catch (DataAccessException e) {
            log.error(e.getMessage());
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
    public void addBatch(List<BMS_org_profilePO> pos) {

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
            log.error(e.getMessage());
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
            log.error(e.getMessage());
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
    public List<BMS_org_profilePO> getPOs(Map<String, Object> conditions) {

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
            log.error(e.getMessage());
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
    public BMS_org_profilePO getSingle(Object... keys) {

        try {
            StringBuffer sql = new StringBuffer("select * from " + tableName + " where ");
            for (int i = 0; i < tableKeys.length; i++) {
                sql.append(tableKeys[i]).append(" = ? And ");
            }

            sql.delete(sql.length() - 5, sql.length());
            List<BMS_org_profilePO> pos = jdbcTemplate.query(sql.toString(), keys, poRM);
            if (pos != null && pos.size() > 0)
                return pos.get(0);

            return null;
        } catch (Exception e) {
            log.error(e.getMessage());
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
    public List<BMS_org_profileData> searchData(CIPPageInfo page, CIPReqCondition[] conditions) {

        try {
            List<Object> params = new ArrayList<Object>();
            StringBuffer countSql = new StringBuffer().append("SELECT COUNT(1) from (");
            StringBuffer querySql = new StringBuffer();
            querySql.append(sqlManager.getSQL(tableName, "searchData"));
            StringBuffer whereSql = new StringBuffer().append(" where ");
            if (conditions != null && conditions.length > 0) {
                int operator;
                for (int i = 0; i < conditions.length; i++) {
                    operator = conditions[i].getOperator();
                    if (operator == CIPOperatorType.EQUAL.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" = ? and ");
                        params.add(conditions[i].getLowValue());
                    } else if (operator == CIPOperatorType.GREAT_EQUAL.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" >= ? and ");
                        params.add(conditions[i].getLowValue());
                    } else if (operator == CIPOperatorType.GREAT_THAN.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" > ? and ");
                        params.add(conditions[i].getLowValue());
                    } else if (operator == CIPOperatorType.LESS_EQUAL.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" <= ? and ");
                        params.add(conditions[i].getHighValue());
                    } else if (operator == CIPOperatorType.LESS_THAN.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" < ? and ");
                        params.add(conditions[i].getHighValue());
                    } else if (operator == CIPOperatorType.BETWEEN.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" BETWEEN ? and ? and ");
                        params.add(conditions[i].getLowValue());
                        params.add(conditions[i].getHighValue());
                    } else if (operator == CIPOperatorType.IN.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" IN ( ");
                        String[] values = conditions[i].getValues();
                        for (int j = 0; j < values.length; j++) {
                            if (j < values.length - 1)
                                whereSql.append("?, ");
                            else
                                whereSql.append("? ) and ");
                            params.add(values[j]);
                        }
                    } else if (operator == CIPOperatorType.LIKE.code) {
                        if (conditions[i].getFieldName().equals("org_name")) {
                            whereSql.append("main.").append(conditions[i].getFieldName()).append(" like ? and ");
                            params.add(conditions[i].getLowValue());
                        }
                    }
                }
                String whereStr = whereSql.substring(0, whereSql.length() - 4);
                querySql.append(whereStr);
            }
            countSql.append(querySql + "GROUP BY main.org_id) count");

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
     * 方法：searchData - 查询
     *
     * 变量：page - 分页信息
     * 变量：conditions - 查询条件
     *
     * 方法描述:
     *     查询
     ******************************************************************/
    @Override
    public List<BMS_org_profileData> likeSearchData(CIPPageInfo page, CIPReqCondition[] conditions) {

        try {
            List<Object> params = new ArrayList<Object>();
            StringBuffer querySql = new StringBuffer();
            querySql.append(sqlManager.getSQL(tableName, "likeSearchData"));
            StringBuffer whereSql = new StringBuffer().append(" where ");
            if (conditions != null && conditions.length > 0) {
                int operator;
                for (int i = 0; i < conditions.length; i++) {
                    operator = conditions[i].getOperator();
                    if (operator == CIPOperatorType.EQUAL.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" = ? and ");
                        params.add(conditions[i].getLowValue());
                    } else if (operator == CIPOperatorType.GREAT_EQUAL.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" >= ? and ");
                        params.add(conditions[i].getLowValue());
                    } else if (operator == CIPOperatorType.GREAT_THAN.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" > ? and ");
                        params.add(conditions[i].getLowValue());
                    } else if (operator == CIPOperatorType.LESS_EQUAL.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" <= ? and ");
                        params.add(conditions[i].getHighValue());
                    } else if (operator == CIPOperatorType.LESS_THAN.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" < ? and ");
                        params.add(conditions[i].getHighValue());
                    } else if (operator == CIPOperatorType.BETWEEN.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" BETWEEN ? and ? and ");
                        params.add(conditions[i].getLowValue());
                        params.add(conditions[i].getHighValue());
                    } else if (operator == CIPOperatorType.LIKE.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" LIKE ?  and ");
                        params.add(conditions[i].getLowValue());
                    } else if (operator == CIPOperatorType.IN.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" IN ( ");
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
            }

// 			querySql.append(" limit ? offset ?");
            querySql.append(" GROUP BY  main.org_id limit ? offset ?");
            params.add(page.getRows());
            params.add(page.getStartRecord());

            return jdbcTemplate.query(querySql.toString(), params.toArray(), dataRM);
        } catch (DataAccessException e) {
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
    public List<BMS_org_profileData> likeSearchDataByReport(CIPPageInfo page, CIPReqCondition[] conditions) {

        try {
            List<Object> params = new ArrayList<Object>();
            StringBuffer querySql = new StringBuffer();
//  		querySql.append(sqlManager.getSQL(tableName, "likeSearchDataByReport"));
            if (conditions != null) {
                querySql.append("select main.org_name as ").append(conditions[0].getFieldName() + ",");
                querySql.append("main.org_id as ").append(conditions[0].getFieldName().substring(0, conditions[0].getFieldName().length() - 4)).append("id");
                querySql.append(" from ").append(tableName).append(" main");
            }
            StringBuffer whereSql = new StringBuffer().append(" where ");
            if (conditions != null && conditions.length > 0) {
                int operator;
                for (int i = 0; i < conditions.length; i++) {
                    operator = conditions[i].getOperator();
                    if (operator == CIPOperatorType.EQUAL.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" = ? and ");
                        params.add(conditions[i].getLowValue());
                    } else if (operator == CIPOperatorType.GREAT_EQUAL.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" >= ? and ");
                        params.add(conditions[i].getLowValue());
                    } else if (operator == CIPOperatorType.GREAT_THAN.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" > ? and ");
                        params.add(conditions[i].getLowValue());
                    } else if (operator == CIPOperatorType.LESS_EQUAL.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" <= ? and ");
                        params.add(conditions[i].getHighValue());
                    } else if (operator == CIPOperatorType.LESS_THAN.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" < ? and ");
                        params.add(conditions[i].getHighValue());
                    } else if (operator == CIPOperatorType.BETWEEN.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" BETWEEN ? and ? and ");
                        params.add(conditions[i].getLowValue());
                        params.add(conditions[i].getHighValue());
                    } else if (operator == CIPOperatorType.LIKE.code) {
//  						if(conditions[i].getFieldName().equals("report_org_name")){
//  							conditions[i].setFieldName("org_name");
                        whereSql.append("main.").append(conditions[i].getFieldName().substring(conditions[i].getFieldName().length() - 8, conditions[i].getFieldName().length())).append(" LIKE ?  and ");
//  						}
                        params.add(conditions[i].getLowValue());
                    } else if (operator == CIPOperatorType.IN.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" IN ( ");
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

            }
//  			querySql.append(" limit ? offset ?");
            querySql.append(" GROUP BY  main.org_id limit ? offset ?");
            params.add(page.getRows());
            params.add(page.getStartRecord());


            return jdbcTemplate.query(querySql.toString(), params.toArray(), dataRM);
        } catch (DataAccessException e) {
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
    public List<BMS_org_profileData> likeSearchDataByResp(CIPPageInfo page, CIPReqCondition[] conditions) {

        try {
            List<Object> params = new ArrayList<Object>();
            StringBuffer querySql = new StringBuffer();
            querySql.append(sqlManager.getSQL(tableName, "likeSearchDataByResp"));
            StringBuffer whereSql = new StringBuffer().append(" where ");
            if (conditions != null && conditions.length > 0) {
                int operator;
                for (int i = 0; i < conditions.length; i++) {
                    operator = conditions[i].getOperator();
                    if (operator == CIPOperatorType.EQUAL.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" = ? and ");
                        params.add(conditions[i].getLowValue());
                    } else if (operator == CIPOperatorType.GREAT_EQUAL.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" >= ? and ");
                        params.add(conditions[i].getLowValue());
                    } else if (operator == CIPOperatorType.GREAT_THAN.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" > ? and ");
                        params.add(conditions[i].getLowValue());
                    } else if (operator == CIPOperatorType.LESS_EQUAL.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" <= ? and ");
                        params.add(conditions[i].getHighValue());
                    } else if (operator == CIPOperatorType.LESS_THAN.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" < ? and ");
                        params.add(conditions[i].getHighValue());
                    } else if (operator == CIPOperatorType.BETWEEN.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" BETWEEN ? and ? and ");
                        params.add(conditions[i].getLowValue());
                        params.add(conditions[i].getHighValue());
                    } else if (operator == CIPOperatorType.LIKE.code) {
                        if (conditions[i].getFieldName().equals("resp_org_name")) {
                            conditions[i].setFieldName("org_name");
                            whereSql.append("main.").append(conditions[i].getFieldName()).append(" LIKE ?  and ");
                        }
                        params.add(conditions[i].getLowValue());
                    } else if (operator == CIPOperatorType.IN.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" IN ( ");
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
            }

//   			querySql.append(" limit ? offset ?");
            querySql.append(" GROUP BY  main.org_id limit ? offset ?");
            params.add(page.getRows());
            params.add(page.getStartRecord());

            return jdbcTemplate.query(querySql.toString(), params.toArray(), dataRM);
        } catch (DataAccessException e) {
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
    public List<BMS_org_profileData> likeSearchDataByCust(CIPPageInfo page, CIPReqCondition[] conditions) {

        try {
            List<Object> params = new ArrayList<Object>();
            StringBuffer querySql = new StringBuffer();
            querySql.append(sqlManager.getSQL(tableName, "likeSearchDataByCust"));
            StringBuffer whereSql = new StringBuffer().append(" where ");
            if (conditions != null && conditions.length > 0) {
                int operator;
                for (int i = 0; i < conditions.length; i++) {
                    operator = conditions[i].getOperator();
                    if (operator == CIPOperatorType.EQUAL.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" = ? and ");
                        params.add(conditions[i].getLowValue());
                    } else if (operator == CIPOperatorType.GREAT_EQUAL.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" >= ? and ");
                        params.add(conditions[i].getLowValue());
                    } else if (operator == CIPOperatorType.GREAT_THAN.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" > ? and ");
                        params.add(conditions[i].getLowValue());
                    } else if (operator == CIPOperatorType.LESS_EQUAL.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" <= ? and ");
                        params.add(conditions[i].getHighValue());
                    } else if (operator == CIPOperatorType.LESS_THAN.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" < ? and ");
                        params.add(conditions[i].getHighValue());
                    } else if (operator == CIPOperatorType.BETWEEN.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" BETWEEN ? and ? and ");
                        params.add(conditions[i].getLowValue());
                        params.add(conditions[i].getHighValue());
                    } else if (operator == CIPOperatorType.LIKE.code) {
                        if (conditions[i].getFieldName().equals("cust_org_name")) {
                            conditions[i].setFieldName("org_name");
                            whereSql.append("main.").append(conditions[i].getFieldName()).append(" LIKE ?  and ");
                        }
                        params.add(conditions[i].getLowValue());
                    } else if (operator == CIPOperatorType.IN.code) {
                        whereSql.append("main.").append(conditions[i].getFieldName()).append(" IN ( ");
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
            }

//    			querySql.append(" limit ? offset ?");
            querySql.append(" GROUP BY  main.org_id limit ? offset ?");
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
     * 变量：po - 机构信息PO
     *
     * 方法描述:
     *     修改
     ******************************************************************/
    @Override
    public void update(BMS_org_profilePO po) {

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
            log.error(e.getMessage());
            throw new CIPDaoException(CIPErrorCode.ERROR_DATABASE_TECH_EXCEPTION);
        }
    }

    /******************************************************************
     * 方法：updateKV - 修改具体字段
     *
     * 变量：fields - 修改字段
     * 变量：keys - 修改Key
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
            log.error(e.getMessage());
            throw new CIPDaoException(CIPErrorCode.ERROR_DATABASE_TECH_EXCEPTION);
        }

    }

    /******************************************************************
     * 方法：getDomainValues - 全量修改
     *
     * 变量：tableId 
     * 变量：domainId 
     *
     * 方法描述:
     *
     ******************************************************************/

    private BeanPropertyRowMapper<CIPDomainValueData> loaderdataRM = BeanPropertyRowMapper.newInstance(CIPDomainValueData.class);

    @Override
    public List<CIPDomainValueData> getDomainValues(String tableId, String domainId) {
        StringBuffer sql = new StringBuffer();
        String[] code = domainId.split("\\$");
        sql.append("select ").append(code[0]).append(" as code_type,").append(code[1]);
        sql.append(" as code_name from ").append(tableId);
        return jdbcTemplate.query(sql.toString(), loaderdataRM);
    }

    /******************************************************************
     * 方法：loadData - 查询部门下拉框
     *
     * 变量：tableId 
     * 变量：domainId 
     *
     * 方法描述:
     *
     ******************************************************************/
    @Override
    public List<BMS_org_profileData> loadData(String tableId,
                                              String domainId) {
        StringBuffer sql = new StringBuffer();
        sql.append("select ").append(domainId).append(" as resp_org_id,");
        sql.append(" org_name as org_name from ").append(tableId);
        return jdbcTemplate.query(sql.toString(), dataRM1);
    }

    private BeanPropertyRowMapper<BMS_org_profileData> dataRM1 = BeanPropertyRowMapper.newInstance(BMS_org_profileData.class);
}

