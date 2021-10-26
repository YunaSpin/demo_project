package com.workPage.web;

import com.workPage.dao.Conn;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/ispay")
public class IsPayPassword extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out = resp.getWriter();

        String number = req.getParameter("number");
        String payPassword = req.getParameter("payPassword");

//        System.out.println("用户密码："+ number + payPassword);
        Conn conn = new Conn();
        boolean result = conn.isPayPassword(number, payPassword);
        if (result){
            out.println(1);
        } else {
            out.println(2);
        }
        out.flush();
        out.close();
    }
}
