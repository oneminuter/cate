package com.cate.util;

import java.net.InetAddress;

import javax.servlet.http.HttpServletRequest;
/*
 * 获取客户端当前访问的真实ip
 */

public class GetIpAdress {
	public static String getIpAddr(HttpServletRequest request){
		String ipAddress = request.getHeader("x-forwarded-for");
		if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getHeader("Proxy-Client-IP");
		}
		if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getHeader("WL-Proxy-Client-IP");
		}
		if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getRemoteAddr();
			if(ipAddress.equals("127.0.0.1") || ipAddress.equals("0:0:0:0:0:0:0:1")) {
				//更具网卡取本机配置的ip
				InetAddress inet = null;
				try {
					inet = InetAddress.getLocalHost();
				} catch (Exception e) {
					e.printStackTrace();
				}
				ipAddress = inet.getHostAddress();
			}
		}
		
		//对于多个代理的情况，第一个ip为客户端真实ip，对个ip按照‘,’分割
		if( ipAddress != null && ipAddress.length() > 15) {
			if(ipAddress.indexOf(",") > 0 ){
				ipAddress = ipAddress.substring(0,ipAddress.indexOf(","));
			}
		}
		return ipAddress;
	}
}
