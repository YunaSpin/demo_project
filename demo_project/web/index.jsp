<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.sql.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
  <meta charset="UTF-8">
  <title>学生信息管理系统</title>
  <script>
    window.addEventListener('load', function() {
      var container_isnot_count = document.querySelector('.container_isnot_count');
      var container_register = document.querySelector('.container_register');
      var container_login = document.querySelector('.container_login');
      var container_is_count = document.querySelector('.container_is_count');
      container_isnot_count.children[2].addEventListener('click', function() {
        container_isnot_count.style.display = 'none';
        container_register.style.display = 'block';
        container_login.style.display = 'none';
        container_is_count.style.display = 'block';
      })
      container_is_count.children[2].addEventListener('click', function() {
        container_is_count.style.display = 'none';
        container_login.style.display = 'block';
        container_register.style.display = 'none';
        container_isnot_count.style.display = 'block';
      })
    })

  </script>
  <style>
    * {
      margin: 0;
      padding: 0;
    }

    body {
      font-family:'Montserrat',sans-serif;
      background-color: #222831;
      display:flex;
      flex-direction:column;
      justify-content:center;
      align-items:center;
      height:100vh;
      margin:-20px 0 50px;
    }



    /*
            登陆
    */
    p{
      font-size: 16px;
      line-height: 100px;
      letter-spacing: .5px;
      margin: 20px 0 30px;
      color: #fff;
    }

    .container_login {
      position: absolute;
      top: 50%;
      right: 45%;
      box-shadow: 0 14px 28px rgba(0,0,0,.25),0 10px rgba(0,0,0,.22);
      transform: translate(-8%, -50%);
      width: 320px;
      height: 400px;
      padding: 40px;
      text-align: center;
      border-radius: 24px;
      background-color: #eeeeee;
      transition: .5s;
    }

    .container_login input[type="text"],
    .container_login input[type="password"] {
      border: 0;
      background: none;
      display: block;
      margin: 50px auto;
      text-align: center;
      border: 2px solid #74b9ff;
      padding: 14px 10px;
      width: 200px;
      outline: none;
      border-radius: 24px;
      transition: 0.25s;
    }

    .container_login input[type="password"] {
      margin-top: 35px;
    }

    .container_login input[type="text"]:focus,
    .container_login input[type="password"]:focus {
      width: 260px;
      border-color: #00b894;
    }

    .container_login .checkcode_login input[type="text"] {
      display: inline-block;
      width: 100px;
    }

    .container_login .checkcode_login input[type="text"]:focus {
      width: 120px;
    }

    .container_login .checkcode_login div {
      display: inline-block;
      width: 100px;
      border: 2px solid #74b9ff;
      padding: 10px 8px;
      padding-bottom: 13px;
      outline: none;
      border-radius: 24px;
      text-align: center;
      color: #fff;
      font-size: 16px;
      cursor: pointer;
      -webkit-user-select: none;
    }

    .container_login input[type="button"] {
      border: 0;
      background: none;
      display: block;
      margin: 20px auto;
      text-align: center;
      font-size: 18px;
      background-color: #00adb5;
      padding: 14px 40px;
      outline: none;
      border-radius: 24px;
      transition: 0.25s;
      cursor: pointer;
      color: #fff;
    }

    /*
        注册
    */

    .container_register {
      display: none;
      position: absolute;
      top: 50%;
      left: 50%;
      box-shadow: 0 14px 28px rgba(0,0,0,.25),0 10px rgba(0,0,0,.22);
      transform: translate(-8%, -50%);
      width: 320px;
      height: 400px;
      padding: 40px;
      text-align: center;
      border-radius: 24px;
      background-color: #eeeeee;
      transition: .5s;
    }

    .container_register input[type="text"],
    .container_register input[type="password"] {
      border: 0;
      background: none;
      display: block;
      margin: 25px auto;
      text-align: center;
      border: 2px solid #74b9ff;
      padding: 14px 10px;
      width: 200px;
      outline: none;
      border-radius: 24px;
      transition: 0.25s;
    }

    .container_register input[type="text"]:focus,
    .container_register input[type="password"]:focus {
      width: 260px;
      border-color: #00b894;
    }

    .container_register .checkcode_register input[type="text"] {
      display: inline-block;
      width: 100px;
    }

    .container_register .checkcode_register input[type="text"]:focus {
      width: 120px;
    }

    .container_register .checkcode_register div {
      display: inline-block;
      width: 100px;
      border: 2px solid #74b9ff;
      padding: 10px 8px;
      padding-bottom: 13px;
      outline: none;
      border-radius: 24px;
      text-align: center;
      color: #fff;
      font-size: 16px;
      cursor: pointer;
    }

    .container_register input[type="button"] {
      border: 0;
      background: none;
      display: block;
      margin: 20px auto;
      text-align: center;
      font-size: 18px;
      background-color: #00adb5;
      padding: 14px 40px;
      outline: none;
      border-radius: 24px;
      transition: 0.25s;
      cursor: pointer;
      color: #fff;
    }

    /*
        如果有账号 展示登陆页面
    */

    .container_is_count {
      display: none;
      position: absolute;
      top: 50%;
      right: 50.5%;
      box-shadow: 0 14px 28px rgba(0,0,0,.25),0 10px rgba(0,0,0,.22);
      transform: translate(-8%, -50%);
      width: 220px;
      height: 400px;
      padding: 40px;
      text-align: center;
      font-size: 18px;
      border-radius: 24px;
      background-color: #00adb5;
      transition: .5s;
    }

    .container_is_count h1 {
      margin-top: 30px;
      color: #fff;
    }

    .container_is_count>div {
      position: absolute;
      top: 260px;
      left: 50%;
      transform: translateX(-50%);
      width: 80px;
      padding: 14px 10px;
      cursor: pointer;
      border-radius: 24px;
      background-color: #00adb5;
      border: 2px solid #fff;
      color: #fff;
    }


    /*
        如果没有账号 展示注册页面
    */

    .container_isnot_count {
      position: absolute;
      top: 50%;
      left: 55%;
      box-shadow: 0 14px 28px rgba(0,0,0,.25),0 10px rgba(0,0,0,.22);
      transform: translate(-11%, -50%);
      width: 220px;
      height: 400px;
      padding: 40px;
      text-align: center;
      border-radius: 24px;
      background-color: #00adb5;
      transition: .5s;
    }

    .container_isnot_count h1 {
      margin-top: 30px;
      color: #fff;
    }

    .container_isnot_count>div {
      position: absolute;
      top: 260px;
      left: 50%;
      transform: translateX(-50%);
      width: 80px;
      padding: 14px 10px;
      font-size: 18px;
      cursor: pointer;
      border-radius: 24px;
      border: 2px solid #fff;
      color: #fff;
    }

  </style>
</head>

<body>
<script type="text/javascript">
  function registerIsTrue() {
    var xmlhttp;
    if (window.XMLHttpRequest)
    {
      xmlhttp=new XMLHttpRequest();
    }else {
      xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    let userNumber = document.getElementById("username_register").value;
    let userPassword = document.getElementById("pword_register").value;

    let url = "RegisterPageServer?studentPassword="+userPassword+"&studentNumber="+userNumber;

    xmlhttp.open("GET",url,true);
    xmlhttp.send();


    //这里是注册界面   数据还未完整需哟更改    未做注册错误的效果
    xmlhttp.onreadystatechange=function()
    {
      //判断readyState就绪状态是否为4，判断status响应状态码是否为200
      if (xmlhttp.readyState==4 && xmlhttp.status==200)
      {
        //获取服务器的响应结果
        var response = xmlhttp.response;
        if (response == "{jsonFlag:isNotStr}") {
          document.getElementById("point_1").innerText = "长度应为大于4小于等于8的数字账号";
        }else if (response == "{jsonFlag:true}") {
          document.getElementById("point_1").innerText = "";
          document.getElementById("point_1").innerText = "您注册的账号已被注册";
        }else {
          document.getElementById("point_1").innerText = "";
          alert("您的账号注册成功");
        }
      }
    }
  }

  function isTrue() {
    var xmlhttp;
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
      xmlhttp=new XMLHttpRequest();
    }
    else
    {
      xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    let stuNumber = document.getElementById("username_login").value;
    let stuLoginPassword = document.getElementById("password_login").value;

    let url = "LoginPageServer?studentNumber="+stuNumber+"&studentLoginPassword="+stuLoginPassword;

    xmlhttp.open("GET",url,true);

    //3.发送请求
    xmlhttp.send();
    //4.接受并处理来自服务器的响应结果
    //获取方式 ：xmlhttp.responseText
    //什么时候获取？当服务器响应成功后再获取

    //当xmlhttp对象的就绪状态改变时，触发事件onreadystatechange。
    xmlhttp.onreadystatechange=function()
    {
      //判断readyState就绪状态是否为4，判断status响应状态码是否为200
      if (xmlhttp.readyState==4 && xmlhttp.status==200)
      {
        //获取服务器的响应结果
        var response = xmlhttp.response;
        if (response == "{jsonFlag:false}") {
          alert("密码或账号错误！");
        }else {
          location.href="Main.jsp?number="+stuNumber;
        }
      }
    }
  }
</script>

<div class="container_is_count">
  <h1>已有账号？</h1>
  <p>请使用您的账号进行登陆</p>
  <div>立即登陆</div>
</div>

<!--这里是登陆-->
<div class="container_login">
  <h1>登陆</h1>
  <form id="loginForm" action="LoginPageServer" method="get" onsubmit="return false">
    <div class="username_login">
      <input type="text" name="username_login" id="username_login" placeholder="请输入账号">
    </div>
    <div class="password_login">
      <input type="password" name="password_login" id="password_login" placeholder="请输入密码">
    </div>
    <div>
      <input type="button" value="登录" onclick="isTrue()">
    </div>

    <a href="#">忘记密码?</a>
  </form>
</div>
<div class="container_isnot_count">
  <h1>没有账号？</h1>
  <p>那就赶快立即注册一个吧!</p>
  <div>立即注册</div>
</div>

<!--这里是注册-->
<div class="container_register">
  <h1>注册</h1>
  <form action="RegisterPageServer" method="get" onsubmit="return false">
    <div class="username_register">
      <input type="text" name="username_register" id="username_register" placeholder="请输入用户名/邮箱">
    </div>
    <div id="point_1"></div>
    <div class="password_register">
      <input type="password" name="password_register" id="pword_register" placeholder="请输入密码">
    </div>
    <input type="button" value="注册" onclick="registerIsTrue()">
  </form>
</div>

</body>

</html>