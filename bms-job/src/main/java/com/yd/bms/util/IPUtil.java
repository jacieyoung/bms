/**
 * @author wangpeng
 * @create 2018-06-26 15:55
 **/
package com.yd.bms.util;

import com.yd.common.exception.CIPRuntimeException;
import com.yd.common.runtime.CIPErrorCode;
import com.yd.common.utils.StringUtils;
import org.apache.cxf.message.Message;
import org.apache.cxf.phase.PhaseInterceptorChain;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;
import java.util.Iterator;

public class IPUtil {
    private static final Logger logger = LoggerFactory.getLogger(IPUtil.class);
    private static final String LOOP_BACK = "127.0.0.1";
    private static String firstNoLoopbackAddress = null;
    private static String firstNoLoopbackIPV4Address = null;
    private static String firstNoLoopbackIPV6Address = null;
    private static Collection<InetAddress> allHostIPV4Address = null;
    private static Collection<InetAddress> allHostIPV6Address = null;
    private static Collection<InetAddress> allHostAddress = null;
    private static String macAddress = null;
    private static final String WL_PROXY_CLIENT_IP = "WL-Proxy-Client-IP";
    private static final String PROXY_CLIENT_IP = "Proxy-Client-IP";
    private static final String X_FORWARDED_FOR = "x-forwarded-for";
    private static final String UNKNOWN = "unknown";

    public IPUtil() {
    }

    public static long ip2Long(String ip) {
        if (!isIP(ip)) {
            return 0L;
        } else {
            long iplong = 0L;
            String[] segs = StringUtils.split(ip, ".");
            for (int i = 0; i < segs.length; ++i) {
                long seg = Long.parseLong(segs[i]);
                iplong += seg << (3 - i) * 8;
            }

            return iplong;
        }
    }

    public static String long2IP(long ipLong) {
        StringBuffer ip = new StringBuffer((ipLong >> 24) + ".");
        ip.append(((ipLong & 16711680L) >> 16) + ".");
        ip.append(((ipLong & 65280L) >> 8) + ".");
        ip.append(String.valueOf(ipLong & 255L));
        return ip.toString();
    }

    public static boolean isIP(String str) {
        if (str == null) {
            return false;
        } else {
            String[] tokens = StringUtils.split(str, ".");
            if (tokens.length != 4) {
                return false;
            } else {
                for (int i = 0; i < tokens.length; ++i) {
                    if (Integer.parseInt(tokens[i]) > 255 || Integer.parseInt(tokens[i]) < 0) {
                        return false;
                    }
                }

                return true;
            }
        }
    }

    public static Collection<InetAddress> getAllHostAddress() {
        if (allHostAddress == null) {
            try {
                Enumeration<NetworkInterface> networkInterfaces = NetworkInterface.getNetworkInterfaces();
                ArrayList addresses = new ArrayList();

                while (networkInterfaces.hasMoreElements()) {
                    NetworkInterface networkInterface = (NetworkInterface) networkInterfaces.nextElement();
                    Enumeration inetAddresses = networkInterface.getInetAddresses();

                    while (inetAddresses.hasMoreElements()) {
                        InetAddress inetAddress = (InetAddress) inetAddresses.nextElement();
                        addresses.add(inetAddress);
                    }
                }

                allHostAddress = addresses;
            } catch (SocketException var5) {
                logger.error("获取ip地址失败", var5);
                throw new RuntimeException(var5.getMessage(), var5);
            }
        }

        return allHostAddress;
    }

    public static Collection<InetAddress> getAllHostIPV4Address() {
        if (allHostIPV4Address == null) {
            try {
                Enumeration<NetworkInterface> networkInterfaces = NetworkInterface.getNetworkInterfaces();
                ArrayList addresses = new ArrayList();

                while (networkInterfaces.hasMoreElements()) {
                    NetworkInterface networkInterface = (NetworkInterface) networkInterfaces.nextElement();
                    Enumeration inetAddresses = networkInterface.getInetAddresses();

                    while (inetAddresses.hasMoreElements()) {
                        InetAddress inetAddress = (InetAddress) inetAddresses.nextElement();
                        if (inetAddress instanceof Inet4Address) {
                            addresses.add(inetAddress);
                        }
                    }
                }

                allHostIPV4Address = addresses;
            } catch (SocketException var5) {
                logger.error("获取ip地址失败", var5);
                throw new RuntimeException(var5.getMessage(), var5);
            }
        }

        return allHostIPV4Address;
    }

    public static Collection<InetAddress> getAllHostIPV6Address() {
        if (allHostIPV6Address == null) {
            try {
                Enumeration<NetworkInterface> networkInterfaces = NetworkInterface.getNetworkInterfaces();
                ArrayList addresses = new ArrayList();

                while (networkInterfaces.hasMoreElements()) {
                    NetworkInterface networkInterface = (NetworkInterface) networkInterfaces.nextElement();
                    Enumeration inetAddresses = networkInterface.getInetAddresses();

                    while (inetAddresses.hasMoreElements()) {
                        InetAddress inetAddress = (InetAddress) inetAddresses.nextElement();
                        if (inetAddress instanceof Inet6Address) {
                            addresses.add(inetAddress);
                        }
                    }
                }

                allHostIPV6Address = addresses;
            } catch (SocketException var5) {
                logger.error("获取ip地址失败", var5);
                throw new RuntimeException(var5.getMessage(), var5);
            }
        }

        return allHostIPV6Address;
    }

    public static Collection<String> getAllNoLoopbackAddresses() {
        Collection<String> noLoopbackAddresses = new ArrayList();
        Collection<InetAddress> allInetAddresses = getAllHostAddress();
        Iterator i$ = allInetAddresses.iterator();

        while (i$.hasNext()) {
            InetAddress address = (InetAddress) i$.next();
            if (!address.isLoopbackAddress()) {
                noLoopbackAddresses.add(address.getHostAddress());
            }
        }

        return noLoopbackAddresses;
    }

    public static Collection<String> getAllNoLoopbackIPV4Addresses() {
        Collection<String> noLoopbackAddresses = new ArrayList();
        Collection<InetAddress> allInetAddresses = getAllHostIPV4Address();
        Iterator i$ = allInetAddresses.iterator();

        while (i$.hasNext()) {
            InetAddress address = (InetAddress) i$.next();
            if (!address.isLoopbackAddress()) {
                noLoopbackAddresses.add(address.getHostAddress());
            }
        }

        return noLoopbackAddresses;
    }

    public static Collection<String> getAllNoLoopbackIPV6Addresses() {
        Collection<String> noLoopbackAddresses = new ArrayList();
        Collection<InetAddress> allInetAddresses = getAllHostIPV6Address();
        Iterator i$ = allInetAddresses.iterator();

        while (i$.hasNext()) {
            InetAddress address = (InetAddress) i$.next();
            if (!address.isLoopbackAddress()) {
                noLoopbackAddresses.add(address.getHostAddress());
            }
        }

        return noLoopbackAddresses;
    }

    public static String getFirstNoLoopbackAddress() {
        if (firstNoLoopbackAddress != null) {
            return firstNoLoopbackAddress;
        } else {
            Collection allNoLoopbackAddresses = null;

            try {
                allNoLoopbackAddresses = getAllNoLoopbackAddresses();
            } catch (Exception var2) {
                logger.error("获取ip失败", var2);
                return "127.0.0.1";
            }

            return allNoLoopbackAddresses.isEmpty() ? "127.0.0.1" : (firstNoLoopbackAddress = (String) allNoLoopbackAddresses.iterator().next());
        }
    }

    public static String getFirstNoLoopbackIPV4Address() {
        if (firstNoLoopbackIPV4Address != null) {
            return firstNoLoopbackIPV4Address;
        } else {
            Collection allNoLoopbackAddresses = null;

            try {
                allNoLoopbackAddresses = getAllNoLoopbackIPV4Addresses();
            } catch (Exception var2) {
                logger.error("获取ip失败", var2);
                return "127.0.0.1";
            }

            return allNoLoopbackAddresses.isEmpty() ? "127.0.0.1" : (firstNoLoopbackIPV4Address = (String) allNoLoopbackAddresses.iterator().next());
        }
    }

    public static String getFirstNoLoopbackIPV6Address() {
        if (firstNoLoopbackIPV6Address != null) {
            return firstNoLoopbackIPV6Address;
        } else {
            Collection allNoLoopbackAddresses = null;

            try {
                allNoLoopbackAddresses = getAllNoLoopbackIPV6Addresses();
            } catch (Exception var2) {
                logger.error("获取ip失败", var2);
                return "127.0.0.1";
            }

            return allNoLoopbackAddresses.isEmpty() ? "127.0.0.1" : (firstNoLoopbackIPV6Address = (String) allNoLoopbackAddresses.iterator().next());
        }
    }

    public static String getComputerName() {
        return (String) System.getenv().get("COMPUTERNAME");
    }

    public static String getMACAddress() throws Exception {
        if (macAddress == null) {
            macAddress = getMacByNetworkInterface();
            if (macAddress == null) {
                macAddress = getMacByProcess();
            }
        }

        return macAddress;
    }

    public static String getHostName() {
        try {
            return InetAddress.getLocalHost().getHostName();
        } catch (UnknownHostException var1) {
            throw new CIPRuntimeException(CIPErrorCode.ERROR_TECHNICAL_ERROR);
        }
    }

    public static String getWebServiceClientIpAndPort() {
        Message message = PhaseInterceptorChain.getCurrentMessage();
        if (message == null) {
            return "";
        } else {
            HttpServletRequest httprequest = (HttpServletRequest) message.get("HTTP.REQUEST");
            return getIpAddr(httprequest) + ":" + httprequest.getRemotePort();
        }
    }

    public static String getWebServiceClientIp() {
        Message message = PhaseInterceptorChain.getCurrentMessage();
        if (message == null) {
            return "";
        } else {
            HttpServletRequest httprequest = (HttpServletRequest) message.get("HTTP.REQUEST");
            return getIpAddr(httprequest);
        }
    }

    public static String getIpAddr(HttpServletRequest request) {
        if (request == null) {
            return "unknown";
        } else {
            String ip = request.getHeader("x-forwarded-for");
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("Proxy-Client-IP");
            }

            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("WL-Proxy-Client-IP");
            }

            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getRemoteAddr();
            }

            return ip;
        }
    }

    public static String getMACAddress(InetAddress ia) {
        Object var1 = null;

        byte[] mac;
        try {
            mac = NetworkInterface.getByInetAddress(ia).getHardwareAddress();
        } catch (SocketException var5) {
            throw new CIPRuntimeException(CIPErrorCode.ERROR_TECHNICAL_ERROR);
        }

        StringBuffer sb = new StringBuffer();

        for (int i = 0; i < mac.length; ++i) {
            if (i != 0) {
                sb.append("-");
            }

            String s = Integer.toHexString(mac[i] & 255);
            sb.append(s.length() == 1 ? 0 + s : s);
        }

        return sb.toString().toUpperCase();
    }

    private static String formatMac(byte[] mac) {
        StringBuffer sb = new StringBuffer();

        for (int i = 0; i < mac.length; ++i) {
            if (i != 0) {
                sb.append("-");
            }

            String s = Integer.toHexString(mac[i] & 255);
            sb.append(s.length() == 1 ? 0 + s : s);
        }

        return sb.toString().toUpperCase();
    }

    private static String getMacByNetworkInterface() {
        String out = null;

        try {
            Enumeration<NetworkInterface> ifs = NetworkInterface.getNetworkInterfaces();
            if (ifs != null) {
                while (ifs.hasMoreElements()) {
                    NetworkInterface iface = (NetworkInterface) ifs.nextElement();
                    byte[] hardware = iface.getHardwareAddress();
                    if (hardware != null && hardware.length == 6 && hardware[1] != -1) {
                        out = formatMac(hardware);
                        break;
                    }
                }
            }
        } catch (SocketException var4) {
            ;
        }

        return out;
    }

    private static String getMacByProcess() {
        String macA = null;
        Process p = null;
        BufferedReader in = null;

        try {
            String osname = System.getProperty("os.name", "");
            String osver = System.getProperty("os.version", "");
            String hostName;
            if (osname.startsWith("Windows")) {
                p = Runtime.getRuntime().exec(new String[]{"ipconfig", "/all"}, (String[]) null);
            } else if (!osname.startsWith("Solaris") && !osname.startsWith("SunOS")) {
                if ((new File("/usr/sbin/lanscan")).exists()) {
                    p = Runtime.getRuntime().exec(new String[]{"/usr/sbin/lanscan"}, (String[]) null);
                } else if ((new File("/sbin/ifconfig")).exists()) {
                    p = Runtime.getRuntime().exec(new String[]{"/sbin/ifconfig", "-a"}, (String[]) null);
                }
            } else if (osver.startsWith("5.11")) {
                p = Runtime.getRuntime().exec(new String[]{"dladm", "show-phys", "-m"}, (String[]) null);
            } else {
                hostName = getFirstLineOfCommand("uname", "-n");
                if (hostName != null) {
                    p = Runtime.getRuntime().exec(new String[]{"/usr/sbin/arp", hostName}, (String[]) null);
                }
            }

            if (p != null) {
                in = new BufferedReader(new InputStreamReader(p.getInputStream()), 128);
                hostName = null;

                while ((hostName = in.readLine()) != null) {
                    macA = MACAddressParser.parse(hostName);
                    if (macA != null && Hex.parseShort(macA) != 255) {
                        break;
                    }
                }
            }
        } catch (SecurityException var26) {
            ;
        } catch (IOException var27) {
            ;
        } finally {
            if (p != null) {
                if (in != null) {
                    try {
                        in.close();
                    } catch (IOException var25) {
                        ;
                    }
                }

                try {
                    p.getErrorStream().close();
                } catch (IOException var24) {
                    ;
                }

                try {
                    p.getOutputStream().close();
                } catch (IOException var23) {
                    ;
                }

                p.destroy();
            }

        }

        if (macA != null) {
            macA = macA.toUpperCase();
        }

        return macA;
    }

    static String getFirstLineOfCommand(String... commands) throws IOException {
        Process p = null;
        BufferedReader reader = null;

        String var3;
        try {
            p = Runtime.getRuntime().exec(commands);
            reader = new BufferedReader(new InputStreamReader(p.getInputStream()), 128);
            var3 = reader.readLine();
        } finally {
            if (p != null) {
                if (reader != null) {
                    try {
                        reader.close();
                    } catch (IOException var16) {
                        ;
                    }
                }

                try {
                    p.getErrorStream().close();
                } catch (IOException var15) {
                    ;
                }

                try {
                    p.getOutputStream().close();
                } catch (IOException var14) {
                    ;
                }

                p.destroy();
            }

        }

        return var3;
    }
}
