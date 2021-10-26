package com.workPage.test;

import com.workPage.util.Utils;

public class UtilTest {
    public static void main(String[] args) {
        Utils utils = new Utils();

        boolean flag = utils.isNumberString("12334");
        System.out.println(flag);
    }
}
