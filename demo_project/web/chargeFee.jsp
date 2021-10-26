<%--
  Created by IntelliJ IDEA.
  User: gether laz
  Date: 2021/10/23
  Time: 21:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>缴费</title>
    <script>
        <%
            String number = request.getParameter("number");
            String feename = request.getParameter("feename");
            String fee = request.getParameter("fee");
        %>
        function charge() {
            const number = '<%=number%>';
            const money = document.getElementById("money").value;
            const fee = '<%=fee%>';
            var totalfee = parseInt(fee) + parseInt(money);
            var feename = '<%=feename%>';
            // alert(totalfee);
            const payPassword = document.getElementById("payPassword").value;
            // alert(number + money + payPassword);
            var xmlhttp = new XMLHttpRequest();
            //2.设置请求方式和请求地址
            let url = "ispay?number="+number+"&payPassword="+payPassword;
            xmlhttp.open("get", url);
            //3.发送请求
            xmlhttp.send();
            //4.监听状态的变化
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState === 4 && xmlhttp.status === 200){
                    var result = xmlhttp.responseText
                    // alert(result)
                    if (result == 1) {
                        location.href = "charge?number=" + number+"&money="+totalfee+"&feename="+feename;
                    } else {
                        alert("密码错误")
                        //清空密码区
                    }
                }
            }
        }
    </script>
</head>
<body>
    <div>
        输入金额：<input type="text" id="money">
    </div>
    <div>
        输入密码：<input type="password" id="payPassword">
    </div>
    <div>
        <button onclick="charge()">充值</button>
    </div>
</body>
</html>
