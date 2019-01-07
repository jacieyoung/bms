package com.yd.bms.statement.service.local;

import com.yd.bms.statement.constant.BMS_statement_borrowingConstant;
import com.yd.bms.statement.pojo.data.BMS_statement_borrowingData;
import com.yd.bms.statement.pojo.key.BMS_statement_borrowingKey;
import com.yd.bms.statement.pojo.po.BMS_statement_borrowingPO;
import com.yd.bms.statement.pojo.po.BMS_statement_repaymentPO;
import com.yd.bms.statement.pojo.po.BMS_statement_repayment_logPO;
import com.yd.bms.statement.pojo.vo.BMS_statement_borrowing_addVO;
import com.yd.bms.statement.pojo.vo.BMS_statement_borrowing_queryVO;
import com.yd.bms.statement.pojo.vo.BMS_statement_borrowing_updateVO;
import com.yd.bms.statement.service.impl.BMS_statement_borrowingServiceImpl;
import com.yd.common.data.CIPPageInfo;
import com.yd.common.data.CIPReqCondition;
import com.yd.common.exception.CIPServiceException;
import com.yd.common.runtime.CIPErrorCode;
import com.yd.common.runtime.CIPRuntimeConfigure;
import com.yd.common.runtime.CIPRuntimeOperator;
import com.yd.common.utils.DateUtils;
import com.yd.common.utils.ExcelReader;
import com.yd.common.utils.SerialNoUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.*;
import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.*;

@Service(value = "BMS_statement_borrowingServiceImpl")
public class LBMS_statement_borrowingServiceImpl extends BMS_statement_borrowingServiceImpl {


    /******************************************************************
     * 方法：addData - 新增
     *
     * 变量：vo - 新增VO
     * 变量：user - 用户信息
     *
     * 方法描述:
     *     新增记录借支管理报表-bms_statement_borrowing
     ******************************************************************/
    @Override
    public void addData(BMS_statement_borrowing_addVO vo, CIPRuntimeOperator user) {

        super.addData(vo, user);

    }

    /******************************************************************
     * 方法：deleteData - 删除
     *
     * 变量：key - 删除Key
     * 变量：user - 用户信息
     *
     * 方法描述:
     *     删除记录借支管理报表-bms_statement_borrowing
     ******************************************************************/
    @Override
    public void deleteData(BMS_statement_borrowingKey key, CIPRuntimeOperator user) {

        super.deleteData(key, user);

    }

    /******************************************************************
     * 方法：exportData - 导出
     *
     * 变量：exportPath - 导出文件路径
     * 变量：conditions - 查询条件
     * 变量：user - 用户信息
     *
     * 方法描述:
     *     导出记录借支管理报表-bms_statement_borrowing
     ******************************************************************/
    @Override
    public String exportData(String exportPath, CIPReqCondition[] conditions, CIPRuntimeOperator user) {

        String fileName = null;
        Properties prop = System.getProperties();
        String os = prop.getProperty("os.name");// 判断是哪个操作系统
        if (os.startsWith("win") || os.startsWith("Win")) {
            // 1. 提取命令文件
            String dosPath = this.getClass().getClassLoader().getResource("java2dos.bat").getPath();
            String exportShell = dosPath.substring(dosPath.indexOf("/") + 1);//去掉第一个“/”
            // 2. 生成文件名
            fileName = exportPath + File.separator + "BMS_statement_borrowing"
                    + DateUtils.getDate(new Date()) + ".xls";

            File f = new File(fileName);
            if (f.exists())//如果文件已经存在，则删除
                f.delete();

            // 3. 提取执行sql
            String sqlStr = dataDao.export(conditions);
            StringBuffer sql = new StringBuffer();
            sql.append("\" select * into outfile '").append(fileName.replace("\\", "/")).append("' CHARACTER SET gbk").append(" from (").append(sqlStr).append(") f\"");

            // 4. 拼接shell指定命令和变量
            String[] cmdarray = new String[]{exportShell, fileName, sql.toString()};

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
                throw new CIPServiceException(new CIPErrorCode(999999, "亲,不好意思,文件导出出错了!" + e.getMessage()));
            }
        } else {
            try {
                String querySql = dataDao.export(conditions);
                fileName = "BMS_statement_borrowing" + DateUtils.getDate(new Date());
                String cmd = null;
                String exportFile = null;

                String dbUsername = CIPRuntimeConfigure.additionalInfos.getProperty("export.db.user");
                String dbPwd = CIPRuntimeConfigure.additionalInfos.getProperty("export.db.pwd");
                String dbHost = CIPRuntimeConfigure.additionalInfos.getProperty("export.db.host");
                String port = CIPRuntimeConfigure.additionalInfos.getProperty("export.db.port");

                if (querySql != null && fileName != null) {
                    exportFile = exportPath + File.separator + fileName + ".csv";

                    File f = new File(exportFile);
                    if (f.exists())//如果文件已经存在，则删除
                        f.delete();

//                    cmd = "mysqluldr user=" + dbUsername + "/" + dbPwd + "@" + dbHost
//                            + " charset=utf8 text=\"csv\" head=no safe=Yes file=\"" + exportFile + "\" " +
//                            "query=\"" + querySql + "\"";
                    cmd = "mysql -h " + dbHost + " -P" + port + " -u" + dbUsername + " -p" + dbPwd + " -ss -e \"" + querySql + "\" | sed 's/\\t/\",\"/g;s/^/\"/;s/$/\"/;s/\\n//g'  |sed  's/\"0[0-9]\\{1,\\}/=&/g ; s/\"[^0][0-9]\\{11,\\}/=&/g' "
                            + " |sed  's/NULL/''/g ;s/,/，/g ;s/\"，/\",/g ;' >" + exportFile;
                }

                // 执行Linux命令操作
                System.out.println(cmd);
                String[] cmdA = {"/bin/sh", "-cv", cmd};
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
                throw new CIPServiceException(new CIPErrorCode(999999, "亲,不好意思,文件导出出错了!" + e.getMessage()));
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
     *     查看记录借支管理报表-bms_statement_borrowing
     ******************************************************************/
    @Override
    public BMS_statement_borrowing_queryVO getData(BMS_statement_borrowingKey key, CIPRuntimeOperator user) {

        return super.getData(key, user);

    }

    /******************************************************************
     * 方法：importData - 导入
     *
     * 变量：file - 导入文件
     * 变量：user - 用户信息
     *
     * 方法描述:
     *     导入记录借支管理报表-bms_statement_borrowing
     ******************************************************************/
    @Override
    public void importData(File file, CIPRuntimeOperator user) {

        List<BMS_statement_borrowingPO> pos = new ArrayList<BMS_statement_borrowingPO>();

        ExcelReader excelReader = new ExcelReader(file);
        try {
            excelReader.openFile();//打开文件
            BMS_statement_borrowingPO po;
            List<Object[]> listResult = excelReader.getAllRow();//读取Excel的数据
            Object[] array;
            int size = listResult.size();
            Field field;
            Map<String, String> titles = BMS_statement_borrowingConstant.getExcelTitle();
            int j = 0;
            Set<String> columns;
            String typeName;
            for (int i = 0; listResult != null && i < size; i++) {
                //数据转换,这是要按具体的数据来转换的.....
                array = listResult.get(i);
                po = new BMS_statement_borrowingPO();

                columns = titles.keySet();
                j = 0;
                for (String column : columns) {
                    if (j >= array.length)
                        break;
                    field = po.getClass().getDeclaredField(column);
                    field.setAccessible(true);
                    typeName = field.getType().getName();
                    if (typeName.startsWith("int") || typeName.equalsIgnoreCase("integer")) {
                        field.set(po, Integer.parseInt((String) array[j++]));
                    } else if (typeName.equalsIgnoreCase("Date")) {
                        field.set(po, java.sql.Date.valueOf((String) array[j++]));
                    } else if (typeName.equalsIgnoreCase("Double")) {
                        field.set(po, Double.parseDouble((String) array[j++]));
                    } else {
                        field.set(po, array[j++]);
                    }
                }

                pos.add(po);
            }
            dataDao.addBatch(pos);
        } catch (Exception e) {
            throw new CIPServiceException(new CIPErrorCode(999999, "亲,不好意思,文件导入解析出错了!"));
        } finally {
            try {
                excelReader.closeFile();//关闭文件(一定要确保文件的关闭，否则出错，在文件删除前)
            } catch (Exception e) {
            }
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
     *     查询记录借支管理报表-bms_statement_borrowing
     ******************************************************************/
    @Override
    public List<BMS_statement_borrowingData> searchData(CIPPageInfo page, CIPReqCondition[] conditions, CIPRuntimeOperator user) {

        return super.searchData(page, conditions, user);

    }

    /******************************************************************
     * 方法：updateData - 修改
     *
     * 变量：key - 修改Key
     * 变量：fields - 修改字段
     * 变量：user - 用户信息
     *
     * 方法描述:
     *     修改记录借支管理报表-bms_statement_borrowing
     ******************************************************************/
    @Override
    public void updateData(BMS_statement_borrowingKey key, Map<String, Object> fields, CIPRuntimeOperator user) {

        super.updateData(key, fields, user);

    }

    /******************************************************************
     * 方法：updateFullData - 全量修改
     *
     * 变量：vo - 修改VO
     * 变量：user - 用户信息
     *
     * 方法描述:
     *     全量修改记录借支管理报表-bms_statement_borrowing
     ******************************************************************/
    @Override
    public void updateFullData(BMS_statement_borrowing_updateVO vo, CIPRuntimeOperator user) {

        super.updateFullData(vo, user);

    }

    /**
     * 1 update
     * 2 add repay
     *
     * @param key
     * @param fields
     * @param operateSubject
     */
    @Override
    @Transactional
    public void repayData(BMS_statement_borrowingKey key, Map<String, Object> fields, CIPRuntimeOperator operateSubject) {
        //todo lly 还款借支
        Object[] keys = key.toKeys();
        String payWay = (String) fields.get("hkfs");
        String remark = (String) fields.get("remark");
        Double amount = Double.valueOf((String.valueOf(fields.get("hkje"))));

        BMS_statement_borrowingPO po0 = dataDao.getSingle(keys);
        if (po0 == null) {
            throw new CIPServiceException(CIPErrorCode.ERROR_RECORD_NOT_EXISTS);
        }
        BigDecimal jzje = new BigDecimal(po0.getJzje());//借支金额
        BigDecimal hjke = new BigDecimal(po0.getHkje());//还款金额
        BigDecimal syje = new BigDecimal(po0.getSyje());//剩余金额
        BigDecimal clearAmount = new BigDecimal(amount);//核销金额

        if(clearAmount.doubleValue()<=0){
            throw new CIPServiceException(new CIPErrorCode(99999, "核销金额不能小于0!"));
        }
        // 20180919  lly  还款金额还款金额大于0 可以大于借支
//        if(clearAmount.compareTo(jzje)>0){
//            throw new CIPServiceException(new CIPErrorCode(99999, "核销金额不能大于借支金额!"));
//        }
//        if(clearAmount.compareTo(syje)>0){
//            throw new CIPServiceException(new CIPErrorCode(99999, "核销金额不能大于剩余金额!"));
//        }
//        if(clearAmount.add(hjke).compareTo(jzje)>0){
//            throw new CIPServiceException(new CIPErrorCode(99999, "核销金额+还款金额不能大于借支金额!"));
//        }

        String userId = operateSubject.getSubject_id();
        String userName = operateSubject.getSubject_name();
        String respOrgId = operateSubject.getSubject_org();
        String respOrgName = operateSubject.getSubject_org_name();
        String serialNo = SerialNoUtils.getTimeSerialNoStr();
        Timestamp currentTime = new Timestamp(System.currentTimeMillis());

        java.sql.Date clearDate = new java.sql.Date(System.currentTimeMillis());

        po0.setHkje(new BigDecimal(po0.getHkje()).add(clearAmount).doubleValue());//更新后的还款金额
        po0.setSyje(new BigDecimal(po0.getSyje()).subtract(clearAmount).doubleValue());//更新后的剩余金额
        po0.setUpdate_time(currentTime);
        po0.setOp_user_id(userId);
        po0.setOp_user_name(userName);
        po0.setRemark(po0.getRemark()+","+remark);
        //todo 付款方式是否更新

        dataDao.update(po0);

        //新增还款记录
        BMS_statement_repayment_logPO repayLogPo = new BMS_statement_repayment_logPO();
        repayLogPo.setSerial_no(serialNo);//流水号
        repayLogPo.setLcbh(po0.getLcbh());//流程编号
        repayLogPo.setHkrq(clearDate);//还款日期
        repayLogPo.setRemark(remark);//
        repayLogPo.setHkfs(payWay);//还款方式
        repayLogPo.setHxje(clearAmount.doubleValue());//还款金额
        repayLogPo.setSyje(po0.getSyje());//更新后的剩余金额
        repayLogPo.setHxr(userId);//核销人

        repayLogPo.setHkbm(respOrgId);//还款部门
        repayLogPo.setCreate_time(currentTime);
        repayLogPo.setUpdate_time(currentTime);
        repayLogPo.setCreator(userId);
        repayLogPo.setOp_user_id(userId);
        repayLogPo.setCreator_name(userName);
        repayLogPo.setOp_user_name(userName);

        repayLogDao.add(repayLogPo);
    }
}

