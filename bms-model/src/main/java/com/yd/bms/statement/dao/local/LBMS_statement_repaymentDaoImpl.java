package com.yd.bms.statement.dao.local;

import com.yd.bms.statement.dao.impl.BMS_statement_repaymentDaoImpl;
import com.yd.bms.statement.pojo.data.BMS_statement_repaymentData;
import com.yd.bms.statement.pojo.po.BMS_statement_repaymentPO;
import com.yd.common.data.CIPOperatorType;
import com.yd.common.data.CIPPageInfo;
import com.yd.common.data.CIPReqCondition;
import com.yd.common.runtime.CIPErrorCode;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;

@Repository(value="BMS_statement_repaymentDaoImpl")
public class LBMS_statement_repaymentDaoImpl extends BMS_statement_repaymentDaoImpl{





    /******************************************************************
    * 方法：add - 新增
    *
    * 变量：po - PO
    *
    * 方法描述:
    *     新增
    ******************************************************************/
    @Override
    public void add( BMS_statement_repaymentPO po){

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
    public void addBatch(List<BMS_statement_repaymentPO> pos){

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

    	StringBuffer querySql = new StringBuffer();
    	querySql.append(sqlManager.getSQL(tableName, "export"));
		StringBuffer whereSql = new StringBuffer().append(" where ");
    	if(conditions!=null && conditions.length>0) {
			int operator;
			for(int i=0 ; i<conditions.length; i++){
				operator = conditions[i].getOperator();
				if(operator == CIPOperatorType.EQUAL.code){
					whereSql.append("main.").append(conditions[i].getFieldName()).append(" = '").append(conditions[i].getLowValue()).append("' and ");
				}
				else if(operator == CIPOperatorType.GREAT_EQUAL.code){
					whereSql.append("main.").append(conditions[i].getFieldName()).append(" >= '").append(conditions[i].getLowValue()).append("' and ");
				}
				else if(operator == CIPOperatorType.GREAT_THAN.code){
					whereSql.append("main.").append(conditions[i].getFieldName()).append(" > '").append(conditions[i].getLowValue()).append("' and ");
				}
				else if(operator == CIPOperatorType.LESS_EQUAL.code){
					whereSql.append("main.").append(conditions[i].getFieldName()).append(" <= '").append(conditions[i].getLowValue()).append("' and ");
				}
				else if(operator == CIPOperatorType.LESS_THAN.code){
					whereSql.append("main.").append(conditions[i].getFieldName()).append(" < '").append(conditions[i].getLowValue()).append("' and ");
				}
				else if(operator == CIPOperatorType.BETWEEN.code){
					whereSql.append("main.").append(conditions[i].getFieldName()).append(" BETWEEN '").append(conditions[i].getLowValue()).append("' and '").append(conditions[i].getHighValue()).append("' and ");
				}
			}
			String whereStr = whereSql.substring(0, whereSql.length() - 4);
			querySql.append(whereStr);
		}
		
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
    public List<BMS_statement_repaymentPO> getPOs( Map<String,Object> conditions){

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
    public BMS_statement_repaymentPO getSingle( Object... keys){

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
    public List<BMS_statement_repaymentData> searchData( CIPPageInfo page, CIPReqCondition[] conditions){

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
    public void update( BMS_statement_repaymentPO po){

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

}

