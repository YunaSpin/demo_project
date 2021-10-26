<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<meta charset="utf-8">
		<title>主界面</title>
		<script>
			<%
        		String number = request.getParameter("number");
    		%>
			function showPersonDate() {
				var number = '<%=number%>'
				var number1 = document.getElementById("number");
				var name = document.getElementById("name");
				var sex = document.getElementById("sex");
				var xmlhttp = new XMLHttpRequest();
				//2.设置请求方式和请求地址
				let url = "showpersondate?number="+number
				xmlhttp.open("get", url);
				//3.发送请求
				xmlhttp.send();
				//4.监听状态的变化
				xmlhttp.onreadystatechange = function () {
					if (xmlhttp.readyState === 4 && xmlhttp.status === 200){
						var persondate = xmlhttp.responseText
						var date = persondate.split(",")
						number1.value = date[0];
						name.value = date[1];
						sex.value = date[2]
					}
				}
			}

			function toPlace() {
				location.href = "loginPlacePage.jsp"
			}
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
		<style>
		/* 按钮样式 */
		.f_file {
		     width:100px;
		     text-align:center;
		     line-height:100%;
		     padding:0.3em;
		     font:16px Arial,sans-serif bold;
		     font-style:normal;
		     text-decoration:none;
		     margin:0px 20px;
			 position: absolute;
			 margin-left: 500px;
			 padding: 20px 0px;
		     vertical-align:text-bottom;
		     zoom:1;
		     outline:none;
		     font-size-adjust:none;
		     font-stretch:normal;
		     border-radius:50px;
		     box-shadow:0px 1px 2px rgba(0,0,0,0.2);
		     text-shadow:0px 1px 1px rgba(0,0,0,0.3);
		     color:pink;
		     border:0.2px solid #00ADB5;
		     background-repeat:repeat;
		     background-size:auto;
		     background-origin:padding-box;
		     background-clip:padding-box;
		     background-color:#000000;
		     background: linear-gradient(to bottom, #eeeff9 0%,#eeeeee 100%);
			/* overflow: hidden;
			 position:absolute;
			 			 
			 right:0;
			 			 
			 top:0;
			 			 
			 opacity: 0;
			 			 
			 filter:alpha(opacity=0);
			 			 
			 cursor:pointer; */
		}
		.yongyin:hover {
		    background: #268DFF;
		}
		*{
			margin: 0;
			padding: 0;
		}
		body{
			color: #112233;
		}
		.container{
			width: 1010px;
			margin: 0 auto;
			background-color: #aaa;
		}
		/* 设置左侧广告固定定位 */
		.ad{
			width: 100px;
			height: 100px;
			position: fixed;
			top: 100px;
			left: 30px;
		}
		.header{
			width: 1000px;
			height: 200px;
			margin: 5px;
			background-color: #123;
		}
		/* 设置图片的大小 */
		.pic img{
			width: 1000px;
			height: 200px;
		}
		
		.nav{
			width: 1000px;
			height: 30px;
			margin: 5px;
			background-color: #222831;
		}
		.navc{
			width: 600px;
			height: 30px;
			background-color: #00adb5;
			margin: 0 auto;
			padding-left: 140px;
		}
		.navc h3{
			padding:0px 0px;
		}
		li{
			float: left;
			text-align: center;
			margin:0 6px;
			list-style: none;/* 去除列表项前面的点 */
		}
		a{
			text-decoration: none;/* 去除超链接的下划线 */
			color: #fff;
			line-height: 30px;
		}
		a:hover{
			color: #9ac;
		}
		.content{
			width: 1000px;
			height: 800px;
			margin: 5px;
			background-color: #fff;
		}
		.left{
			width: 320px;
			height: 800px;
			margin-right: 5px;	
			float: left;
			background-color: #EEEEEE;
		}
		.left h2{
			display:inline-block;
			margin: 15px auto;
			color: black;
			text-align: center;
		}
		.header_sculpture
		{
			position: absolute;
			left: 200px;
			top:300px;
		}
		.head_sculpture_picture img{
			border-radius: 50%;
			overflow: hidden;
		}
		.personal_document
		{
			position: absolute;
			left: 200px;
			top: 550px;
			width: auto;
			height: auto;
		}
		/* td{
			text-align: center;
		} */
		.img{
			width: 100px;
			height: 100px;
			border: 12px solid #fff;
			border-radius: 5px;
			margin: 8px auto;
		}
		/* 图片旋转 */
		.l{
			transform: rotate(10deg);
		}
		.r{
			transform: rotate(-10deg);
		}
		.img img{
			width: 100px;
			height: 100px;
		}
		.img:hover{
			transform: rotate(10deg);
			transform: scale(1.2);
		}
		.right{
			width: 675px;
			height: 800px;
			float: left;
			background-color: #393e46;
		}
		.left h2{
			color: #00ADB5;
		}
		.main{
			width: 650px;
			height: 180px;
			margin: 20px;
			background-color: #00adb5;
		}
		.lpic{
			width: 150px;
			height: 178px;
			border: 1px dashed #000;
			float: left;
		}
		.lpic img{
			width: 140px;
			height: 170px;
			margin: 5px;
		}
		.rtext{
			width: 450px;
			height: 180px;
			float: left;
			margin: 0 20px;
		}
		.rtext h2{
			margin: 15px;
			color: #eeeeee;
		}
		.footer{
			width: 1000px;
			height: 60px;
			margin: 0 auto;
			background-color: #222831;
			text-align: center;
			line-height: 60px;
		}
		.footer h3{
			color: #EEEEEE;
		}
		.personal_document_head
		{
			text-align: center;
			font-size: 25px;
			font-family: "微软雅黑";
		}
		.personal_document_head span{
			color: #00ADB5;
		}
		
		 .fileInputContainer{
		
		            /*background:url();*/
		
		            position:relative;
		
		background-color:#f5f5f5; border:1px solid #CDCDCD;height:24px; width:70px; line-height:24px; text-align:center; font-size:12px
		
		        }
		
		        .fileInput{
		
		            overflow: hidden;
		
		            position:absolute;
		
		            right:0;
		
		            top:0;
		
		            opacity: 0;
		
		            filter:alpha(opacity=0);
		
		            cursor:pointer;
		
		        }
		
		.txt{ height:22px;line-height:23px; border:1px solid #cdcdcd; width:180px; position:absolute; left:90px; top:8px}
		
		.uploadBtn{ height:26px; line-height:26px;border:1px solid #cdcdcd; width:50px; text-align: center; position:absolute; left:280px; top:8px}
		</style>
	</head>
	<body onload="showPersonDate()">
		<div class="container">
			<!-- 广告
			<div class="ad">
				<img src="../img/QQ图片20211009212604.png" alt="">
			</div> -->
			<!-- 头部 -->
			<div class="header">
				<div class="pic">
					<img src="img/fu_ban.jpg" alt="" height="200px">
				</div>
			</div>
			<!-- 导航栏 -->
			<div class="nav">
				<div class="navc">
					<ul>
						<li><a onclick="toPlace()" href="#">
								<h3>场地申请 |</h3>
							</a>
						</li>
						<li><a onclick="toLeave()" href="#">
								<h3>请假 |</h3>
							</a>
						</li>
						<li><a onclick="toFee()" href="#">
								<h3>费用管理 |</h3>
							</a>
						</li>
						<li><a href="#">
								<h3>就业情况 |</h3>
							</a>
						</li>
						<li><a href="#">
								<h3>学校介绍 |</h3>
							</a>
						</li>
					</ul>
				</div>
				
			</div>
			<!-- 主体内容 -->
			<div class="content">
				<div class="left">
					<h2>智慧校园</h2><br><br><br>
					<!-- <div class="table">
						<table>
							<tr>
								<th></th>
								<th>拿铁</th>
								<th>卡布奇诺</th>
								<th>摩卡</th>
								<th>浓缩咖啡</th>
							</tr>
							<tr>
								<th></th>
								<th>Latte</th>
								<th>Cappuccino</th>
								<th>Mocha</th>
								<th>Espresso</th>
							</tr>
							<tr>
								<th>大杯</th>
								<td>35</td>
							    <td>35</td>
							    <td>35</td>
							    <td>30</td>
							</tr>
							<tr>
								<th>中杯</th>
								<td>30</td>
							    <td>30</td>
							    <td>30</td>
							    <td >25</td>
							</tr>
							<tr>
								<th>小杯</th>
								<td>25</td>
							    <td>25</td>
							    <td>25</td>
							    <td>20</td>
							</tr>
						</table>
					</div> -->
					<div class="header_sculpture">
						<a href="#">
							<div class="head_sculpture_picture">
								<img src="img/QQ图片20211009212604.png" width="180px" height="148px"/>
							</div>
						</a>
						<input type="file" value="上传头像" class="yongyin" onclick="alert('ceshi-custom')" style="width:100px; height:30px"/>
					</div>
					<div class="personal_document">
						<div class="personal_document_head">
							<span class="navspan"><img src="img/2001bcb26906488c8b8ecb508a4fa411.png" width="40px" height="40px"/>学生资料</span>
						</div>
						<div class=ppersonal_document_body>
							<div class="">
								学号：
								<input type="text" id="number" readonly="readonly" /><br /><br />
								姓名：
								<input type="text" id="name" readonly="readonly"/><br /><br />
								性别：
								<input type="text" id="sex" readonly="readonly"><br /><br />
								<button onclick="uplode()">完善资料</button>
							</div>
						</div>
					</div>
					<!-- <div class="img l">
						<img src="images/Mocha.jpg" alt="">
					</div>''
					<div class="img r">
						<img src="images/Latte.jpg" alt="">
					</div>
					<div class="img l">
						<img src="images/Espresso.jpg" alt="">
					</div>
					<div class="img r">
						<img src="images/Cappuccino.jpg" alt="">
					</div> -->
				</div>
				<div class="right">
					<div class="main">
						<div class="lpic">
							<img src="img/2y5striy41.jpg" alt="">
						</div>
						<div class="rtext">
							<a href="#">
								<h2>佳音在线</h2>
							</a>
					<p>【报佳音】第13届大广赛我校美院学子斩获一等奖<br>【报佳音】我校教师在成渝地区双城经济圈首届高校就业创业指导课程教学大赛中斩获一等奖<br>【报佳音】我校荣获重庆市2020年教育事业统计工作先进集体<br>【报佳音】我校八个专业通过教育部师范类专业二级认证</p>
						</div>
					</div>
					<div class="main">
						<div class="lpic">
							<img src="img/2ud2f0yyds.jpg" alt="">
						</div>
						<div class="rtext">
							<a href="#">
								<h2>专题聚焦</h2>
							</a>
					<p>【在“十九大”精神指引下】校党委书记曾礼教授讲授《习近平新时代中国特色社会主义思想》通选课第七期第一讲<br>【第一线】历史与社会学院党委举办党史学习教育专题读书班<br>【第一线】历史与社会学院党委召开理论学习中心组（扩大）学习会</p>
						</div>
					</div>
					<div class="main">
						<div class="lpic">
							<img src="img/3z1oswby6o.jpg" alt="">
						</div>
						<div class="rtext">
							<a href="#">
								<h2>学术动态</h2>
							</a>
					<p>【研学术】（第4期）暨重庆师范大学马克思主义学院第25届研究生学术活动月开设专题讲座<br>【研学术】国家杰青、重庆大学周小元教授受邀来校作经验分享<br>【研学术】我校化学学院王燚教授团队在心衰诊断方法学领域取得新进展</p>
						</div>
					</div>
					<div class="main">
						<div class="lpic">
							<img src="img/4fl3nx4y8h.jpg" alt="">
						</div>
						<div class="rtext">
							<a href="#">
								<h2>学科建设</h2>
							</a>
					<p>【建学科】重庆市学位办一行到我校智慧教育研究院调研<br>【建学科】贯彻落实研究生教育会议精神，强化学科建设核心抓手地——学校召开新学期学科建设与研究生教育工作会<br>【建学科】多样化平台建设助推学科发展——我校生命科学学院2个市级平台授牌</p>
						</div>
					</div>
				</div>
			</div>
			<!-- 尾部页脚 -->
			<div class="footer">
				<h3>学生管理系统</h3>
			</div>
		</div>
	</body>
</html>
