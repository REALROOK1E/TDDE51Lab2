package com.quanxiaoha.weblog.web.utils;

/**
 * @author: 犬小哈
 * @url: www.quanxiaoha.com
 * @date: 2024/2/23 15:38
 * @description: 字符串工具类
 **/
public class StringUtil {

    /**
     * 判断字符串是否是纯数字
     * @param str
     * @return
     */
    public static boolean isPureNumber(String str) {
        return str.matches("\\d+");
    }

}
