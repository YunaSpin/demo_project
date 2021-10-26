<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.sql.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>请假管理</title>
    <script>
        <%
            String number = request.getParameter("number");
        %>
        function showLeaveRecord() {
            var number = '<%=number%>';
            location.href = "LeaveRecord.jsp?number=" + number;
        }
        function applyLeave() {
            var number = '<%=number%>';
            location.href = "ApplyLeave.jsp?number=" + number;
        }
    </script>
	<style>
	body
	{
		background: url(img/src=http---www.dorayy.com-wp-content-uploads-2018-12-yanhua-4.gif&refer=http---www.dorayy.gif);
	}
	
	.a_02
	{
		padding-top: 10px;
		margin: 210px 500px auto;
		text-align: center;
		vertical-align: middle;
		width: 100px;
		height: 40px;
		line-height: 30px;
		border-width: 0px;
		border-radius: 3px;
		border: #006DCC;
		cursor: pointer;
		outline: none;
		color: #000000;
		font-size: 17px;
	}
	.a_03
	{
		padding-top: 8px;
		margin: 40px 500px auto;
		text-align: center;
		vertical-align: middle;
		width: 100px;
		height: 40px;
		line-height: 30px;
		border-width: 0px;
		border-radius: 3px;
		border: #006DCC;
		cursor: pointer;
		outline: none;
		color: #000000;
		font-size: 17px;
	}
	</style>
</head>
<body>
    <button class="a_02" onclick="showLeaveRecord()" >请假记录</button>
    <button class="a_03" onclick="applyLeave()" >申请</button>
</body>
</html>
