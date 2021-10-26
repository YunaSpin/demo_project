<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.sql.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
</head>
<style>
    body
    {
        background: #00ADB5;
    }
    form
    {
        width: 530px;
        height: 100px;
        padding-top: 30px;
        margin: 200px auto;
        background-color: #EEEEEE;
        border-radius: 20px;
        border: 1px solid #112233;
    }
</style>
<body>
<script>
    var flag;

    function cliButton1(){
        var form=document.forms[0];
        form.action="PlaceRegister";
        form.submit();
    }

    function cliButton2(){
        var form=document.forms[0];
        form.action="OrderPlaceServe";
        form.submit();
    }

    function cliInputs1() {
        flag = document.getElementById("td_0").value;
        if (flag == "yes") {
            flag = "已预订";
        }else {
            flag = "未预定";
        }
        document.getElementById("WeiZhiNumber").value = "一号座"+flag;
    }
    function cliInputs2() {
        flag = document.getElementById("td_1").value;
        if (flag == "yes") {
            flag = "已预订";
        }else {
            flag = "未预定";
        }
        document.getElementById("WeiZhiNumber").value = "二号座"+flag;
    }
    function cliInputs3() {
        flag = document.getElementById("td_2").value;
        if (flag == "yes") {
            flag = "已预订";
        }else {
            flag = "未预定";
        }
        document.getElementById("WeiZhiNumber").value = "三号座"+flag;
    }
    function cliInputs4() {
        flag = document.getElementById("td_3").value;
        if (flag == "yes") {
            flag = "已预订";
        }else {
            flag = "未预定";
        }
        document.getElementById("WeiZhiNumber").value = "四号座"+flag;
    }
    function cliInputs5() {
        flag = document.getElementById("td_4").value;
        if (flag == "yes") {
            flag = "已预订";
        }else {
            flag = "未预定";
        }
        document.getElementById("WeiZhiNumber").value = "五号座"+flag;
    }
    function cliInputs6() {
        flag = document.getElementById("td_5").value;
        if (flag == "yes") {
            flag = "已预订";
        }else {
            flag = "未预定";
        }
        document.getElementById("WeiZhiNumber").value = "六号座"+flag;
    }
</script>

<style>
    {
        text-align: center;
    }
</style>
<form method="get">
    <table>
        <tr>
            <td><input type="text" class="inputs" id="td_0" name="td_0" value="${td_0}" onclick="cliInputs1()" readonly></td>
            <td><input type="text" class="inputs" id="td_1" name="td_1" value="${td_1}" onclick="cliInputs2()" readonly></td>
            <td><input type="text" class="inputs" id="td_2" name="td_2" value="${td_2}" onclick="cliInputs3()" readonly></td>
        </tr>
        <tr>
            <td><input type="text" class="inputs" id="td_3" name="td_3" value="${td_3}" onclick="cliInputs4()" readonly></td>
            <td><input type="text" class="inputs" id="td_4" name="td_4" value="${td_4}" onclick="cliInputs5()" readonly></td>
            <td><input type="text" class="inputs" id="td_5" name="td_5" value="${td_5}" onclick="cliInputs6()" readonly></td>
        </tr>
    </table>
    <input type="text" id="WeiZhiNumber" name="WeiZhiNumber" readonly>
    <input type="text" value="${pageNumber}" name="pageNumber" id="pageNumber">
    <button value="下一页" onclick="cliButton1()">下一页</button>
    <button value="预定" onclick="cliButton2()">预定</button>
</form>
</body>
</html>
