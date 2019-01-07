package com.yd.bms.org.service.local;

import com.yd.bms.org.constant.BMS_org_relationConstant;
import com.yd.bms.org.pojo.data.BMS_org_relationData;
import com.yd.bms.org.pojo.key.BMS_org_relationKey;
import com.yd.bms.org.pojo.po.BMS_org_relationPO;
import com.yd.bms.org.pojo.vo.BMS_org_relation_addVO;
import com.yd.bms.org.pojo.vo.BMS_org_relation_queryVO;
import com.yd.bms.org.pojo.vo.BMS_org_relation_updateVO;
import com.yd.bms.org.service.impl.BMS_org_relationServiceImpl;
import com.yd.common.data.CIPPageInfo;
import com.yd.common.data.CIPReqCondition;
import com.yd.common.exception.CIPServiceException;
import com.yd.common.runtime.CIPErrorCode;
import com.yd.common.runtime.CIPRuntimeConfigure;
import com.yd.common.runtime.CIPRuntimeOperator;
import com.yd.common.utils.DateUtils;
import com.yd.common.utils.ExcelReader;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.lang.reflect.Field;
import java.util.*;

@Service(value = "BMS_org_relationServiceImpl")
public class LBMS_org_relationServiceImpl extends BMS_org_relationServiceImpl {


    /******************************************************************
     * 方法：addData - 新增
     *
     * 变量：vo - 新增VO
     * 变量：user - 用户信息
     *
     * 方法描述:
     *     新增记录机构关系-bms_org_relation
     ******************************************************************/
    @Override
    public void addData(BMS_org_relation_addVO vo, CIPRuntimeOperator user) {

        super.addData(vo, user);

    }

    /******************************************************************
     * 方法：deleteData - 删除
     *
     * 变量：key - 删除Key
     * 变量：user - 用户信息
     *
     * 方法描述:
     *     删除记录机构关系-bms_org_relation
     ******************************************************************/
    @Override
    public void deleteData(BMS_org_relationKey key, CIPRuntimeOperator user) {

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
     *     导出记录机构关系-bms_org_relation
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
            fileName = exportPath + File.separator + "BMS_org_relation"
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
                fileName = "BMS_org_relation" + DateUtils.getDate(new Date());
                String cmd = null;
                String exportFile = null;

                String dbUsername = CIPRuntimeConfigure.additionalInfos.getProperty("export.db.user");
                String dbPwd = CIPRuntimeConfigure.additionalInfos.getProperty("export.db.pwd");
                String dbHost = CIPRuntimeConfigure.additionalInfos.getProperty("export.db.host");

                if (querySql != null && fileName != null) {
                    exportFile = exportPath + File.separator + fileName + ".xls";

                    File f = new File(exportFile);
                    if (f.exists())//如果文件已经存在，则删除
                        f.delete();

                    cmd = "mysqluldr user=" + dbUsername + "/" + dbPwd + "@" + dbHost
                            + " charset=utf8 text=\"csv\" head=no safe=Yes file=\"" + exportFile + "\" " +
                            "query=\"" + querySql + "\"";
                }

                // 执行Linux命令操作
                String[] cmdA = {"/bin/sh", "-c", cmd};
                Process process = Runtime.getRuntime().exec(cmdA);
                LineNumberReader br = new LineNumberReader(new InputStreamReader(
                        process.getInputStream()));
                StringBuffer sb = new StringBuffer();
                String line;
                while ((line = br.readLine()) != null) {
                    sb.append(line).append("\n");
                }
                br.close();

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
     *     查看记录机构关系-bms_org_relation
     ******************************************************************/
    @Override
    public BMS_org_relation_queryVO getData(BMS_org_relationKey key, CIPRuntimeOperator user) {

        return super.getData(key, user);

    }

    /******************************************************************
     * 方法：importData - 导入
     *
     * 变量：file - 导入文件
     * 变量：user - 用户信息
     *
     * 方法描述:
     *     导入记录机构关系-bms_org_relation
     ******************************************************************/
    @Override
    public void importData(File file, CIPRuntimeOperator user) {

        List<BMS_org_relationPO> pos = new ArrayList<BMS_org_relationPO>();

        ExcelReader excelReader = new ExcelReader(file);
        try {
            excelReader.openFile();//打开文件
            BMS_org_relationPO po;
            List<Object[]> listResult = excelReader.getAllRow();//读取Excel的数据
            Object[] array;
            int size = listResult.size();
            Field field;
            Map<String, String> titles = BMS_org_relationConstant.getExcelTitle();
            int j = 0;
            Set<String> columns;
            String typeName;
            for (int i = 0; listResult != null && i < size; i++) {
                //数据转换,这是要按具体的数据来转换的.....
                array = listResult.get(i);
                po = new BMS_org_relationPO();

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
     *     查询记录机构关系-bms_org_relation
     ******************************************************************/
    @Override
    public List<BMS_org_relationData> searchData(CIPPageInfo page, CIPReqCondition[] conditions, CIPRuntimeOperator user) {

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
     *     修改记录机构关系-bms_org_relation
     ******************************************************************/
    @Override
    public void updateData(BMS_org_relationKey key, Map<String, Object> fields, CIPRuntimeOperator user) {

        super.updateData(key, fields, user);

    }

    /******************************************************************
     * 方法：updateFullData - 全量修改
     *
     * 变量：vo - 修改VO
     * 变量：user - 用户信息
     *
     * 方法描述:
     *     修改记录机构关系-bms_org_relation
     ******************************************************************/
    @Override
    public void updateFullData(BMS_org_relation_updateVO vo, CIPRuntimeOperator user) {

        super.updateFullData(vo, user);

    }

}

