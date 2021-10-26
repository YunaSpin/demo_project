package com.workPage.web;

import com.workPage.dao.Conn;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/uploaddata")
public class Uploaddata extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException {
        String number = req.getParameter("number");
        String name = req.getParameter("name");
        String gender = req.getParameter("gender");
        String password = req.getParameter("password");

        Conn conn = new Conn();

        conn.update(number,gender,password,name);

    }
}
