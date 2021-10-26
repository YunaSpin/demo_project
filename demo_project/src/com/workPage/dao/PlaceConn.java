package com.workPage.dao;


import com.workPage.domain.Place;

import java.sql.*;
import java.util.LinkedList;

public class PlaceConn {
    Connection connection = null;

    public PlaceConn() {
        String driver = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/match";
        String user = "root";
        String passwordDatabase = "123456";

        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(url,user,passwordDatabase);
            if(!connection.isClosed()) {
                //errorWarn
            }
        }
        catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        catch (SQLException exception) {
            exception.printStackTrace();
        }
    }

    //预定场地，从未预定到预定
//    public String orderPlace(int flagNumber,int flagPage) {
//        int totalNumber = flagPage*6 + flagNumber;
//        try{
//            String sql = "UPDATE place set destine=? where number=?";
//            PreparedStatement preparedStatement = connection.prepareStatement(sql);
//            preparedStatement.setString(1,"yes");
//            preparedStatement.setString(1, "");
//
//        }catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        return "yes";
//    }

    //分段查询
    //提供场地类型和页码数，数据库中根据场地类型再用limit在查询中进行分段
    //返回一段数据（前端设计为八个每页，本项目为8个）
    public LinkedList<Place> selectListMessage(String type, String StrNumber, String isPreviousOrNext) {
        int pageNumber = Integer.parseInt(StrNumber);

        LinkedList<Place> list = new LinkedList<>();
        int number = pageNumber*6-6;
        try{
            String sql = "select * from place where type=? limit "+number+","+"6";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1,type);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Place place = new Place();
                place.setNumber(resultSet.getString(1));
                place.setType(resultSet.getString(2));
                place.setDestine(resultSet.getString(3));
                list.add(place);
            }
        }
        catch(SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
