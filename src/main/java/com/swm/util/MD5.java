package com.swm.util;

import java.security.MessageDigest;

/**
 * MD5加密工具包
 *
 * @author asus1
 */
public class MD5 {

    public final static String toMD5(String s) {
        //方法一
        char hexDigits[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'A', 'B', 'C', 'D', 'E', 'F'};
        try {
            // byte[] btInput = s.getBytes();
            // 获得MD5摘要算法的 MessageDigest 对象
            MessageDigest mdInst = MessageDigest.getInstance("MD5");
            // 使用指定的字节更新摘要
            // mdInst.update(btInput);
            // 获得密文
            byte[] md = mdInst.digest(s.getBytes());
            // 把密文转换成十六进制的字符串形式
            int j = md.length;
            System.out.println(j);
            char str[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
//		方法二		
//		StringBuffer md5Code = new StringBuffer();
//		try {
//			// 获取加密方式为md5的算法对象
//			MessageDigest instance = MessageDigest.getInstance("MD5");
//			byte[] digest = instance.digest(s.getBytes());
//			System.out.println(digest.length);
//			for (byte b : digest) {
//				String hexString = Integer.toHexString(b & 0xff);
//				if (hexString.length() < 2) {
//					hexString = "0" + hexString;
//				}
//				md5Code = md5Code.append(hexString);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return md5Code.toString().toUpperCase();
    }
}
