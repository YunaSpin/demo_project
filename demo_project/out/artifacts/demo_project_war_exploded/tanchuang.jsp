<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.sql.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en"> -->
<head>
    <meta charset="UTF-8">
    <title>Title</title>
	<style>
	body
	{
		background: url(img/src=http---www.dorayy.com-wp-content-uploads-2018-12-yanhua-4.gif&refer=http---www.dorayy.gif);
	}
	div
	{
		width: 503px;
		height:175px;
		padding-top: 60px;
		margin: 170px auto;
		background-color: #EEEEEE;
		opacity: 0.5;
		border-radius: 20px;
		border:1px solid #112233;
		text-align: center;
	}
	
	</style>
</head>
<script>
    function upload() {
        // var number = window.parent.value;
        // alert("zhi:"+number);
        var addstr = document.URL;
        var num = addstr.indexOf("?")
        addstr = addstr.substr(num+8);
        // alert(addstr);
        var name = document.getElementById("name").value;
        var gender = document.getElementById("gender").value;
        var password1 = document.getElementById("password").value;
        var password2 = document.getElementById("password2").value;
        location.href = "uploaddata?number="+addstr+"&name="+name+"&gender="+gender+"&password="+password1;
    }
</script>
<body>
<div>
	请输入你的姓名：<input type="text" id="name" name="name"><br>
    <span>请选择你的性别：</span><select id="gender" name="gender">
        <option value="男">男</option>
        <option value="女">女</option>
    </select>
    <br>
    请输入支付密码：<input id="password" type="password"><br>
    请确认支付密码：<input id="password2" type="password"><br>
    <button onclick="upload();" class="btn">上传</button>
</div>
</body>
</html>