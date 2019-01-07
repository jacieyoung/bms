/**
 * @author wangpeng
 * @create 2018-06-26 19:11
 **/
package com.yd.bms.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtils extends com.yd.common.utils.DateUtils {
    public static final String simple = "yyyy-MM-dd HH:mm:ss";
    public static final String dtSimple = "yyyy-MM-dd";
    public static final String dtSimpleYm = "yyyy-MM";
    public static final String dtSimpleSlash = "yyyy/MM/dd";
    public static final String dtSimpleChinese = "yyyy年MM月dd日";
    public static final String week = "EEEE";
    public static final String dtShort = "yyyyMMdd";
    public static final String dtLong = "yyyyMMddHHmmss";
    public static final String hmsFormat = "HH:mm:ss";
    public static final String hmsFormat1 = "HHmmss";
    public static final String simpleFormat = "yyyy-MM-dd HH:mm";
    public static final long MILL_SECOND_IN_DAY = 86400000L;
    public static Date MAX_DAY = null;

    public static final Date now() {
        return new Date();
    }

    public static final Date calculateByDay(Date now, int unit) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(now);
        calendar.add(Calendar.DAY_OF_YEAR, unit);
        return calendar.getTime();
    }

    public static final Date calculateByMonth(Date now, int unit) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(now);
        calendar.add(Calendar.MONTH, unit);
        return calendar.getTime();
    }

    public static final Date string2DateTimeByAutoZero(String stringDate) throws ParseException {
        if (stringDate == null) {
            return null;
        } else {
            if (stringDate.length() == 11) {
                stringDate = stringDate + "00:00:00";
            } else if (stringDate.length() == 13) {
                stringDate = stringDate + ":00:00";
            } else if (stringDate.length() == 16) {
                stringDate = stringDate + ":00";
            } else if (stringDate.length() == 10) {
                stringDate = stringDate + " 00:00:00";
            }

            return getFormat("yyyy-MM-dd HH:mm:ss").parse(stringDate);
        }
    }

    public static final Date string2DateTimeBy23(String stringDate) throws ParseException {
        if (stringDate == null) {
            return null;
        } else {
            if (stringDate.length() == 11) {
                stringDate = stringDate + "23:59:59";
            } else if (stringDate.length() == 13) {
                stringDate = stringDate + ":59:59";
            } else if (stringDate.length() == 16) {
                stringDate = stringDate + ":59";
            } else if (stringDate.length() == 10) {
                stringDate = stringDate + " 23:59:59";
            }

            return getFormat("yyyy-MM-dd HH:mm:ss").parse(stringDate);
        }
    }

    public static final DateFormat getFormat(String format) {
        return new SimpleDateFormat(format);
    }

}
