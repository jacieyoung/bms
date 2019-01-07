/**
 * @author wangpeng
 * @create 2018-06-26 16:00
 **/
package com.yd.bms.util;

import java.io.IOException;

public class Hex {
    private static final char[] DIGITS = new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};

    private Hex() {
    }

    public static Appendable append(Appendable a, short in) {
        return append(a, (long) in, 4);
    }

    public static Appendable append(Appendable a, short in, int length) {
        return append(a, (long) in, length);
    }

    public static Appendable append(Appendable a, int in) {
        return append(a, (long) in, 8);
    }

    public static Appendable append(Appendable a, int in, int length) {
        return append(a, (long) in, length);
    }

    public static Appendable append(Appendable a, long in) {
        return append(a, in, 16);
    }

    public static Appendable append(Appendable a, long in, int length) {
        try {
            for (int lim = (length << 2) - 4; lim >= 0; lim -= 4) {
                a.append(DIGITS[(byte) ((int) (in >> lim)) & 15]);
            }
        } catch (IOException var5) {
            ;
        }

        return a;
    }

    public static Appendable append(Appendable a, byte[] bytes) {
        try {
            byte[] arr$ = bytes;
            int len$ = bytes.length;

            for (int i$ = 0; i$ < len$; ++i$) {
                byte b = arr$[i$];
                a.append(DIGITS[(byte) ((b & 240) >> 4)]);
                a.append(DIGITS[(byte) (b & 15)]);
            }
        } catch (IOException var6) {
            ;
        }

        return a;
    }

    public static long parseLong(CharSequence s) {
        long out = 0L;
        byte shifts = 0;

        for (int i = 0; i < s.length() && shifts < 16; ++i) {
            char c = s.charAt(i);
            if (c > '/' && c < ':') {
                ++shifts;
                out <<= 4;
                out |= (long) (c - 48);
            } else if (c > '@' && c < 'G') {
                ++shifts;
                out <<= 4;
                out |= (long) (c - 55);
            } else if (c > '`' && c < 'g') {
                ++shifts;
                out <<= 4;
                out |= (long) (c - 87);
            }
        }

        return out;
    }

    public static short parseShort(String s) {
        short out = 0;
        byte shifts = 0;

        for (int i = 0; i < s.length() && shifts < 4; ++i) {
            char c = s.charAt(i);
            if (c > '/' && c < ':') {
                ++shifts;
                out = (short) (out << 4);
                out = (short) (out | c - 48);
            } else if (c > '@' && c < 'G') {
                ++shifts;
                out = (short) (out << 4);
                out = (short) (out | c - 55);
            } else if (c > '`' && c < 'g') {
                ++shifts;
                out = (short) (out << 4);
                out = (short) (out | c - 87);
            }
        }

        return out;
    }
}
