package com.workPage.web;

import com.workPage.dao.Conn;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;


@WebServlet("/upleave")
public class Upleave extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out = resp.getWriter();

        String number = req.getParameter("number");
        String date = req.getParameter("leavedate");
        String reason = req.getParameter("leavereason");
        String onerecord = date+"#"+reason;

//        System.out.println(number + date + reason);
        Conn conn = new Conn();
        conn.updataLeave(number, onerecord);

        out.println(1);
        out.close();
    }
}
