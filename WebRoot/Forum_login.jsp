<%@page language="java" import="java.util.*" pageEncoding="gbk"%>
<html>
	<head>
		<title>五年高考三年模拟别墅小区论坛</title>
		<link rel="stylesheet" type="text/css" href="CSS/Forum_login.css">
	</head>
	<body style = "background: url(images/Forum_login.jpg) no-repeat;
            	   background-size: 100% 100%;">
		<div id="main">
			<h1>Login</h1>
			<form action="Login.bin" method="post">
				<input type="hidden" name = "ss" value="">
				<input type="text" name="username" placeholder="用户名(长度1-16位)"><br/>
				<input type="password" name="password" placeholder="密码(长度1-16位)"><br/>
				<input type="radio" name="user" value="Manager" >管理员
				<input type="radio" name="user" value="Property" >物业
       			<input type="radio" name="user" value="Owners" checked="checked">业主<br><br>
				<input type="submit" value="登录">
				<input type="reset" value="重置">
			</form>
		</div>
	</body>
</html>
<script> 
	var errori ='<%=request.getParameter("error")%>';
	if(errori=='yes'){
		alert("帐号或密码错误，请点击确认重新尝试!");
		window.location.href="Forum_login.jsp"; 
	} else if(errori=='no1'){
		alert("请输入帐号!");
		window.location.href="Forum_login.jsp"; 
	} else if(errori=='no2'){
		alert("请输入密码!");
		window.location.href="Forum_login.jsp"; 
	} else if(errori=='no3'){
		alert("帐号长度不能高于16位!");
		window.location.href="Forum_login.jsp"; 
	} else if(errori=='no4'){
		alert("密码长度不能高于16位!!");
		window.location.href="Forum_login.jsp"; 
	}
</script>