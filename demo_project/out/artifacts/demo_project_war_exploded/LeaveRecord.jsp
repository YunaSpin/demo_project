<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.sql.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>请假记录</title>
    <script>
        <%
            String number = request.getParameter("number");
        %>
        function shoeLeaveRecord() {
            var number = '<%=number%>'
            /*var date = document.getElementById("date");
            var reason = document.getElementById("reason");*/

            // alert(date + reason);
            var xmlhttp = new XMLHttpRequest();
            //2.设置请求方式和请求地址
            let url = "showleaverecord?number="+number
            xmlhttp.open("get", url);
            //3.发送请求
            xmlhttp.send();
            //4.监听状态的变化
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState === 4 && xmlhttp.status === 200){
                    var leaverecord = xmlhttp.responseText
                    var leaverecordarr = leaverecord.split("^");
                    // alert(leaverecordarr[0] + "    " + leaverecordarr[1])
                    var showleavearea = document.getElementById("showleave");
                    showleavearea.innerText = "";
                    for (var i = 0;i < leaverecordarr.length;i ++){
                        var onerecord = leaverecordarr[i];
                        var dividtimeandreason = onerecord.split("#");
                        var date = dividtimeandreason[0];
                        var reason =dividtimeandreason[1];
                        // alert(date +"jjj"+reason)
                        var labaldate = document.createElement("label")
                        labaldate.innerText = date;
                        var br1 = document.createElement("br");
                        var textareareason = document.createElement("textarea")
                        textareareason.cols = 30;
                        textareareason.rows = 4;
                        textareareason.value = reason;
                        var br2 = document.createElement("br");
                        var hr = document.createElement("hr");

                        showleavearea.appendChild(labaldate);
                        showleavearea.appendChild(br1);
                        showleavearea.appendChild(textareareason);
                        showleavearea.appendChild(br2);
                        showleavearea.appendChild(hr);
                        // showleavearea.appendChild(labaldate);
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
	
	div
	{
		width: 300px;
		/*height: 100px;*/
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
<body onload="shoeLeaveRecord()">
    <div id="showleave" >
        <label id="date">暂无请假记录</label><br>
        <textarea id="reason" cols="30" rows="4">暂无情急记录</textarea>
    </div>
</body>
</html>
