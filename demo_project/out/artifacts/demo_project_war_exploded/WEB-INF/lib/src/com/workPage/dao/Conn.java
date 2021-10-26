package com.workPage.dao;

import com.workPage.domain.Student;
import java.lang.*;

import java.sql.*;
import java.util.LinkedList;

public class Conn {
    Connection connection = null;

    public Conn() {
        String driver = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/match";
        String user = "root";
        String passwordDatabase = "123456";

        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(url,user,passwordDatabase);
            if(!connection.isClosed()) {
                System.out.println("成功连接数据库");
            }
        }
        catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        catch (SQLException exception) {
            exception.printStackTrace();
        }
    }

    //查询是否账号密码正确
    //需要传入一条学生的学号和密码进行查询
    //返回是否存在这个学生的boolean值

/*    public void improveDate(String number, String name, String sex, String payPassword){
        PreparedStatement statement = null;
        System.out.println("guolaide:"+number+name+sex+payPassword);
        try {
            statement = connection.prepareStatement("update student set name = '"+ name + "', sex = '"+ sex +"' , payPassword = '"+ payPassword +"' where number = '"+ number +"'");
            statement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }*/

    public void updataLeave(String number, String onerecord ){
        try {
            PreparedStatement statement = connection.prepareStatement("UPDATE student set leaveRecord = CONCAT_WS ('^', leaveRecord, '"+ onerecord +"') where number="+ number +"");
            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //此方法为用户充值金额后更新数据库的值
    public void updateFee(String number,String feename, double money){
        try {
            PreparedStatement statement = connection.prepareStatement("UPDATE student set "+ feename +"=? where number=?");
//            statement.setString(1,feename);
            statement.setDouble(1,money);
            statement.setString(2,number);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(String number,String sex,String payPassword,String name) {
        try{
            PreparedStatement statement = connection.prepareStatement("UPDATE student set name=?,sex=?,payPassword=? where number=?");
            statement.setString(1,name);
            statement.setString(2,sex);
            statement.setString(3,payPassword);
            statement.setString(4,number);

            statement.executeUpdate();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean login(String number,String loginPassword) {
        boolean flag = false;

        try{
            PreparedStatement statement = connection.prepareStatement("select * from student where student.number=? and student.loginPassword=?");
            statement.setString(1,number);
            statement.setString(2,loginPassword);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                flag = true;
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    //修改一个账号的用户信息
    //需要传入一个学生的学生信息，学号密码不可更改，查询学号，更改相应的学生信息
    //
    public void changeAUserMessage(Student student) {
        boolean flag=false;

        try{
            PreparedStatement statement = connection.prepareStatement("UPDATE student set (name,sex,payPassword,headPortrait,leaveRecord) = " +
                    "?,?,?,?,? where number=?");
            statement.setString(1,student.getName());
            statement.setString(2,student.getSex());
            statement.setString(3,student.getPayPassword());
            statement.setBytes(4,student.getHeadPortrait());
            statement.setString(5, student.getLeaveRecord());
            statement.setString(6,student.getNumber());

            ResultSet resultSet = statement.executeQuery();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //查询是否账号被注册
    //需要传入一条学生的学号进行查询
    //
    public boolean isRegister(String number) {
        boolean flag=false;

        try{
            PreparedStatement statement = connection.prepareStatement("select * from student where number=?");
            statement.setString(1,number);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                flag = true;
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }


    //此方法是匹配用户输入的密码与数据库中的密码是否匹配
    public boolean isPayPassword(String number, String payPassword){
        boolean flag = false;
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement("select * from student where number=?");
            statement.setString(1,number);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String payPasswordsql = resultSet.getString(6);
                if (payPasswordsql.equals(payPassword)){
                    flag = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public String repersondate(String number){
        String persondate = "";
        try {
            PreparedStatement statement=connection.prepareStatement("select * from student where number=?");
            statement.setString(1,number);
            ResultSet resultSet=statement.executeQuery();
            if (resultSet.next()){
                String personnumber = resultSet.getString(2);
                String name = resultSet.getString(3);
                String sex = resultSet.getString(4);

                persondate = personnumber + "," + name + "," + sex;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return persondate;
    }

    //此方法是返回指定用户的各个费用的多少
    public String refee(String number){
        String totalfee = "";
        try {
            PreparedStatement statement=connection.prepareStatement("select * from student where number=?");
            statement.setString(1,number);
            ResultSet resultSet=statement.executeQuery();
            if (resultSet.next()){
                String classfee = String.valueOf(resultSet.getDouble(9));
                String tuitionFee = String.valueOf(resultSet.getDouble(10));
                String liveFee = String.valueOf(resultSet.getDouble(11));
                String dormFee = String.valueOf(resultSet.getDouble(12));

                totalfee = classfee + "," + tuitionFee + "," + liveFee + "," + dormFee;
            } else {
                return "no data";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalfee;
    }

    //方法是返回用户的请假记录
    public String releave(String number){
        String leaverecord = "";
        try {
            PreparedStatement statement=connection.prepareStatement("select * from student where number=?");
            statement.setString(1,number);
            ResultSet resultSet=statement.executeQuery();
            if (resultSet.next()) {
                leaverecord = resultSet.getString(8);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return leaverecord;
    }

    public Student selectMessage(String number) {
        Student student = null;
        try{
            PreparedStatement statement=connection.prepareStatement("select * from student where number=?");
            statement.setString(1,number);
            ResultSet resultSet=statement.executeQuery();

            while (resultSet.next()) {
                student = new Student();
                student.setNumber(resultSet.getString(2));
                student.setName(resultSet.getString(3));
                student.setSex(resultSet.getString(4));
                student.setLoginPassword(resultSet.getString(5));
                student.setPayPassword(resultSet.getString(6));
                student.setHeadPortrait(resultSet.getBytes(7));
                student.setLeaveRecord(resultSet.getString(8));
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return student;
    }


    //删除
    //需要传入一条学生学号    删除一条学生的信息
    public void deleteMassage(String number) {
        try{
            String sql="delete from student where number=?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,number);
            preparedStatement.execute();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //增加
    //需要传入一个学生信息    在数据库中添加一个学生信息
    public void addAMessage(Student student) {

        try{
            String sql="insert into student(number,name,sex,loginPassword,payPassword,headPortrait,leaveRecord) values(?,?,?,?,?,?,?)";//会抛出异常
            PreparedStatement preStmt=connection.prepareStatement(sql);
//            preStmt.setInt(1,student.getID());
            preStmt.setString(1,student.getNumber());
            preStmt.setString(2,null);
            preStmt.setString(3,null);
            preStmt.setString(4,student.getLoginPassword());
            preStmt.setString(5,null);
            preStmt.setBytes(6,null);
            preStmt.setString(7,null);

            preStmt.executeUpdate();
        }
        catch (SQLException exception) {
            exception.printStackTrace();
        }
    }


//    public LinkedList<Student> loginIn() {
//        LinkedList<Student> list = new LinkedList<>();
//
//        try{
//            Statement statement = connection.createStatement();
//            String sql = "select * from student";
//            ResultSet rs = statement.executeQuery(sql);
//
//            while(rs.next()) {
//                //已经验证每个student是对的  有两个student
//                String number = rs.getString(1);
//                String name = rs.getString(2);
//                String sex = rs.getString(3);
//                String date = rs.getString(4);
//                String resume = rs.getString(5);
//                //LinkedList要创建新对象才能进行更好的储存
//                Student student = new Student();
//                student.setName(name);
//                student.setNumber(number);
//                student.setSex(sex);
//                list.add(student);
//            }
//            statement.close();
//            connection.close();
//        }
//        catch (SQLException exception) {
//            exception.printStackTrace();
//        }
//
//        return list;
//    }
}
