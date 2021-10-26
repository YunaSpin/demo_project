package com.workPage.web;

import com.workPage.dao.Conn;
/*
import com.workPage.domain.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
*/

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/LoginPageServer")
public class LoginPageServer extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //flag 判断是否账号密码正确,结果为true账号正确
        boolean flag = false;
        Conn conn = new Conn();

        String studentNumber =req.getParameter("studentNumber");
        String studentLoginPassword = req.getParameter("studentLoginPassword");

        flag = conn.login(studentNumber, studentLoginPassword);

        //判断密码信息  返回相应的信息
        if (flag) {
            resp.getWriter().print("{jsonFlag:true}");
        }else {
            resp.getWriter().print("{jsonFlag:false}");
        }

        resp.getWriter().flush();
        resp.getWriter().close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
