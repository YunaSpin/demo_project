package com.workPage.util;

import java.util.regex.Pattern;

public class Utils {
    //正则表达式判断是否是数字字符串（可判断正数，负数和小数）
    public boolean isNumberString(String str) {
        Pattern pattern = Pattern.compile("-?[0-9]+(\\.[0-9]+)?");
        boolean flag = pattern.matcher(str).matches();
        if (str.length()<=4||str.length()>8) {
            flag = false;
        }
        return flag;
    }
}
