<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.sql.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>success</title>
</head>
<script>
    <%
        String number = request.getParameter("number");
    %>
    function toFee() {
        var number = '<%=number%>';
        location.href = "FeeManage.jsp?number=" + number;
    }
    function uplode() {
        var number ='<%=number%>';
        var tanchuang = window.open("tanchuang.jsp?number="+number, "new", "location = no, width = 300, height = 500");
        
    }
    function toLeave() {
        var number = '<%=number%>';
        location.href = "LeaveManage.jsp?number=" + number;
    }
</script>
<body>

    <p>success</p>
    <div>
        学号：<input type="text" readonly="readonly"><br>
        姓名：<input type="text" readonly="readonly"><br>
        性别：<input type="text" readonly="readonly"><br>
        <button onclick="uplode()">完善资料</button>
        <button onclick="toFee()">费用管理</button>
        <button onclick="toLeave()">请假管理</button>
    </div>
</body>
</html>