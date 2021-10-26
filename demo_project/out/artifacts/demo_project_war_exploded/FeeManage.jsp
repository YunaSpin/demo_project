<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.sql.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>费用管理界面</title>
    <script>
        <%
            String number = request.getParameter("number");
        %>
        function chargeFee1() {
            var number = '<%=number%>'
            var fee = document.getElementById("classfee").value;

            location.href = "chargeFee.jsp?number=" + number+"&fee="+fee+"&feename=classFee";
        }
        function chargeFee2() {
            var number = '<%=number%>'
            var fee = document.getElementById("tuitionfee").value;

            location.href = "chargeFee.jsp?number=" + number+"&fee="+fee+"&feename=tuitionFee";
        }

        function chargeFee3() {
            var number = '<%=number%>'
            var fee = document.getElementById("livefee").value;

            location.href = "chargeFee.jsp?number=" + number+"&fee="+fee+"&feename=liveFee";
        }

        function chargeFee4() {
            var number = '<%=number%>'
            var fee = document.getElementById("dormfee").value;

            location.href = "chargeFee.jsp?number=" + number+"&fee="+fee+"&feename=dormFee";
        }

        function showFee() {
            var number = '<%=number%>';
            var xmlhttp = new XMLHttpRequest();
            //2.设置请求方式和请求地址
            let url = "feemanager?number="+number;
            xmlhttp.open("get", url);
            //3.发送请求
            xmlhttp.send();
            //4.监听状态的变化
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState === 4 && xmlhttp.status === 200){
                    var fee = xmlhttp.responseText;
                    var feearr = fee.split(",");
                    var f1 = document.getElementById("classfee");
                    var f2 = document.getElementById("tuitionfee");
                    var f3 = document.getElementById("livefee");
                    var f4 = document.getElementById("dormfee");

                    f1.value = feearr[0];
                    f2.value = feearr[1];
                    f3.value = feearr[2];
                    f4.value = feearr[3];
                }
            }
        }
    </script>
	<style>
	body
	{
		background: url(img/src=http---www.dorayy.com-wp-content-uploads-2018-12-yanhua-4.gif&refer=http---www.dorayy.gif);
	}
	div
	{
		width: 350px;
		height: 150px;
		padding-top: 55px;
		margin: 200px auto;
		background-color: #EEEEEE;
		opacity: 0.5;
		border-radius: 20px;
		border: 1px solid #112233;
		text-align: center;
		
	}
	</style>
</head>
<body onload="showFee();">
    <div>
		    班&nbsp&nbsp费：<input type="text" id="classfee">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button onclick="chargeFee1()">缴费</button><br />
		    学&nbsp&nbsp费：<input type="text" id="tuitionfee">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button onclick="chargeFee2()">缴费</button><br/>
		    饭&nbsp&nbsp卡：<input type="text" id="livefee">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button onclick="chargeFee3()">缴费</button><br/>
		    电&nbsp&nbsp费：<input type="text" id="dormfee">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button onclick="chargeFee4()">缴费</button><br />
	</div>
</body>
</html>
