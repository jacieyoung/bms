package com.yd.bms.statement.dao.local;

import com.yd.bms.common.Cip_admin_user_settingData;
import com.yd.bms.statement.constant.BMS_statement_borrowingConstant;
import com.yd.bms.statement.dao.impl.BMS_statement_borrowingDaoImpl;
import com.yd.bms.statement.pojo.data.BMS_statement_borrowingData;
import com.yd.bms.statement.pojo.po.BMS_statement_borrowingPO;
import com.yd.common.data.CIPOperatorType;
import com.yd.common.data.CIPPageInfo;
import com.yd.common.data.CIPReqCondition;
import com.yd.common.exception.CIPDaoException;
import com.yd.common.runtime.CIPErrorCode;
import com.yd.common.runtime.CIPRuntime;
import com.yd.common.runtime.CIPRuntimeOperator;
import com.yd.common.utils.StringUtils;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Repository(value="BMS_statement_borrowingDaoImpl")
public class LBMS_statement_borrowingDaoImpl extends BMS_statement_borrowingDaoImpl{



    /******************************************************************
    * 方法：add - 新增
    *
    * 变量：po - PO
    *
    * 方法描述:
    *     新增
    ******************************************************************/
    @Override
    public void add( BMS_statement_borrowingPO po){

        super.add(po);

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
    public void addBatch(List<BMS_statement_borrowingPO> pos){

        super.addBatch(pos);

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
    public void delete( Object... keys){

        super.delete(keys);

    }

    /******************************************************************
    * 方法：export - 导出
    *
    * 变量：conditions - 查询条件
    *
    * 方法描述:
    *     导出
    ******************************************************************/
    @Override
    public String export(CIPReqCondition[] conditions){
        CIPRuntimeOperator user = CIPRuntime.getOperateSubject();// 系统用户信息
        String userId = user.getSubject_id();
    	StringBuffer querySql = new StringBuffer();
    	querySql.append(sqlManager.getSQL(tableName, "export"));
		StringBuffer whereSql = new StringBuffer().append(" where ");
    	if(conditions!=null && conditions.length>0) {
			int operator;
            String alias;
			for(int i=0 ; i<conditions.length; i++){
				operator = conditions[i].getOperator();
                alias = conditions[i].getAlias();
                if (StringUtils.isEmpty(alias)) {
                    alias = "main";
                }
                alias += ".";
				if(operator == CIPOperatorType.EQUAL.code){
					whereSql.append(alias).append(conditions[i].getFieldName()).append(" = '").append(conditions[i].getLowValue()).append("' and ");
				}
				else if(operator == CIPOperatorType.GREAT_EQUAL.code){
					whereSql.append(alias).append(conditions[i].getFieldName()).append(" >= '").append(conditions[i].getLowValue()).append("' and ");
				}
				else if(operator == CIPOperatorType.GREAT_THAN.code){
					whereSql.append(alias).append(conditions[i].getFieldName()).append(" > '").append(conditions[i].getLowValue()).append("' and ");
				}
				else if(operator == CIPOperatorType.LESS_EQUAL.code){
					whereSql.append(alias).append(conditions[i].getFieldName()).append(" <= '").append(conditions[i].getHighValue()).append("' and ");
				}
				else if(operator == CIPOperatorType.LESS_THAN.code){
					whereSql.append(alias).append(conditions[i].getFieldName()).append(" < '").append(conditions[i].getHighValue()).append("' and ");
				}
				else if(operator == CIPOperatorType.LIKE.code){
					whereSql.append(alias).append(conditions[i].getFieldName()).append(" LIKE '%").append(conditions[i].getLowValue()).append("%' and ");
				}
				else if(operator == CIPOperatorType.BETWEEN.code){
					whereSql.append(alias).append(conditions[i].getFieldName()).append(" BETWEEN '").append(conditions[i].getLowValue()).append("' and '").append(conditions[i].getHighValue()).append("' and ");
				}
			}
			String whereStr = whereSql.substring(0, whereSql.length() - 4);
			querySql.append(whereStr);
		}

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
        //*****数据权限结束*****//

		//todo lly 增加数据权限
		querySql.append(" limit 50000");
		
        return querySql.toString().replace('\n', ' ');

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
    public List<BMS_statement_borrowingPO> getPOs( Map<String,Object> conditions){

        return super.getPOs(conditions);

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
    public BMS_statement_borrowingPO getSingle( Object... keys){

        return super.getSingle(keys);

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
    public List<BMS_statement_borrowingData> searchData( CIPPageInfo page, CIPReqCondition[] conditions){

        return super.searchData(page,conditions);

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
    public void update( BMS_statement_borrowingPO po){

        super.update(po);

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
    public void updateKV( Map<String,Object> fields,  Object... keys){

        super.updateKV(fields,keys);

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
    public void updateKVBatch( Map<Object[],Map<String,Object>> updateFields){

        super.updateKVBatch(updateFields);

    }


    private static final String CONST_SQL_GET_BY_LCBH = "SELECT * from bms.bms_statement_borrowing  ";

    @Override
    public List<BMS_statement_borrowingPO> getByLcbh(String lcbh) {
        try {
            if (StringUtils.isEmpty(lcbh)) {
                return null;
            }
            List<Object> params = new ArrayList<Object>();
            String[] arr = lcbh.split(",");
            StringBuffer querySql = new StringBuffer().append(CONST_SQL_GET_BY_LCBH).append(" WHERE syje >0 and lcbh in( ");

            for (int j = 0; j < arr.length; j++) {
                if (j < arr.length - 1) {
                    querySql.append("?, ");
                } else {
//                    querySql.append("? ) and ");
                    querySql.append("? ) ");
                }
                params.add(arr[j]);
            }

            querySql.append(" ORDER BY generate_time asc  ");
            return jdbcTemplate.query(querySql.toString(), params.toArray(), poRM);
        } catch (DataAccessException e) {
            log.error(e.getMessage(), e);
            throw new CIPDaoException(CIPErrorCode.ERROR_DATABASE_TECH_EXCEPTION);
        }
    }
}

