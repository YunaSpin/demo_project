package com.workPage.web;

/*import com.workPage.dao.Conn;
import com.workPage.domain.Student;
import com.workPage.util.Utils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;*/

import com.workPage.dao.Conn;
import com.workPage.domain.Student;
import com.workPage.util.Utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/RegisterPageServer")
public class RegisterPageServer extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //flag
        boolean flag = false;
        Conn conn = new Conn();
        Student student = new Student();
        Utils utils = new Utils();

        String studentNumber = req.getParameter("studentNumber");
        String studentPassword = req.getParameter("studentPassword");
        student.setNumber(studentNumber);
        student.setLoginPassword(studentPassword);

        if (!(utils.isNumberString(studentNumber))) {
            resp.getWriter().write("{jsonFlag:isNotStr}");
        }else {
            flag = conn.isRegister(studentNumber);
            if (flag) {
                resp.getWriter().write("{jsonFlag:true}");
            }else {
                conn.addAMessage(student);
                resp.getWriter().write("{jsonFlag:false}");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
