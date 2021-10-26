package com.workPage.web;

import com.workPage.dao.Conn;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/feemanager")
public class ShowFee extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out = resp.getWriter();

        String number = req.getParameter("number");
        Conn conn = new Conn();

        String totalfee = conn.refee(number);
//        System.out.println(totalfee);
        out.println(totalfee);
        out.flush();
        out.close();
//        System.out.println("费用管理："+number);
    }
}
