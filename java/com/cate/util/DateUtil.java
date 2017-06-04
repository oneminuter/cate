package com.cate.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 获得当前时间 yyyy-MM-dd HH:mm:ss
 * @version 1.0
 * 调用  DateUtil.getNowTime() ：Sun Jun 04 16:56:26 CST 2017
 * 调用 DateUtil.getTimestamp() : 2017-06-04 16:56:26.0
 */
public class DateUtil {
    
    /**
     * 获得当前时间 yyyy-MM-dd HH:mm:ss
     * 
     * @return Date
     */
    public static Date getNowTime() {
		Calendar c = Calendar.getInstance();
		c.setTimeInMillis(new Date().getTime());
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
		    Date date = dateFormat.parse(dateFormat.format(c.getTime()));
		    return date;
		} catch (ParseException e) {
		    e.printStackTrace();
		    return null;
		}
    }
    /**
     * 获得当前时间
     * @return Timestamp
     */
    public static Timestamp getTimestamp() {
    	return getTimestamp(getNowTime());
    }

    /**
     * 将date类型时间转换成Timestamp类型
     * 
     * @return Timestamp
     */
    public static Timestamp getTimestamp(Date time) {
		if (time == null)
		    return null;
		Timestamp tt = null;
		try {
		    tt = new Timestamp(time.getTime());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tt;
    }
   
}
