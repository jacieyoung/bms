/**
 * @author wangpeng
 * @create 2018-06-26 14:25
 **/
package com.yd.bms;

import com.yd.bms.util.IPUtil;
import com.yd.common.utils.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Value;

import java.io.IOException;
import java.io.InputStream;
import java.net.InetAddress;
import java.util.Collection;
import java.util.Iterator;
import java.util.Properties;

public abstract class DyJobBase implements InitializingBean, DyProcessJobService {
    protected static boolean isRun = false;
    protected final Logger logger = LoggerFactory.getLogger(getClass());
//    @Value("${dy.task.timer.runIp}")
    private String runIpString;
    private static Properties properties;

    static {
        InputStream in = Thread.currentThread().getContextClassLoader()
                .getResourceAsStream("config_ex.properties");
        properties = new Properties();
        try {
            properties.load(in);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    @Override
    public void changeIsRun(boolean isRun) {
        logger.info("修改定时任务机制,修改后机制为：{}", isRun);
        DyJobBase.isRun = isRun;
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        runIpString = properties.getProperty("dy.task.timer.runIp");
        if (StringUtils.isNotEmpty(runIpString)) {
            String[] notRunIpArray = runIpString.split(";");
            for (int i = 0; i < notRunIpArray.length; i++) {
                if (getHasIpAddress(notRunIpArray[i])) {
                    isRun = true;
                }
            }
        }
    }

    public boolean getHasIpAddress(String strIpAddress) {
        Collection<InetAddress> inetAddresses = IPUtil.getAllHostIPV4Address();
        Iterator<InetAddress> it = inetAddresses.iterator();
        while (it.hasNext()) {
            InetAddress inetAddress = it.next();
            if (strIpAddress.equals(inetAddress.getHostAddress())) {
                return true;
            }
            logger.info("networkInterface:" + inetAddress.getHostName() + ":"
                    + inetAddress.getHostAddress() + ":");
        }
        return false;
    }
}
