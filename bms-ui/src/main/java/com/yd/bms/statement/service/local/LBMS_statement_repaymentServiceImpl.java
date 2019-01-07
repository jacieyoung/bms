package com.yd.bms.statement.service.local;

import com.yd.bms.statement.constant.BMS_statement_repaymentConstant;
import com.yd.bms.statement.pojo.data.BMS_statement_repaymentData;
import com.yd.bms.statement.pojo.key.BMS_statement_repaymentKey;
import com.yd.bms.statement.pojo.po.BMS_statement_repaymentPO;
import com.yd.bms.statement.pojo.vo.BMS_statement_repayment_addVO;
import com.yd.bms.statement.pojo.vo.BMS_statement_repayment_queryVO;
import com.yd.bms.statement.pojo.vo.BMS_statement_repayment_updateVO;
import com.yd.bms.statement.service.impl.BMS_statement_repaymentServiceImpl;
import com.yd.common.data.CIPPageInfo;
import com.yd.common.data.CIPReqCondition;
import com.yd.common.exception.CIPServiceException;
import com.yd.common.runtime.CIPErrorCode;
import com.yd.common.runtime.CIPRuntimeConfigure;
import com.yd.common.runtime.CIPRuntimeOperator;
import com.yd.common.utils.DateUtils;
import com.yd.common.utils.ExcelReader;

import java.io.*;
import java.lang.reflect.Field;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import org.springframework.stereotype.Service;

@Service(value="BMS_statement_repaymentServiceImpl")
public class LBMS_statement_repaymentServiceImpl extends BMS_statement_repaymentServiceImpl{





    /******************************************************************
    * 方法：addData - 新增
    *
    * 变量：vo - 新增VO
    * 变量：user - 用户信息
    *
    * 方法描述:
    *     新增记录还款报表-bms_statement_repayment
    ******************************************************************/
    @Override
    public void addData( BMS_statement_repayment_addVO vo,  CIPRuntimeOperator user){

        super.addData(vo,user);

    }

    /******************************************************************
    * 方法：deleteData - 删除
    *
    * 变量：key - 删除Key
    * 变量：user - 用户信息
    *
    * 方法描述:
    *     删除记录还款报表-bms_statement_repayment
    ******************************************************************/
    @Override
    public void deleteData( BMS_statement_repaymentKey key,  CIPRuntimeOperator user){

        super.deleteData(key,user);

    }

    /******************************************************************
    * 方法：exportData - 导出
    *
    * 变量：exportPath - 导出文件路径
    * 变量：conditions - 查询条件
    * 变量：user - 用户信息
    *
    * 方法描述:
    *     导出记录还款报表-bms_statement_repayment
    ******************************************************************/
    @Override
    public String exportData( String exportPath, CIPReqCondition[] conditions,  CIPRuntimeOperator user){

    	String fileName=null;
		Properties prop = System.getProperties();
		String os = prop.getProperty("os.name");// 判断是哪个操作系统
		if (os.startsWith("win") || os.startsWith("Win")) {
			// 1. 提取命令文件
			String dosPath=this.getClass().getClassLoader().getResource("java2dos.bat").getPath();  
			String exportShell =dosPath.substring(dosPath.indexOf("/")+1);//去掉第一个“/”
			// 2. 生成文件名
			fileName = exportPath + File.separator + "BMS_statement_repayment"
					+ DateUtils.getDate(new Date()) + ".xls";
			
			File f = new File(fileName);
			if(f.exists())//如果文件已经存在，则删除
				f.delete();
						
			// 3. 提取执行sql
			String sqlStr = dataDao.export(conditions);
			StringBuffer sql = new StringBuffer();
	    	sql.append("\" select * into outfile '").append(fileName.replace("\\", "/")).append("' CHARACTER SET gbk").append(" from (").append(sqlStr).append(") f\"");
			
	    	// 4. 拼接shell指定命令和变量
			String[] cmdarray=new String[]{exportShell,fileName,sql.toString()};
			
			// 5. 执行脚本
			Process ps;
			try {
				ps = Runtime.getRuntime().exec(cmdarray);
				// 6. 获取回执结果
				int exitValue = -1; // 失败返回-1
				InputStream in = ps.getInputStream();
				byte[] buff = new byte[1024];
				while (in.read(buff) != -1) {
					if (new String(buff, "gbk").contains("success")) {
						exitValue = 1;// 成功返回1
						break;
					}
					Thread.sleep(1000);
				}
				in.close();
				if (exitValue > 0) {
					return fileName;
				} else {
					return null;
				}
			} catch (Exception e) {
				throw new CIPServiceException(new CIPErrorCode(999999,"亲,不好意思,文件导出出错了!" + e.getMessage()));
			} 
		} else {
			try {
				String querySql=dataDao.export(conditions);
				fileName = "BMS_statement_repayment"+ DateUtils.getDate(new Date());
				String cmd = null;
				String exportFile = null;
				
				String dbUsername = CIPRuntimeConfigure.additionalInfos.getProperty("export.db.user");
				String dbPwd = CIPRuntimeConfigure.additionalInfos.getProperty("export.db.pwd");
				String dbHost = CIPRuntimeConfigure.additionalInfos.getProperty("export.db.host");
				String port = CIPRuntimeConfigure.additionalInfos.getProperty("export.db.port");

				if (querySql != null && fileName != null) {
					exportFile = exportPath + File.separator + fileName+".csv";
					
					File f = new File(exportFile);
					if(f.exists())//如果文件已经存在，则删除
						f.delete();
					cmd = "mysql -h " + dbHost + " -P" + port + " -u" + dbUsername + " -p" + dbPwd + " -ss -e \"" + querySql + "\" | sed 's/\\t/\",\"/g;s/^/\"/;s/$/\"/;s/\\n//g'  |sed  's/\"0[0-9]\\{1,\\}/=&/g ; s/\"[^0][0-9]\\{11,\\}/=&/g' "
							+ " |sed  's/NULL/''/g ;s/,/，/g ;s/\"，/\",/g ;' >" + exportFile;
				}

				// 执行Linux命令操作
				String[] cmdA = { "/bin/sh", "-c", cmd };
				System.out.println(cmd);
				Process process = Runtime.getRuntime().exec(cmdA);
				LineNumberReader br = new LineNumberReader(new InputStreamReader(
						process.getInputStream()));
				StringBuffer sb = new StringBuffer();
				String line;
				while ((line = br.readLine()) != null) {
					sb.append(line).append("\n");
				}
				br.close();

				/**
				 *  lly 20180917 添加导出出错信息!!
				 */
				if(sb.length()<1) {
					BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(process.getErrorStream()));
					StringBuffer errorInfo = new StringBuffer();
					String el;
					while ((el = bufferedReader.readLine()) != null) {
						errorInfo.append(el).append("\n");
					}
					//todo lly regex
					if (errorInfo.indexOf("/bin/sh:") != -1 || errorInfo.indexOf("ERROR") != -1) {
						System.out.println(errorInfo);
					}
				}
				return exportFile;
			} catch (Exception e) {
				throw new CIPServiceException(new CIPErrorCode(999999,"亲,不好意思,文件导出出错了!" + e.getMessage()));
			}
		}

    }

    /******************************************************************
    * 方法：getData - 查看
    *
    * 变量：key - 查看key
    * 变量：user - 用户信息
    *
    * 方法描述:
    *     查看记录还款报表-bms_statement_repayment
    ******************************************************************/
    @Override
    public BMS_statement_repayment_queryVO getData( BMS_statement_repaymentKey key,  CIPRuntimeOperator user){

        return super.getData(key,user);

    }

    /******************************************************************
    * 方法：importData - 导入
    *
    * 变量：file - 导入文件
    * 变量：user - 用户信息
    *
    * 方法描述:
    *     导入记录还款报表-bms_statement_repayment
    ******************************************************************/
    @Override
    public void importData( File file,  CIPRuntimeOperator user){

		List<BMS_statement_repaymentPO> pos=new ArrayList<BMS_statement_repaymentPO>();
    	
    	ExcelReader excelReader=new ExcelReader(file);
        try {
			excelReader.openFile();//打开文件
			BMS_statement_repaymentPO po;
			List<Object[]> listResult=excelReader.getAllRow();//读取Excel的数据
			Object[] array;
			int size = listResult.size();
			Field field;
			Map<String,String> titles = BMS_statement_repaymentConstant.getExcelTitle();
			int j = 0;
			Set<String> columns;
	        String typeName;
	        for(int i=0; listResult!=null && i<size; i++){
	        	//数据转换,这是要按具体的数据来转换的.....
	        	array = listResult.get(i);
	        	po = new BMS_statement_repaymentPO();

	        	columns = titles.keySet();
	        	j=0;
	        	for(String column:columns){
	        		if(j >= array.length)
	        			break;
	        		field = po.getClass().getDeclaredField(column);
	        		field.setAccessible(true);
	        		typeName = field.getType().getName();
	        		if(typeName.startsWith("int") || typeName.equalsIgnoreCase("integer")){
	        			field.set(po, Integer.parseInt((String)array[j++]));
	        		}
	        		else if(typeName.equalsIgnoreCase("Date")){
	        			field.set(po, java.sql.Date.valueOf((String)array[j++]));
	        		}
	        		else if(typeName.equalsIgnoreCase("Double")){
	        			field.set(po, Double.parseDouble((String)array[j++]));
	        		}
	        		else {
	        			field.set(po, array[j++]);
	        		}
	        	}
	        	  		
	        	pos.add(po);
	        }
	        dataDao.addBatch(pos);	        	        
		} catch (Exception e) {
			throw new CIPServiceException(new CIPErrorCode(999999,"亲,不好意思,文件导入解析出错了!"));
		} finally{
			try {
				excelReader.closeFile();//关闭文件(一定要确保文件的关闭，否则出错，在文件删除前)
			} catch (Exception e) {}
			file.delete();//最后上传的文件要删除
		}

    }

    /******************************************************************
    * 方法：searchData - 查询
    *
    * 变量：page - 分页信息
    * 变量：conditions - 查询条件
    * 变量：user - 用户信息
    *
    * 方法描述:
    *     查询记录还款报表-bms_statement_repayment
    ******************************************************************/
    @Override
    public List<BMS_statement_repaymentData> searchData( CIPPageInfo page, CIPReqCondition[] conditions,  CIPRuntimeOperator user){

        return super.searchData(page,conditions,user);

    }

    /******************************************************************
    * 方法：updateData - 修改
    *
    * 变量：key - 修改Key
    * 变量：fields - 修改字段
    * 变量：user - 用户信息
    *
    * 方法描述:
    *     修改记录还款报表-bms_statement_repayment
    ******************************************************************/
    @Override
    public void updateData( BMS_statement_repaymentKey key,  Map<String,Object> fields,  CIPRuntimeOperator user){

        super.updateData(key,fields,user);

    }

    /******************************************************************
    * 方法：updateFullData - 全量修改
    *
    * 变量：vo - 修改VO
    * 变量：user - 用户信息
    *
    * 方法描述:
    *     全量修改记录还款报表-bms_statement_repayment
    ******************************************************************/
    @Override
    public void updateFullData( BMS_statement_repayment_updateVO vo,  CIPRuntimeOperator user){

        super.updateFullData(vo,user);

    }

}

