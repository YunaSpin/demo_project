package com.workPage.test;

import com.workPage.dao.Conn;
import com.workPage.domain.Student;

public class logintest {
    public static void main(String[] args) {
        Student student = new Student();
        Conn conn = new Conn();

        student.setNumber("2019005");
        student.setLoginPassword("123457");

        conn.addAMessage(student);
//        boolean flag = conn.isRegister("2019001");
//        System.out.println(flag);

//        student.setName("wan");
//        student.setNumber("2019004");
//        student.setSex("男");
//        student.setLoginPassword("999999");
//        student.setPayPassword("999999");
//        student.setHeadPortrait(null);
//        student.setLeaveRecord("#2019-01-10#玩玩");
//        conn.addAMessage(student);


//        student = conn.selectMessage("2019002");
//        System.out.println(student.getSex());
//        boolean flag = conn.login("2019001","888888");
//        System.out.println(flag);
    }
}
