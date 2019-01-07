/**
 * @author wangpeng
 * @create 2018-06-26 15:58
 **/
package com.yd.bms.util;

public class MACAddressParser {
    private MACAddressParser() {
    }

    static String parse(String in) {
        String out = in;
        int hexStart = in.indexOf("0x");
        int octets=0;
        if (hexStart != -1 && in.indexOf("ETHER") != -1) {
            octets = in.indexOf(32, hexStart);
            if (octets > hexStart + 2) {
                out = in.substring(hexStart, octets);
            }
        } else {
            if (in.indexOf(58) > -1) {
                out = in.replace(':', '-');
            }

            int lastIndex = out.lastIndexOf(45);
            if (lastIndex > out.length() - 2) {
                out = null;
            } else {
                int end = Math.min(out.length(), lastIndex + 3);
                octets = octets + 1;
                int old = lastIndex;

                label50:
                while(true) {
                    do {
                        if (octets == 5 || lastIndex == -1 || lastIndex <= 1) {
                            if (octets == 5 && lastIndex > 1) {
                                out = out.substring(lastIndex - 2, end).trim();
                            } else {
                                out = null;
                            }
                            break label50;
                        }

                        --lastIndex;
                        lastIndex = out.lastIndexOf(45, lastIndex);
                    } while(old - lastIndex != 3 && old - lastIndex != 2);

                    ++octets;
                    old = lastIndex;
                }
            }
        }

        if (out != null && out.startsWith("0x")) {
            out = out.substring(2);
        }

        return out;
    }
}
