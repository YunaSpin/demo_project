package com.workPage.web;

import com.workPage.dao.PlaceConn;
import com.workPage.domain.Place;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Iterator;
import java.util.LinkedList;

@WebServlet("/PlaceRegister")
public class PlaceRegister extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String isNextOrPre = "next_page";
        String str = req.getParameter("pageNumber");

        if (str == null) {
            str = "1";
            System.out.println("this str is:"+str);
        }
        else {
            int i = Integer.parseInt(str);
            i++;
            str = ""+i;
            System.out.println("this str is:"+str);
        }
        LinkedList<Place> list = new LinkedList<>();

        PlaceConn placeConn = new PlaceConn();
        list.addAll(placeConn.selectListMessage("MT",str,"next_page"));

        if (list.size() == 6) {
            for (int i = 0; i < list.size(); i++) {
                req.getSession().setAttribute("td_"+i,list.get(i).getDestine());
            }
        }else {
            int flagNumber = 6-list.size();
            for (int i = 0; i < list.size(); i++) {
                req.getSession().setAttribute("td_"+i,list.get(i).getDestine());
            }
            for (int i = list.size(); i < 6; i++) {
                req.getSession().setAttribute("td_"+i,"");
            }
        }


        req.getSession().setAttribute("pageNumber",str);

        resp.sendRedirect("placeRegister.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
