package com.workPage.web;

//import com.workPage.dao.PlaceConn;
/*import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;*/

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedList;

@WebServlet("/OrderPlaceServe")
public class OrderPlaceServe extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //这个是从未预定到预定
//        PlaceConn placeConn = new PlaceConn();
//        LinkedList<String> list = new LinkedList<>();
//        for (int i = 0; i < 6; i++) {
//            list.add(req.getParameter("td_"+i));
//        }
//        String str = req.getParameter("WeiZhiNumber");
//        String pageStr = req.getParameter("pageNumber");
//        int pageNumber = Integer.parseInt(pageStr);
//        System.out.println(str);
//        //先实现不预定变为预定
//        switch (str) {
//            case "一号座未预订":
//                list.set(0,placeConn.orderPlace(0,pageNumber));
//                break;
//            case "二号座未预订":
//                list.set(1,placeConn.orderPlace(1,pageNumber));
//                break;
//            case "三号座未预定":
//                list.set(2,placeConn.orderPlace(2,pageNumber));
//                break;
//            case "四号座未预订":
//                list.set(3,placeConn.orderPlace(3,pageNumber));
//                break;
//            case "五号座未预定":
//                list.set(4,placeConn.orderPlace(4,pageNumber));
//                break;
//            case "六号座未预定":
//                list.set(5,placeConn.orderPlace(5,pageNumber));
//                break;
//        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
