package com.workPage.web;

import com.workPage.dao.Conn;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/charge")
public class ChargeFee extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String number = req.getParameter("number");
        String feename = req.getParameter("feename");
        double money = Double.parseDouble(req.getParameter("money"));


        Conn conn = new Conn();
        conn.updateFee(number,feename, money);

        req.getRequestDispatcher("FeeManage.jsp").forward(req, resp);
    }
}
