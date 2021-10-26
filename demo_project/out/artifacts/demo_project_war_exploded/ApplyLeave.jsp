<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.sql.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>申请请假</title>
    <script>
        <%
            String number = request.getParameter("number");
        %>
        function uptosql() {
            var number = '<%=number%>'
            var date = document.getElementById("leavedate").value.toString();
            var reason = document.getElementById("leavereason").value;

            // alert(date + reason);
            var xmlhttp = new XMLHttpRequest();
            //2.设置请求方式和请求地址
            let url = "upleave?number="+number+"&leavedate="+date+"&leavereason="+reason;
            xmlhttp.open("get", url);
            //3.发送请求
            xmlhttp.send();
            //4.监听状态的变化
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState === 4 && xmlhttp.status === 200){
                    var result = xmlhttp.responseText;
                    if (result == 1){
                        confirm("提交成功")
                    }
                }
            }
        }
    </script>
	
	<style>
	body
	{
				background: url(img/src=http---www.dorayy.com-wp-content-uploads-2018-12-yanhua-4.gif&refer=http---www.dorayy.gif);
	}
	.a_04
	{
		width: 300px;
		height: 200px;
		padding-top: 10px;
		margin: 200px auto;
		background-color: #EEEEEE;
		opacity: 0.5;
		border-radius: 20px;
		border: 1px solid #112233;
		text-align: center;
	}
	</style>
</head>
<body>
    <%--<form action="upleave">

    </form>--%>
    <div class="a_04">
		<div>选择日期<input type="date" id="leavedate"></div>
		<div>
		    请假说明
		    <br>
		    <textarea cols="30" rows="5" id="leavereason"></textarea>
		</div>
		<div><button onclick="uptosql();">提交</button></div>
	</div>
</body>
</html>
