<%@page language="java" import="java.util.*" pageEncoding="gbk"%>
<html>
	<head>
		<title>����߿�����ģ�����С����̳</title>
		<link rel="stylesheet" type="text/css" href="CSS/Forum_login.css">
	</head>
	<body style = "background: url(images/Forum_login.jpg) no-repeat;
            	   background-size: 100% 100%;">
		<div id="main">
			<h1>Login</h1>
			<form action="Login.bin" method="post">
				<input type="hidden" name = "ss" value="">
				<input type="text" name="username" placeholder="�û���(����1-16λ)"><br/>
				<input type="password" name="password" placeholder="����(����1-16λ)"><br/>
				<input type="radio" name="user" value="Manager" >����Ա
				<input type="radio" name="user" value="Property" >��ҵ
       			<input type="radio" name="user" value="Owners" checked="checked">ҵ��<br><br>
				<input type="submit" value="��¼">
				<input type="reset" value="����">
			</form>
		</div>
	</body>
</html>
<script> 
	var errori ='<%=request.getParameter("error")%>';
	if(errori=='yes'){
		alert("�ʺŻ������������ȷ�����³���!");
		window.location.href="Forum_login.jsp"; 
	} else if(errori=='no1'){
		alert("�������ʺ�!");
		window.location.href="Forum_login.jsp"; 
	} else if(errori=='no2'){
		alert("����������!");
		window.location.href="Forum_login.jsp"; 
	} else if(errori=='no3'){
		alert("�ʺų��Ȳ��ܸ���16λ!");
		window.location.href="Forum_login.jsp"; 
	} else if(errori=='no4'){
		alert("���볤�Ȳ��ܸ���16λ!!");
		window.location.href="Forum_login.jsp"; 
	}
</script>